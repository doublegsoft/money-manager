/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "LedgerEntrySQL.h"

@implementation LedgerEntrySQL

+ (NSString*)getInsertSQL:(LedgerEntryQuery*)ledgerEntry {
  NSString* ret = @""
    "insert into tn_mm_ldgrent ("
    "  ldgrentid,"
    "  acctid,"
    "  txid,"
    "  entdt,"
    "  descr,"
    "  cramt,"
    "  dramt,"
    "  sta,"
    "  modid,"
    "  modtyp,"
    "  crttm,"
    "  lmt"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:ledgerEntry.ledgerEntryId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:ledgerEntry.accountId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:ledgerEntry.transactionId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:ledgerEntry.entryDate]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:ledgerEntry.description andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDecimal:ledgerEntry.creditAmount]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDecimal:ledgerEntry.debitAmount]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeBool:ledgerEntry.state]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:ledgerEntry.modifierId andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:ledgerEntry.modifierType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:ledgerEntry.createdTime]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:ledgerEntry.lastModifiedTime]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(LedgerEntryQuery*)ledgerEntry {
  NSString* ret = @""
    "update tn_mm_ldgrent set ";
  if (ledgerEntry.accountId != NSIntegerMin) {
    ret = [ret stringByAppendingFormat:@"acctid = %@, ", [MoneyManagerSQL escapeInteger:ledgerEntry.accountId]];
  }
  if (ledgerEntry.transactionId != NSIntegerMin) {
    ret = [ret stringByAppendingFormat:@"txid = %@, ", [MoneyManagerSQL escapeInteger:ledgerEntry.transactionId]];
  }
  if (ledgerEntry.entryDate != nil) {
    ret = [ret stringByAppendingFormat:@"entdt = %@, ", [MoneyManagerSQL escapeDate:ledgerEntry.entryDate]];
  }
  if (ledgerEntry.description != nil) {
    ret = [ret stringByAppendingFormat:@"descr = %@, ", [MoneyManagerSQL escapeString:ledgerEntry.description andVar:-1]];
  }
  if (ledgerEntry.creditAmount != nil) {
    ret = [ret stringByAppendingFormat:@"cramt = %@, ", [MoneyManagerSQL escapeDecimal:ledgerEntry.creditAmount]];
  }
  if (ledgerEntry.debitAmount != nil) {
    ret = [ret stringByAppendingFormat:@"dramt = %@, ", [MoneyManagerSQL escapeDecimal:ledgerEntry.debitAmount]];
  }
  ret = [ret stringByAppendingFormat:@"sta = %@, ", [MoneyManagerSQL escapeBool:ledgerEntry.state]];
  if (ledgerEntry.modifierId != nil) {
    ret = [ret stringByAppendingFormat:@"modid = %@, ", [MoneyManagerSQL escapeString:ledgerEntry.modifierId andVar:-1]];
  }
  if (ledgerEntry.modifierType != nil) {
    ret = [ret stringByAppendingFormat:@"modtyp = %@, ", [MoneyManagerSQL escapeString:ledgerEntry.modifierType andVar:-1]];
  }
  if (ledgerEntry.createdTime != nil) {
    ret = [ret stringByAppendingFormat:@"crttm = %@, ", [MoneyManagerSQL escapeDate:ledgerEntry.createdTime]];
  }
  if (ledgerEntry.lastModifiedTime != nil) {
    ret = [ret stringByAppendingFormat:@"lmt = %@ ", [MoneyManagerSQL escapeDate:ledgerEntry.lastModifiedTime]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:ledgerEntry.ledgerEntryId];
  ret = [ret stringByAppendingFormat:@"and ldgrentid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(LedgerEntryQuery*)ledgerEntry {
  NSString* ret = @""
    "delete from tn_mm_ldgrent ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:ledgerEntry.ledgerEntryId];
  ret = [ret stringByAppendingFormat:@"and ldgrentid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(LedgerEntryQuery*)ledgerEntry {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"ldgrent.ldgrentid ledgerEntryId,"];
  sql = [sql stringByAppendingString:@"ldgrent.acctid accountId,"];
  sql = [sql stringByAppendingString:@"ldgrent.txid transactionId,"];
  sql = [sql stringByAppendingString:@"ldgrent.entdt entryDate,"];
  sql = [sql stringByAppendingString:@"ldgrent.descr description,"];
  sql = [sql stringByAppendingString:@"ldgrent.cramt creditAmount,"];
  sql = [sql stringByAppendingString:@"ldgrent.dramt debitAmount,"];
  sql = [sql stringByAppendingString:@"ldgrent.sta state,"];
  sql = [sql stringByAppendingString:@"ldgrent.modid modifierId,"];
  sql = [sql stringByAppendingString:@"ldgrent.modtyp modifierType,"];
  sql = [sql stringByAppendingString:@"ldgrent.crttm createdTime,"];
  sql = [sql stringByAppendingString:@"ldgrent.lmt lastModifiedTime,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_ldgrent ldgrent "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (ledgerEntry.ledgerEntryId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.ledgerEntryId];
    sql = [sql stringByAppendingFormat:@"and ldgrent.ldgrentid = %@ ", val];
  }
  if (ledgerEntry.ledgerEntryId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.ledgerEntryId0];
    sql = [sql stringByAppendingFormat:@"and ldgrent.ldgrentid > %@ ", val];
  }
  if (ledgerEntry.ledgerEntryId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.ledgerEntryId1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.ldgrentid < %@ ", val];
  }
  if (ledgerEntry.accountId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.accountId];
    sql = [sql stringByAppendingFormat:@"and ldgrent.acctid = %@ ", val];
  }
  if (ledgerEntry.accountId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.accountId0];
    sql = [sql stringByAppendingFormat:@"and ldgrent.acctid > %@ ", val];
  }
  if (ledgerEntry.accountId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.accountId1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.acctid < %@ ", val];
  }
  if (ledgerEntry.transactionId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.transactionId];
    sql = [sql stringByAppendingFormat:@"and ldgrent.txid = %@ ", val];
  }
  if (ledgerEntry.transactionId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.transactionId0];
    sql = [sql stringByAppendingFormat:@"and ldgrent.txid > %@ ", val];
  }
  if (ledgerEntry.transactionId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:ledgerEntry.transactionId1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.txid < %@ ", val];
  }
  if (ledgerEntry.description != nil && ledgerEntry.description.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.description andVar:-1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.descr = %@ ", val];
  }
  if (ledgerEntry.description0 != nil && ledgerEntry.description0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.description0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and ldgrent.descr like %@ ", val];
  }
  if (ledgerEntry.description1 != nil && ledgerEntry.description1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.description1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.descr like %@ ", val];
  }
  if (ledgerEntry.description2 != nil && ledgerEntry.description2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.description2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and ldgrent.descr like %@ ", val];
  }
  if (ledgerEntry.modifierId != nil && ledgerEntry.modifierId.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierId andVar:-1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modid = %@ ", val];
  }
  if (ledgerEntry.modifierId0 != nil && ledgerEntry.modifierId0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierId0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modid like %@ ", val];
  }
  if (ledgerEntry.modifierId1 != nil && ledgerEntry.modifierId1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierId1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modid like %@ ", val];
  }
  if (ledgerEntry.modifierId2 != nil && ledgerEntry.modifierId2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierId2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modid like %@ ", val];
  }
  if (ledgerEntry.modifierType != nil && ledgerEntry.modifierType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modtyp = %@ ", val];
  }
  if (ledgerEntry.modifierType0 != nil && ledgerEntry.modifierType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modtyp like %@ ", val];
  }
  if (ledgerEntry.modifierType1 != nil && ledgerEntry.modifierType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modtyp like %@ ", val];
  }
  if (ledgerEntry.modifierType2 != nil && ledgerEntry.modifierType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:ledgerEntry.modifierType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and ldgrent.modtyp like %@ ", val];
  }
  return sql;
}

@end
