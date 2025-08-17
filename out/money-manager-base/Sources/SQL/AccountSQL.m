/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "AccountSQL.h"

@implementation AccountSQL

+ (NSString*)getInsertSQL:(AccountQuery*)account {
  NSString* ret = @""
    "insert into tn_mm_acct ("
    "  acctid,"
    "  acctcd,"
    "  acctnm,"
    "  accttyp,"
    "  cat,"
    "  nt,"
    "  sta,"
    "  modid,"
    "  modtyp,"
    "  crttm,"
    "  lmt"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:account.accountId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.accountCode andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.accountName andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.accountType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.category andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.note andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeBool:account.state]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.modifierId andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:account.modifierType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:account.createdTime]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:account.lastModifiedTime]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(AccountQuery*)account {
  NSString* ret = @""
    "update tn_mm_acct set ";
  if (account.accountCode != nil) {
    ret = [ret stringByAppendingFormat:@"acctcd = %@, ", [MoneyManagerSQL escapeString:account.accountCode andVar:-1]];
  }
  if (account.accountName != nil) {
    ret = [ret stringByAppendingFormat:@"acctnm = %@, ", [MoneyManagerSQL escapeString:account.accountName andVar:-1]];
  }
  if (account.accountType != nil) {
    ret = [ret stringByAppendingFormat:@"accttyp = %@, ", [MoneyManagerSQL escapeString:account.accountType andVar:-1]];
  }
  if (account.category != nil) {
    ret = [ret stringByAppendingFormat:@"cat = %@, ", [MoneyManagerSQL escapeString:account.category andVar:-1]];
  }
  if (account.note != nil) {
    ret = [ret stringByAppendingFormat:@"nt = %@, ", [MoneyManagerSQL escapeString:account.note andVar:-1]];
  }
  ret = [ret stringByAppendingFormat:@"sta = %@, ", [MoneyManagerSQL escapeBool:account.state]];
  if (account.modifierId != nil) {
    ret = [ret stringByAppendingFormat:@"modid = %@, ", [MoneyManagerSQL escapeString:account.modifierId andVar:-1]];
  }
  if (account.modifierType != nil) {
    ret = [ret stringByAppendingFormat:@"modtyp = %@, ", [MoneyManagerSQL escapeString:account.modifierType andVar:-1]];
  }
  if (account.createdTime != nil) {
    ret = [ret stringByAppendingFormat:@"crttm = %@, ", [MoneyManagerSQL escapeDate:account.createdTime]];
  }
  if (account.lastModifiedTime != nil) {
    ret = [ret stringByAppendingFormat:@"lmt = %@ ", [MoneyManagerSQL escapeDate:account.lastModifiedTime]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:account.accountId];
  ret = [ret stringByAppendingFormat:@"and acctid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(AccountQuery*)account {
  NSString* ret = @""
    "delete from tn_mm_acct ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:account.accountId];
  ret = [ret stringByAppendingFormat:@"and acctid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(AccountQuery*)account {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"acct.acctid accountId,"];
  sql = [sql stringByAppendingString:@"acct.acctcd accountCode,"];
  sql = [sql stringByAppendingString:@"acct.acctnm accountName,"];
  sql = [sql stringByAppendingString:@"acct.accttyp accountType,"];
  sql = [sql stringByAppendingString:@"acct.cat category,"];
  sql = [sql stringByAppendingString:@"acct.nt note,"];
  sql = [sql stringByAppendingString:@"acct.sta state,"];
  sql = [sql stringByAppendingString:@"acct.modid modifierId,"];
  sql = [sql stringByAppendingString:@"acct.modtyp modifierType,"];
  sql = [sql stringByAppendingString:@"acct.crttm createdTime,"];
  sql = [sql stringByAppendingString:@"acct.lmt lastModifiedTime,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_acct acct "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (account.accountId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:account.accountId];
    sql = [sql stringByAppendingFormat:@"and acct.acctid = %@ ", val];
  }
  if (account.accountId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:account.accountId0];
    sql = [sql stringByAppendingFormat:@"and acct.acctid > %@ ", val];
  }
  if (account.accountId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:account.accountId1];
    sql = [sql stringByAppendingFormat:@"and acct.acctid < %@ ", val];
  }
  if (account.accountCode != nil && account.accountCode.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountCode andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.acctcd = %@ ", val];
  }
  if (account.accountCode0 != nil && account.accountCode0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountCode0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.acctcd like %@ ", val];
  }
  if (account.accountCode1 != nil && account.accountCode1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountCode1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.acctcd like %@ ", val];
  }
  if (account.accountCode2 != nil && account.accountCode2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountCode2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.acctcd like %@ ", val];
  }
  if (account.accountName != nil && account.accountName.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountName andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.acctnm = %@ ", val];
  }
  if (account.accountName0 != nil && account.accountName0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountName0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.acctnm like %@ ", val];
  }
  if (account.accountName1 != nil && account.accountName1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountName1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.acctnm like %@ ", val];
  }
  if (account.accountName2 != nil && account.accountName2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountName2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.acctnm like %@ ", val];
  }
  if (account.accountType != nil && account.accountType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.accttyp = %@ ", val];
  }
  if (account.accountType0 != nil && account.accountType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.accttyp like %@ ", val];
  }
  if (account.accountType1 != nil && account.accountType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.accttyp like %@ ", val];
  }
  if (account.accountType2 != nil && account.accountType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.accountType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.accttyp like %@ ", val];
  }
  if (account.category != nil && account.category.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.category andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.cat = %@ ", val];
  }
  if (account.category0 != nil && account.category0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.category0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.cat like %@ ", val];
  }
  if (account.category1 != nil && account.category1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.category1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.cat like %@ ", val];
  }
  if (account.category2 != nil && account.category2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.category2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.cat like %@ ", val];
  }
  if (account.note != nil && account.note.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.note andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.nt = %@ ", val];
  }
  if (account.note0 != nil && account.note0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.note0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.nt like %@ ", val];
  }
  if (account.note1 != nil && account.note1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.note1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.nt like %@ ", val];
  }
  if (account.note2 != nil && account.note2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.note2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.nt like %@ ", val];
  }
  if (account.modifierId != nil && account.modifierId.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierId andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.modid = %@ ", val];
  }
  if (account.modifierId0 != nil && account.modifierId0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierId0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.modid like %@ ", val];
  }
  if (account.modifierId1 != nil && account.modifierId1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierId1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.modid like %@ ", val];
  }
  if (account.modifierId2 != nil && account.modifierId2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierId2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.modid like %@ ", val];
  }
  if (account.modifierType != nil && account.modifierType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and acct.modtyp = %@ ", val];
  }
  if (account.modifierType0 != nil && account.modifierType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and acct.modtyp like %@ ", val];
  }
  if (account.modifierType1 != nil && account.modifierType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and acct.modtyp like %@ ", val];
  }
  if (account.modifierType2 != nil && account.modifierType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:account.modifierType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and acct.modtyp like %@ ", val];
  }
  return sql;
}

@end
