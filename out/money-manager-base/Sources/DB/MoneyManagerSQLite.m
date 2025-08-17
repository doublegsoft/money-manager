/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <SQLite/sqlite3.h>
#import "MoneyManagerSQLite.h"
#import "SQL/MoneyManagerSQL.h"

@interface MoneyManagerSQLite() {
  sqlite3*          db;
}
@end

@implementation MoneyManagerSQLite

+ (MoneyManagerSQLite*)sharedInstance {
   static MoneyManagerSQLite *sharedInstance = nil;
   static dispatch_once_t onceToken;
   dispatch_once(&onceToken, ^{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    if ([paths count] > 0) {
      NSString* path = paths.firstObject;
      path = [path stringByAppendingString:@"/mm.db"];
      sharedInstance = [[self alloc] initWithPath:path];
    }
   });
   return sharedInstance;
 }

- (instancetype)initWithPath:(NSString*)path {
  assert(sqlite3_threadsafe());
  self = [super init];
  int rc = sqlite3_open([path UTF8String], &db);
  if (rc != SQLITE_OK) {
    NSLog(@"%@", [NSString stringWithFormat:@"error to open database (%d): %@", rc, path]);
  }
  return self;
}

- (void)installDatabase {
  NSError* error;
  [self createTableFamilyMember:&error];
  [self createTableAccount:&error];
  [self createTableBankAccount:&error];
  [self createTableTransaction:&error];
  [self createTableTransactionCategory:&error];
  [self createTableLedgerEntry:&error];
  [self createTableInvoice:&error];
}

- (void)beginTransaction {
  char* errMsg = NULL;
  sqlite3_exec(db, "BEGIN TRANSACTION", 0, 0, &errMsg);
}

- (void)commit {
  char* errMsg = NULL;
  sqlite3_exec(db, "COMMIT TRANSACTION", 0, 0, &errMsg);
}

- (void)rollback {
  char* errMsg = NULL;
  sqlite3_exec(db, "ROLLBACK TRANSACTION", 0, 0, &errMsg);
}

/*!
** 插入【家庭成员】数据。
*/
- (void)insertFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_fammbr (fammbrid,fammbrnm,bdt,natid,nt,sta,modid,modtyp,crttm,lmt)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.familyMemberId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.familyMemberId);    
  } 
  if (data.familyMemberName == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.familyMemberName UTF8String], -1, SQLITE_STATIC);
  }
  if (data.birthdate == nil) { 
    sqlite3_bind_null(stmt, 3); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 3, [[formatter stringFromDate:data.birthdate] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.nationalId == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.nationalId UTF8String], -1, SQLITE_STATIC);
  }
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 6, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 6, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 7);
  } else {
    sqlite3_bind_text(stmt, 7, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 8);
  } else {
    sqlite3_bind_text(stmt, 8, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 9); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 9, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 10); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 10, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【家庭成员】数据。
*/
- (void)updateFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_fammbr set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.familyMemberName != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"fammbrnm = ? "];
    updateColumnCount++;
  }  
  if (data.birthdate != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"bdt = ? "];
    updateColumnCount++;
  }  
  if (data.nationalId != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"natid = ? "];
    updateColumnCount++;
  }  
  if (data.note != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"nt = ? "];
    updateColumnCount++;
  }  
  if (data.state != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"sta = ? "];
    updateColumnCount++;
  }  
  if (data.modifierId != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modid = ? "];
    updateColumnCount++;
  }  
  if (data.modifierType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modtyp = ? "];
    updateColumnCount++;
  }  
  if (data.createdTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"crttm = ? "];
    updateColumnCount++;
  }  
  if (data.lastModifiedTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"lmt = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.familyMemberId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and fammbrid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.familyMemberName == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.familyMemberName UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.birthdate == nil) { 
    sqlite3_bind_null(stmt, 3); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 3, [[formatter stringFromDate:data.birthdate] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.nationalId == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.nationalId UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 6, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 6, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  paramIndex++;
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 7);
  } else {
    sqlite3_bind_text(stmt, 7, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 8);
  } else {
    sqlite3_bind_text(stmt, 8, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 9); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 9, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 10); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 10, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.familyMemberId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.familyMemberId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【家庭成员】数据。
