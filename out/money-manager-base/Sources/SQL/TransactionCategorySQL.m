/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "TransactionCategorySQL.h"

@implementation TransactionCategorySQL

+ (NSString*)getInsertSQL:(TransactionCategoryQuery*)transactionCategory {
  NSString* ret = @""
    "insert into tn_mm_txcat ("
    "  txcatid,"
    "  txcatnm,"
    "  txcattyp,"
    "  nt,"
    "  sta,"
    "  modid,"
    "  modtyp,"
    "  crttm,"
    "  lmt"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:transactionCategory.transactionCategoryId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryName andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transactionCategory.note andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeBool:transactionCategory.state]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transactionCategory.modifierId andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transactionCategory.modifierType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:transactionCategory.createdTime]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:transactionCategory.lastModifiedTime]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(TransactionCategoryQuery*)transactionCategory {
  NSString* ret = @""
    "update tn_mm_txcat set ";
  if (transactionCategory.transactionCategoryName != nil) {
    ret = [ret stringByAppendingFormat:@"txcatnm = %@, ", [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryName andVar:-1]];
  }
  if (transactionCategory.transactionCategoryType != nil) {
    ret = [ret stringByAppendingFormat:@"txcattyp = %@, ", [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryType andVar:-1]];
  }
  if (transactionCategory.note != nil) {
    ret = [ret stringByAppendingFormat:@"nt = %@, ", [MoneyManagerSQL escapeString:transactionCategory.note andVar:-1]];
  }
  ret = [ret stringByAppendingFormat:@"sta = %@, ", [MoneyManagerSQL escapeBool:transactionCategory.state]];
  if (transactionCategory.modifierId != nil) {
    ret = [ret stringByAppendingFormat:@"modid = %@, ", [MoneyManagerSQL escapeString:transactionCategory.modifierId andVar:-1]];
  }
  if (transactionCategory.modifierType != nil) {
    ret = [ret stringByAppendingFormat:@"modtyp = %@, ", [MoneyManagerSQL escapeString:transactionCategory.modifierType andVar:-1]];
  }
  if (transactionCategory.createdTime != nil) {
    ret = [ret stringByAppendingFormat:@"crttm = %@, ", [MoneyManagerSQL escapeDate:transactionCategory.createdTime]];
  }
  if (transactionCategory.lastModifiedTime != nil) {
    ret = [ret stringByAppendingFormat:@"lmt = %@ ", [MoneyManagerSQL escapeDate:transactionCategory.lastModifiedTime]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:transactionCategory.transactionCategoryId];
  ret = [ret stringByAppendingFormat:@"and txcatid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(TransactionCategoryQuery*)transactionCategory {
  NSString* ret = @""
    "delete from tn_mm_txcat ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:transactionCategory.transactionCategoryId];
  ret = [ret stringByAppendingFormat:@"and txcatid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(TransactionCategoryQuery*)transactionCategory {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"txcat.txcatid transactionCategoryId,"];
  sql = [sql stringByAppendingString:@"txcat.txcatnm transactionCategoryName,"];
  sql = [sql stringByAppendingString:@"txcat.txcattyp transactionCategoryType,"];
  sql = [sql stringByAppendingString:@"txcat.nt note,"];
  sql = [sql stringByAppendingString:@"txcat.sta state,"];
  sql = [sql stringByAppendingString:@"txcat.modid modifierId,"];
  sql = [sql stringByAppendingString:@"txcat.modtyp modifierType,"];
  sql = [sql stringByAppendingString:@"txcat.crttm createdTime,"];
  sql = [sql stringByAppendingString:@"txcat.lmt lastModifiedTime,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_txcat txcat "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (transactionCategory.transactionCategoryId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transactionCategory.transactionCategoryId];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatid = %@ ", val];
  }
  if (transactionCategory.transactionCategoryId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transactionCategory.transactionCategoryId0];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatid > %@ ", val];
  }
  if (transactionCategory.transactionCategoryId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transactionCategory.transactionCategoryId1];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatid < %@ ", val];
  }
  if (transactionCategory.transactionCategoryName != nil && transactionCategory.transactionCategoryName.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryName andVar:-1];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatnm = %@ ", val];
  }
  if (transactionCategory.transactionCategoryName0 != nil && transactionCategory.transactionCategoryName0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryName0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatnm like %@ ", val];
  }
  if (transactionCategory.transactionCategoryName1 != nil && transactionCategory.transactionCategoryName1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryName1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatnm like %@ ", val];
  }
  if (transactionCategory.transactionCategoryName2 != nil && transactionCategory.transactionCategoryName2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryName2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and txcat.txcatnm like %@ ", val];
  }
  if (transactionCategory.transactionCategoryType != nil && transactionCategory.transactionCategoryType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and txcat.txcattyp = %@ ", val];
  }
  if (transactionCategory.transactionCategoryType0 != nil && transactionCategory.transactionCategoryType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and txcat.txcattyp like %@ ", val];
  }
  if (transactionCategory.transactionCategoryType1 != nil && transactionCategory.transactionCategoryType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and txcat.txcattyp like %@ ", val];
  }
  if (transactionCategory.transactionCategoryType2 != nil && transactionCategory.transactionCategoryType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.transactionCategoryType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and txcat.txcattyp like %@ ", val];
  }
  if (transactionCategory.note != nil && transactionCategory.note.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.note andVar:-1];
    sql = [sql stringByAppendingFormat:@"and txcat.nt = %@ ", val];
  }
  if (transactionCategory.note0 != nil && transactionCategory.note0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.note0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and txcat.nt like %@ ", val];
  }
  if (transactionCategory.note1 != nil && transactionCategory.note1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.note1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and txcat.nt like %@ ", val];
  }
  if (transactionCategory.note2 != nil && transactionCategory.note2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.note2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and txcat.nt like %@ ", val];
  }
  if (transactionCategory.modifierId != nil && transactionCategory.modifierId.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierId andVar:-1];
    sql = [sql stringByAppendingFormat:@"and txcat.modid = %@ ", val];
  }
  if (transactionCategory.modifierId0 != nil && transactionCategory.modifierId0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierId0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and txcat.modid like %@ ", val];
  }
  if (transactionCategory.modifierId1 != nil && transactionCategory.modifierId1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierId1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and txcat.modid like %@ ", val];
  }
  if (transactionCategory.modifierId2 != nil && transactionCategory.modifierId2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierId2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and txcat.modid like %@ ", val];
  }
  if (transactionCategory.modifierType != nil && transactionCategory.modifierType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and txcat.modtyp = %@ ", val];
  }
  if (transactionCategory.modifierType0 != nil && transactionCategory.modifierType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and txcat.modtyp like %@ ", val];
  }
  if (transactionCategory.modifierType1 != nil && transactionCategory.modifierType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and txcat.modtyp like %@ ", val];
  }
  if (transactionCategory.modifierType2 != nil && transactionCategory.modifierType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transactionCategory.modifierType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and txcat.modtyp like %@ ", val];
  }
  return sql;
}

@end
