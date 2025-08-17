/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "TransactionSQL.h"

@implementation TransactionSQL

+ (NSString*)getInsertSQL:(TransactionQuery*)transaction {
  NSString* ret = @""
    "insert into tn_mm_tx ("
    "  txid,"
    "  acctid,"
    "  txcat,"
    "  txtyp,"
    "  amount,"
    "  desc,"
    "  txdate"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:transaction.transactionId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:transaction.accountId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:transaction.transactionCategoryId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transaction.transactionType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDecimal:transaction.amount]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:transaction.description andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:transaction.transactionDate]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(TransactionQuery*)transaction {
  NSString* ret = @""
    "update tn_mm_tx set ";
  if (transaction.accountId != NSIntegerMin) {
    ret = [ret stringByAppendingFormat:@"acctid = %@, ", [MoneyManagerSQL escapeInteger:transaction.accountId]];
  }
  if (transaction.transactionCategoryId != NSIntegerMin) {
    ret = [ret stringByAppendingFormat:@"txcat = %@, ", [MoneyManagerSQL escapeInteger:transaction.transactionCategoryId]];
  }
  if (transaction.transactionType != nil) {
    ret = [ret stringByAppendingFormat:@"txtyp = %@, ", [MoneyManagerSQL escapeString:transaction.transactionType andVar:-1]];
  }
  if (transaction.amount != nil) {
    ret = [ret stringByAppendingFormat:@"amount = %@, ", [MoneyManagerSQL escapeDecimal:transaction.amount]];
  }
  if (transaction.description != nil) {
    ret = [ret stringByAppendingFormat:@"desc = %@, ", [MoneyManagerSQL escapeString:transaction.description andVar:-1]];
  }
  if (transaction.transactionDate != nil) {
    ret = [ret stringByAppendingFormat:@"txdate = %@ ", [MoneyManagerSQL escapeDate:transaction.transactionDate]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:transaction.transactionId];
  ret = [ret stringByAppendingFormat:@"and txid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(TransactionQuery*)transaction {
  NSString* ret = @""
    "delete from tn_mm_tx ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:transaction.transactionId];
  ret = [ret stringByAppendingFormat:@"and txid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(TransactionQuery*)transaction {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"tx.txid transactionId,"];
  sql = [sql stringByAppendingString:@"tx.acctid accountId,"];
  sql = [sql stringByAppendingString:@"tx.txcat transactionCategoryId,"];
  sql = [sql stringByAppendingString:@"tx.txtyp transactionType,"];
  sql = [sql stringByAppendingString:@"tx.amount amount,"];
  sql = [sql stringByAppendingString:@"tx.desc description,"];
  sql = [sql stringByAppendingString:@"tx.txdate transactionDate,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_tx tx "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (transaction.transactionId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.transactionId];
    sql = [sql stringByAppendingFormat:@"and tx.txid = %@ ", val];
  }
  if (transaction.transactionId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.transactionId0];
    sql = [sql stringByAppendingFormat:@"and tx.txid > %@ ", val];
  }
  if (transaction.transactionId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.transactionId1];
    sql = [sql stringByAppendingFormat:@"and tx.txid < %@ ", val];
  }
  if (transaction.accountId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.accountId];
    sql = [sql stringByAppendingFormat:@"and tx.acctid = %@ ", val];
  }
  if (transaction.accountId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.accountId0];
    sql = [sql stringByAppendingFormat:@"and tx.acctid > %@ ", val];
  }
  if (transaction.accountId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.accountId1];
    sql = [sql stringByAppendingFormat:@"and tx.acctid < %@ ", val];
  }
  if (transaction.transactionCategoryId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.transactionCategoryId];
    sql = [sql stringByAppendingFormat:@"and tx.txcat = %@ ", val];
  }
  if (transaction.transactionCategoryId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.transactionCategoryId0];
    sql = [sql stringByAppendingFormat:@"and tx.txcat > %@ ", val];
  }
  if (transaction.transactionCategoryId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:transaction.transactionCategoryId1];
    sql = [sql stringByAppendingFormat:@"and tx.txcat < %@ ", val];
  }
  if (transaction.transactionType != nil && transaction.transactionType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.transactionType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and tx.txtyp = %@ ", val];
  }
  if (transaction.transactionType0 != nil && transaction.transactionType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.transactionType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and tx.txtyp like %@ ", val];
  }
  if (transaction.transactionType1 != nil && transaction.transactionType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.transactionType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and tx.txtyp like %@ ", val];
  }
  if (transaction.transactionType2 != nil && transaction.transactionType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.transactionType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and tx.txtyp like %@ ", val];
  }
  if (transaction.description != nil && transaction.description.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.description andVar:-1];
    sql = [sql stringByAppendingFormat:@"and tx.desc = %@ ", val];
  }
  if (transaction.description0 != nil && transaction.description0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.description0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and tx.desc like %@ ", val];
  }
  if (transaction.description1 != nil && transaction.description1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.description1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and tx.desc like %@ ", val];
  }
  if (transaction.description2 != nil && transaction.description2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:transaction.description2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and tx.desc like %@ ", val];
  }
  return sql;
}

@end