*/
- (void)deleteFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_fammbr where 1 = 1 ";
  if (data.familyMemberId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and fammbrid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.familyMemberId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.familyMemberId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【家庭成员】数据。
*/
- (Pagination*)selectFamilyMember:(FamilyMemberQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【家庭成员】表结构。
*/
- (void)createTableFamilyMember:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_fammbr ("];
  sql = [sql stringByAppendingString:@"  fammbrid                 integer                  not null,"];
  sql = [sql stringByAppendingString:@"  fammbrnm                 text,"];
  sql = [sql stringByAppendingString:@"  bdt                      text,"];
  sql = [sql stringByAppendingString:@"  natid                    text,"];
  sql = [sql stringByAppendingString:@"  nt                       text,"];
  sql = [sql stringByAppendingString:@"  sta                      text,"];
  sql = [sql stringByAppendingString:@"  modid                    text,"];
  sql = [sql stringByAppendingString:@"  modtyp                   text,"];
  sql = [sql stringByAppendingString:@"  crttm                    text,"];
  sql = [sql stringByAppendingString:@"  lmt                      text,"];
  sql = [sql stringByAppendingString:@"  primary key (fammbrid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}

/*!
** 插入【账户】数据。
*/
- (void)insertAccount:(AccountQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_acct (acctid,acctcd,acctnm,accttyp,cat,nt,sta,modid,modtyp,crttm,lmt)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.accountId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.accountId);    
  } 
  if (data.accountCode == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.accountCode UTF8String], -1, SQLITE_STATIC);
  }
  if (data.accountName == nil) {  
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [data.accountName UTF8String], -1, SQLITE_STATIC);
  }
  if (data.accountType == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.accountType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.category == nil) {  
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [data.category UTF8String], -1, SQLITE_STATIC);
  }
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 7, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 7, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 8);
  } else {
    sqlite3_bind_text(stmt, 8, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 9);
  } else {
    sqlite3_bind_text(stmt, 9, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 10); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 10, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 11); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 11, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【账户】数据。
*/
- (void)updateAccount:(AccountQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_acct set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.accountCode != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"acctcd = ? "];
    updateColumnCount++;
  }  
  if (data.accountName != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"acctnm = ? "];
    updateColumnCount++;
  }  
  if (data.accountType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"accttyp = ? "];
    updateColumnCount++;
  }  
  if (data.category != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"cat = ? "];
    updateColumnCount++;
  }  
  if (data.note != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"nt = ? "];
    updateColumnCount++;
  }  
  if (data.state != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"sta = ? "];
    updateColumnCount++;
  }  
  if (data.modifierId != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modid = ? "];
    updateColumnCount++;
  }  
  if (data.modifierType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modtyp = ? "];
    updateColumnCount++;
  }  
  if (data.createdTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"crttm = ? "];
    updateColumnCount++;
  }  
  if (data.lastModifiedTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"lmt = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.accountId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and acctid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.accountCode == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.accountCode UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.accountName == nil) {  
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [data.accountName UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.accountType == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.accountType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.category == nil) {  
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [data.category UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 7, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 7, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  paramIndex++;
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 8);
  } else {
    sqlite3_bind_text(stmt, 8, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 9);
  } else {
    sqlite3_bind_text(stmt, 9, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 10); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 10, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 11); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 11, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.accountId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.accountId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【账户】数据。
*/
- (void)deleteAccount:(AccountQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_acct where 1 = 1 ";
  if (data.accountId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and acctid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.accountId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.accountId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【账户】数据。
*/
- (Pagination*)selectAccount:(AccountQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【账户】表结构。
*/
- (void)createTableAccount:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_acct ("];
  sql = [sql stringByAppendingString:@"  acctid                   integer                  not null,"];
  sql = [sql stringByAppendingString:@"  acctcd                   text,"];
  sql = [sql stringByAppendingString:@"  acctnm                   text,"];
  sql = [sql stringByAppendingString:@"  accttyp                  text,"];
  sql = [sql stringByAppendingString:@"  cat                      text,"];
  sql = [sql stringByAppendingString:@"  nt                       text,"];
  sql = [sql stringByAppendingString:@"  sta                      text,"];
  sql = [sql stringByAppendingString:@"  modid                    text,"];
  sql = [sql stringByAppendingString:@"  modtyp                   text,"];
  sql = [sql stringByAppendingString:@"  crttm                    text,"];
  sql = [sql stringByAppendingString:@"  lmt                      text,"];
  sql = [sql stringByAppendingString:@"  primary key (acctid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}

/*!
** 插入【银行账户】数据。
*/
- (void)insertBankAccount:(BankAccountQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_bnkacct (bnkacctid,bnkacctnm,bnkaccttyp,bnkacctno,bal,curr,effdt,expdt,nt,sta,modid,modtyp,crttm,lmt)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?,?,?,?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.bankAccountId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.bankAccountId);    
  } 
  if (data.bankAccountName == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.bankAccountName UTF8String], -1, SQLITE_STATIC);
  }
  if (data.bankAccountType == nil) {  
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [data.bankAccountType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.accountNumber == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.accountNumber UTF8String], -1, SQLITE_STATIC);
  }
  if (data.balance == nil) {    
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [[data.balance stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.currency == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.currency UTF8String], -1, SQLITE_STATIC);
  }
  if (data.effectiveDate == nil) { 
    sqlite3_bind_null(stmt, 7); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 7, [[formatter stringFromDate:data.effectiveDate] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.expirationDate == nil) { 
    sqlite3_bind_null(stmt, 8); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 8, [[formatter stringFromDate:data.expirationDate] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 9);
  } else {
    sqlite3_bind_text(stmt, 9, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 10, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 10, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 11);
  } else {
    sqlite3_bind_text(stmt, 11, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 12);
  } else {
    sqlite3_bind_text(stmt, 12, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 13); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 13, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 14); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 14, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【银行账户】数据。
*/
- (void)updateBankAccount:(BankAccountQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_bnkacct set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.bankAccountName != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"bnkacctnm = ? "];
    updateColumnCount++;
  }  
  if (data.bankAccountType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"bnkaccttyp = ? "];
    updateColumnCount++;
  }  
  if (data.accountNumber != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"bnkacctno = ? "];
    updateColumnCount++;
  }  
  if (data.balance != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"bal = ? "];
    updateColumnCount++;
  }  
  if (data.currency != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"curr = ? "];
    updateColumnCount++;
  }  
  if (data.effectiveDate != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"effdt = ? "];
    updateColumnCount++;
  }  
  if (data.expirationDate != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"expdt = ? "];
    updateColumnCount++;
  }  
  if (data.note != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"nt = ? "];
    updateColumnCount++;
  }  
  if (data.state != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"sta = ? "];
    updateColumnCount++;
  }  
  if (data.modifierId != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modid = ? "];
    updateColumnCount++;
  }  
  if (data.modifierType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modtyp = ? "];
    updateColumnCount++;
  }  
  if (data.createdTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"crttm = ? "];
    updateColumnCount++;
  }  
  if (data.lastModifiedTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"lmt = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.bankAccountId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and bnkacctid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.bankAccountName == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.bankAccountName UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.bankAccountType == nil) {  
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [data.bankAccountType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.accountNumber == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.accountNumber UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.balance == nil) {    
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [[data.balance stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.currency == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.currency UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.effectiveDate == nil) { 
    sqlite3_bind_null(stmt, 7); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 7, [[formatter stringFromDate:data.effectiveDate] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.expirationDate == nil) { 
    sqlite3_bind_null(stmt, 8); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 8, [[formatter stringFromDate:data.expirationDate] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 9);
  } else {
    sqlite3_bind_text(stmt, 9, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 10, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 10, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  paramIndex++;
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 11);
  } else {
    sqlite3_bind_text(stmt, 11, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 12);
  } else {
    sqlite3_bind_text(stmt, 12, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 13); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 13, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 14); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 14, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.bankAccountId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.bankAccountId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【银行账户】数据。
*/
- (void)deleteBankAccount:(BankAccountQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_bnkacct where 1 = 1 ";
  if (data.bankAccountId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and bnkacctid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.bankAccountId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.bankAccountId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【银行账户】数据。
*/
- (Pagination*)selectBankAccount:(BankAccountQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【银行账户】表结构。
*/
- (void)createTableBankAccount:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_bnkacct ("];
  sql = [sql stringByAppendingString:@"  bnkacctid                integer                  not null,"];
  sql = [sql stringByAppendingString:@"  bnkacctnm                text,"];
  sql = [sql stringByAppendingString:@"  bnkaccttyp               text,"];
  sql = [sql stringByAppendingString:@"  bnkacctno                text,"];
  sql = [sql stringByAppendingString:@"  bal                      text,"];
  sql = [sql stringByAppendingString:@"  curr                     text,"];
  sql = [sql stringByAppendingString:@"  effdt                    text,"];
  sql = [sql stringByAppendingString:@"  expdt                    text,"];
  sql = [sql stringByAppendingString:@"  nt                       text,"];
  sql = [sql stringByAppendingString:@"  sta                      text,"];
  sql = [sql stringByAppendingString:@"  modid                    text,"];
  sql = [sql stringByAppendingString:@"  modtyp                   text,"];
  sql = [sql stringByAppendingString:@"  crttm                    text,"];
  sql = [sql stringByAppendingString:@"  lmt                      text,"];
  sql = [sql stringByAppendingString:@"  primary key (bnkacctid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}

/*!
** 插入【交易】数据。
*/
- (void)insertTransaction:(TransactionQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_tx (txid,acctid,txcat,txtyp,amount,desc,txdate)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.transactionId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.transactionId);    
  } 
  if (data.accountId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 2);
  } else {  
    sqlite3_bind_int64(stmt, 2, data.accountId);    
  } 
  if (data.transactionCategoryId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 3);
  } else {  
    sqlite3_bind_int64(stmt, 3, data.transactionCategoryId);    
  } 
  if (data.transactionType == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.transactionType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.amount == nil) {    
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [[data.amount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.description == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.description UTF8String], -1, SQLITE_STATIC);
  }
  if (data.transactionDate == nil) { 
    sqlite3_bind_null(stmt, 7); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 7, [[formatter stringFromDate:data.transactionDate] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【交易】数据。
*/
- (void)updateTransaction:(TransactionQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_tx set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.accountId != NSIntegerMin) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"acctid = ? "];
    updateColumnCount++;
  }  
  if (data.transactionCategoryId != NSIntegerMin) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"txcat = ? "];
    updateColumnCount++;
  }  
  if (data.transactionType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"txtyp = ? "];
    updateColumnCount++;
  }  
  if (data.amount != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"amount = ? "];
    updateColumnCount++;
  }  
  if (data.description != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"desc = ? "];
    updateColumnCount++;
  }  
  if (data.transactionDate != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"txdate = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.transactionId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and txid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.accountId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 2);
  } else {  
    sqlite3_bind_int64(stmt, 2, data.accountId);    
  } 
  paramIndex++;
  if (data.transactionCategoryId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 3);
  } else {  
    sqlite3_bind_int64(stmt, 3, data.transactionCategoryId);    
  } 
  paramIndex++;
  if (data.transactionType == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.transactionType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.amount == nil) {    
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [[data.amount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.description == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.description UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.transactionDate == nil) { 
    sqlite3_bind_null(stmt, 7); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 7, [[formatter stringFromDate:data.transactionDate] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.transactionId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.transactionId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【交易】数据。
*/
- (void)deleteTransaction:(TransactionQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_tx where 1 = 1 ";
  if (data.transactionId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and txid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.transactionId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.transactionId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【交易】数据。
*/
- (Pagination*)selectTransaction:(TransactionQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【交易】表结构。
*/
- (void)createTableTransaction:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_tx ("];
  sql = [sql stringByAppendingString:@"  txid                     integer                  not null,"];
  sql = [sql stringByAppendingString:@"  acctid                   text,"];
  sql = [sql stringByAppendingString:@"  txcat                    text,"];
  sql = [sql stringByAppendingString:@"  txtyp                    text,"];
  sql = [sql stringByAppendingString:@"  amount                   text,"];
  sql = [sql stringByAppendingString:@"  desc                     text,"];
  sql = [sql stringByAppendingString:@"  txdate                   text,"];
  sql = [sql stringByAppendingString:@"  primary key (txid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}

/*!
** 插入【交易类别】数据。
*/
- (void)insertTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_txcat (txcatid,txcatnm,txcattyp,nt,sta,modid,modtyp,crttm,lmt)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.transactionCategoryId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.transactionCategoryId);    
  } 
  if (data.transactionCategoryName == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.transactionCategoryName UTF8String], -1, SQLITE_STATIC);
  }
  if (data.transactionCategoryType == nil) {  
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [data.transactionCategoryType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 5, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 5, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 7);
  } else {
    sqlite3_bind_text(stmt, 7, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 8); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 8, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 9); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 9, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【交易类别】数据。
*/
- (void)updateTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_txcat set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.transactionCategoryName != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"txcatnm = ? "];
    updateColumnCount++;
  }  
  if (data.transactionCategoryType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"txcattyp = ? "];
    updateColumnCount++;
  }  
  if (data.note != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"nt = ? "];
    updateColumnCount++;
  }  
  if (data.state != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"sta = ? "];
    updateColumnCount++;
  }  
  if (data.modifierId != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modid = ? "];
    updateColumnCount++;
  }  
  if (data.modifierType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modtyp = ? "];
    updateColumnCount++;
  }  
  if (data.createdTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"crttm = ? "];
    updateColumnCount++;
  }  
  if (data.lastModifiedTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"lmt = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.transactionCategoryId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and txcatid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.transactionCategoryName == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.transactionCategoryName UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.transactionCategoryType == nil) {  
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [data.transactionCategoryType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.note == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.note UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 5, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 5, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  paramIndex++;
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 7);
  } else {
    sqlite3_bind_text(stmt, 7, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 8); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 8, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 9); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 9, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.transactionCategoryId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.transactionCategoryId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【交易类别】数据。
*/
- (void)deleteTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_txcat where 1 = 1 ";
  if (data.transactionCategoryId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and txcatid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.transactionCategoryId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.transactionCategoryId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【交易类别】数据。
*/
- (Pagination*)selectTransactionCategory:(TransactionCategoryQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【交易类别】表结构。
*/
- (void)createTableTransactionCategory:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_txcat ("];
  sql = [sql stringByAppendingString:@"  txcatid                  integer                  not null,"];
  sql = [sql stringByAppendingString:@"  txcatnm                  text,"];
  sql = [sql stringByAppendingString:@"  txcattyp                 text,"];
  sql = [sql stringByAppendingString:@"  nt                       text,"];
  sql = [sql stringByAppendingString:@"  sta                      text,"];
  sql = [sql stringByAppendingString:@"  modid                    text,"];
  sql = [sql stringByAppendingString:@"  modtyp                   text,"];
  sql = [sql stringByAppendingString:@"  crttm                    text,"];
  sql = [sql stringByAppendingString:@"  lmt                      text,"];
  sql = [sql stringByAppendingString:@"  primary key (txcatid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}

/*!
** 插入【记账登记】数据。
*/
- (void)insertLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_ldgrent (ldgrentid,acctid,txid,entdt,descr,cramt,dramt,sta,modid,modtyp,crttm,lmt)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?,?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.ledgerEntryId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.ledgerEntryId);    
  } 
  if (data.accountId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 2);
  } else {  
    sqlite3_bind_int64(stmt, 2, data.accountId);    
  } 
  if (data.transactionId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 3);
  } else {  
    sqlite3_bind_int64(stmt, 3, data.transactionId);    
  } 
  if (data.entryDate == nil) { 
    sqlite3_bind_null(stmt, 4); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 4, [[formatter stringFromDate:data.entryDate] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.description == nil) {  
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [data.description UTF8String], -1, SQLITE_STATIC);
  }
  if (data.creditAmount == nil) {    
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [[data.creditAmount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.debitAmount == nil) {    
    sqlite3_bind_null(stmt, 7);
  } else {
    sqlite3_bind_text(stmt, 7, [[data.debitAmount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 8, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 8, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 9);
  } else {
    sqlite3_bind_text(stmt, 9, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 10);
  } else {
    sqlite3_bind_text(stmt, 10, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 11); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 11, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 12); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 12, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【记账登记】数据。
*/
- (void)updateLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_ldgrent set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.accountId != NSIntegerMin) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"acctid = ? "];
    updateColumnCount++;
  }  
  if (data.transactionId != NSIntegerMin) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"txid = ? "];
    updateColumnCount++;
  }  
  if (data.entryDate != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"entdt = ? "];
    updateColumnCount++;
  }  
  if (data.description != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"descr = ? "];
    updateColumnCount++;
  }  
  if (data.creditAmount != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"cramt = ? "];
    updateColumnCount++;
  }  
  if (data.debitAmount != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"dramt = ? "];
    updateColumnCount++;
  }  
  if (data.state != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"sta = ? "];
    updateColumnCount++;
  }  
  if (data.modifierId != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modid = ? "];
    updateColumnCount++;
  }  
  if (data.modifierType != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"modtyp = ? "];
    updateColumnCount++;
  }  
  if (data.createdTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"crttm = ? "];
    updateColumnCount++;
  }  
  if (data.lastModifiedTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"lmt = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.ledgerEntryId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and ldgrentid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.accountId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 2);
  } else {  
    sqlite3_bind_int64(stmt, 2, data.accountId);    
  } 
  paramIndex++;
  if (data.transactionId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 3);
  } else {  
    sqlite3_bind_int64(stmt, 3, data.transactionId);    
  } 
  paramIndex++;
  if (data.entryDate == nil) { 
    sqlite3_bind_null(stmt, 4); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 4, [[formatter stringFromDate:data.entryDate] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.description == nil) {  
    sqlite3_bind_null(stmt, 5);
  } else {
    sqlite3_bind_text(stmt, 5, [data.description UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.creditAmount == nil) {    
    sqlite3_bind_null(stmt, 6);
  } else {
    sqlite3_bind_text(stmt, 6, [[data.creditAmount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.debitAmount == nil) {    
    sqlite3_bind_null(stmt, 7);
  } else {
    sqlite3_bind_text(stmt, 7, [[data.debitAmount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.state == YES) {
    sqlite3_bind_text(stmt, 8, [@"T" UTF8String], -1, SQLITE_STATIC);     
  } else {
    sqlite3_bind_text(stmt, 8, [@"F" UTF8String], -1, SQLITE_STATIC);     
  }
  paramIndex++;
  if (data.modifierId == nil) {  
    sqlite3_bind_null(stmt, 9);
  } else {
    sqlite3_bind_text(stmt, 9, [data.modifierId UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.modifierType == nil) {  
    sqlite3_bind_null(stmt, 10);
  } else {
    sqlite3_bind_text(stmt, 10, [data.modifierType UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 11); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 11, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.lastModifiedTime == nil) { 
    sqlite3_bind_null(stmt, 12); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 12, [[formatter stringFromDate:data.lastModifiedTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.ledgerEntryId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.ledgerEntryId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【记账登记】数据。
*/
- (void)deleteLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_ldgrent where 1 = 1 ";
  if (data.ledgerEntryId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and ldgrentid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.ledgerEntryId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.ledgerEntryId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【记账登记】数据。
*/
- (Pagination*)selectLedgerEntry:(LedgerEntryQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【记账登记】表结构。
*/
- (void)createTableLedgerEntry:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_ldgrent ("];
  sql = [sql stringByAppendingString:@"  ldgrentid                integer                  not null,"];
  sql = [sql stringByAppendingString:@"  acctid                   text,"];
  sql = [sql stringByAppendingString:@"  txid                     text,"];
  sql = [sql stringByAppendingString:@"  entdt                    text,"];
  sql = [sql stringByAppendingString:@"  descr                    text,"];
  sql = [sql stringByAppendingString:@"  cramt                    text,"];
  sql = [sql stringByAppendingString:@"  dramt                    text,"];
  sql = [sql stringByAppendingString:@"  sta                      text,"];
  sql = [sql stringByAppendingString:@"  modid                    text,"];
  sql = [sql stringByAppendingString:@"  modtyp                   text,"];
  sql = [sql stringByAppendingString:@"  crttm                    text,"];
  sql = [sql stringByAppendingString:@"  lmt                      text,"];
  sql = [sql stringByAppendingString:@"  primary key (ldgrentid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}

/*!
** 插入【发票】数据。
*/
- (void)insertInvoice:(InvoiceQuery*)data ifError:(NSError**)error {
  NSString* sql = @"insert into tn_mm_inv (invid,invnum,amount,status,duedate,crttm)";
  sql = [sql stringByAppendingString:@"values (?,?,?,?,?,?);"];
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  
  if (data.invoiceId == NSIntegerMin) {
    sqlite3_bind_null(stmt, 1);
  } else {  
    sqlite3_bind_int64(stmt, 1, data.invoiceId);    
  } 
  if (data.invoiceNumber == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.invoiceNumber UTF8String], -1, SQLITE_STATIC);
  }
  if (data.amount == nil) {    
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [[data.amount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.status == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.status UTF8String], -1, SQLITE_STATIC);
  }
  if (data.dueDate == nil) { 
    sqlite3_bind_null(stmt, 5); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 5, [[formatter stringFromDate:data.dueDate] UTF8String], -1, SQLITE_STATIC);
  }
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 6); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 6, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 更新【发票】数据。
*/
- (void)updateInvoice:(InvoiceQuery*)data ifError:(NSError**)error {
  int updateColumnCount = 0;
  int primaryKeyCount = 0;
  int paramIndex = 0;
  NSString* sql = @"update tn_mm_inv set ";
  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;

  if (data.invoiceNumber != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"invnum = ? "];
    updateColumnCount++;
  }  
  if (data.amount != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"amount = ? "];
    updateColumnCount++;
  }  
  if (data.status != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"status = ? "];
    updateColumnCount++;
  }  
  if (data.dueDate != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"duedate = ? "];
    updateColumnCount++;
  }  
  if (data.createdTime != nil) {  
    if (updateColumnCount > 0) {
      sql = [sql stringByAppendingString:@","];
    }
    sql = [sql stringByAppendingString:@"crttm = ? "];
    updateColumnCount++;
  }  

  if (updateColumnCount == 0) {
    NSString* errorMessage = @"no column found to update";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_NO_COLUMN_UPDATE
                             userInfo:userInfo];
    return;
  }

  sql = [sql stringByAppendingString:@"where 1 = 1 "];

  if (data.invoiceId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and invid = ? "];
    primaryKeyCount++;
  }
  if (primaryKeyCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND 
                             userInfo:userInfo];
    return;
  }
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 

  if (data.invoiceNumber == nil) {  
    sqlite3_bind_null(stmt, 2);
  } else {
    sqlite3_bind_text(stmt, 2, [data.invoiceNumber UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.amount == nil) {    
    sqlite3_bind_null(stmt, 3);
  } else {
    sqlite3_bind_text(stmt, 3, [[data.amount stringValue] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.status == nil) {  
    sqlite3_bind_null(stmt, 4);
  } else {
    sqlite3_bind_text(stmt, 4, [data.status UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.dueDate == nil) { 
    sqlite3_bind_null(stmt, 5); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 5, [[formatter stringFromDate:data.dueDate] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.createdTime == nil) { 
    sqlite3_bind_null(stmt, 6); 
  } else {  
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    sqlite3_bind_text(stmt, 6, [[formatter stringFromDate:data.createdTime] UTF8String], -1, SQLITE_STATIC);
  }
  paramIndex++;
  if (data.invoiceId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.invoiceId);
    paramIndex++;
  }

  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 删除【发票】数据。
*/
- (void)deleteInvoice:(InvoiceQuery*)data ifError:(NSError**)error {
  int paramIndex = 0;
  int paramCount = 0;
  NSString* sql = @"delete from tn_mm_inv where 1 = 1 ";
  if (data.invoiceId != NSIntegerMin) {  
    sql = [sql stringByAppendingString:@"and invid = ? "];
    paramCount++;
  }  

  if (paramCount == 0) {
    NSString* errorMessage = @"no primary key found";
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:_SQL_ERROR_PRIMARY_KEY_NOT_FOUND
                             userInfo:userInfo];
    return;
  }

  sqlite3_stmt*         stmt;
  int rc = _SQL_ERROR_SUCCESS;
  
  rc = sqlite3_prepare_v2(db, [sql UTF8String], -1, &stmt, 0);                         
  if (rc)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
    return;
  } 
  if (data.invoiceId != NSIntegerMin) {  
    sqlite3_bind_int64(stmt, paramIndex + 1, data.invoiceId);
    paramIndex++;
  }  
  
  rc = sqlite3_step(stmt);
  if (rc && rc != SQLITE_DONE)
  {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];
  }
  sqlite3_finalize(stmt);
}

/*!
** 查询【发票】数据。
*/
- (Pagination*)selectInvoice:(InvoiceQuery*)data ifError:(NSError**)error {
  Pagination* ret = [[Pagination alloc] init];
  return ret;
}

/*!
** 创建【发票】表结构。
*/
- (void)createTableInvoice:(NSError**)error {
  NSString* sql = @"";
  sql = [sql stringByAppendingString:@"create table if not exists tn_mm_inv ("];
  sql = [sql stringByAppendingString:@"  invid                    integer                  not null,"];
  sql = [sql stringByAppendingString:@"  invnum                   text,"];
  sql = [sql stringByAppendingString:@"  amount                   text,"];
  sql = [sql stringByAppendingString:@"  status                   text,"];
  sql = [sql stringByAppendingString:@"  duedate                  text,"];
  sql = [sql stringByAppendingString:@"  crttm                    text,"];
  sql = [sql stringByAppendingString:@"  primary key (invid)"];
  sql = [sql stringByAppendingString:@");"];
  int rc = sqlite3_exec(db, [sql UTF8String], NULL, NULL, NULL);
  if (rc != SQLITE_OK) {
    NSString* errorMessage = [NSString stringWithUTF8String:sqlite3_errmsg(db)];
    NSDictionary* userInfo = @{NSLocalizedDescriptionKey: errorMessage};
    *error = [NSError errorWithDomain:@"money-manager"
                                 code:rc
                             userInfo:userInfo];

  }
}
@end
