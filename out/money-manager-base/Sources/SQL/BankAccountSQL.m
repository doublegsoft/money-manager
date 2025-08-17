/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "BankAccountSQL.h"

@implementation BankAccountSQL

+ (NSString*)getInsertSQL:(BankAccountQuery*)bankAccount {
  NSString* ret = @""
    "insert into tn_mm_bnkacct ("
    "  bnkacctid,"
    "  bnkacctnm,"
    "  bnkaccttyp,"
    "  bnkacctno,"
    "  bal,"
    "  curr,"
    "  effdt,"
    "  expdt,"
    "  nt,"
    "  sta,"
    "  modid,"
    "  modtyp,"
    "  crttm,"
    "  lmt"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:bankAccount.bankAccountId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.bankAccountName andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.bankAccountType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.accountNumber andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDecimal:bankAccount.balance]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.currency andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:bankAccount.effectiveDate]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:bankAccount.expirationDate]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.note andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeBool:bankAccount.state]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.modifierId andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:bankAccount.modifierType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:bankAccount.createdTime]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:bankAccount.lastModifiedTime]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(BankAccountQuery*)bankAccount {
  NSString* ret = @""
    "update tn_mm_bnkacct set ";
  if (bankAccount.bankAccountName != nil) {
    ret = [ret stringByAppendingFormat:@"bnkacctnm = %@, ", [MoneyManagerSQL escapeString:bankAccount.bankAccountName andVar:-1]];
  }
  if (bankAccount.bankAccountType != nil) {
    ret = [ret stringByAppendingFormat:@"bnkaccttyp = %@, ", [MoneyManagerSQL escapeString:bankAccount.bankAccountType andVar:-1]];
  }
  if (bankAccount.accountNumber != nil) {
    ret = [ret stringByAppendingFormat:@"bnkacctno = %@, ", [MoneyManagerSQL escapeString:bankAccount.accountNumber andVar:-1]];
  }
  if (bankAccount.balance != nil) {
    ret = [ret stringByAppendingFormat:@"bal = %@, ", [MoneyManagerSQL escapeDecimal:bankAccount.balance]];
  }
  if (bankAccount.currency != nil) {
    ret = [ret stringByAppendingFormat:@"curr = %@, ", [MoneyManagerSQL escapeString:bankAccount.currency andVar:-1]];
  }
  if (bankAccount.effectiveDate != nil) {
    ret = [ret stringByAppendingFormat:@"effdt = %@, ", [MoneyManagerSQL escapeDate:bankAccount.effectiveDate]];
  }
  if (bankAccount.expirationDate != nil) {
    ret = [ret stringByAppendingFormat:@"expdt = %@, ", [MoneyManagerSQL escapeDate:bankAccount.expirationDate]];
  }
  if (bankAccount.note != nil) {
    ret = [ret stringByAppendingFormat:@"nt = %@, ", [MoneyManagerSQL escapeString:bankAccount.note andVar:-1]];
  }
  ret = [ret stringByAppendingFormat:@"sta = %@, ", [MoneyManagerSQL escapeBool:bankAccount.state]];
  if (bankAccount.modifierId != nil) {
    ret = [ret stringByAppendingFormat:@"modid = %@, ", [MoneyManagerSQL escapeString:bankAccount.modifierId andVar:-1]];
  }
  if (bankAccount.modifierType != nil) {
    ret = [ret stringByAppendingFormat:@"modtyp = %@, ", [MoneyManagerSQL escapeString:bankAccount.modifierType andVar:-1]];
  }
  if (bankAccount.createdTime != nil) {
    ret = [ret stringByAppendingFormat:@"crttm = %@, ", [MoneyManagerSQL escapeDate:bankAccount.createdTime]];
  }
  if (bankAccount.lastModifiedTime != nil) {
    ret = [ret stringByAppendingFormat:@"lmt = %@ ", [MoneyManagerSQL escapeDate:bankAccount.lastModifiedTime]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:bankAccount.bankAccountId];
  ret = [ret stringByAppendingFormat:@"and bnkacctid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(BankAccountQuery*)bankAccount {
  NSString* ret = @""
    "delete from tn_mm_bnkacct ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:bankAccount.bankAccountId];
  ret = [ret stringByAppendingFormat:@"and bnkacctid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(BankAccountQuery*)bankAccount {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"bnkacct.bnkacctid bankAccountId,"];
  sql = [sql stringByAppendingString:@"bnkacct.bnkacctnm bankAccountName,"];
  sql = [sql stringByAppendingString:@"bnkacct.bnkaccttyp bankAccountType,"];
  sql = [sql stringByAppendingString:@"bnkacct.bnkacctno accountNumber,"];
  sql = [sql stringByAppendingString:@"bnkacct.bal balance,"];
  sql = [sql stringByAppendingString:@"bnkacct.curr currency,"];
  sql = [sql stringByAppendingString:@"bnkacct.effdt effectiveDate,"];
  sql = [sql stringByAppendingString:@"bnkacct.expdt expirationDate,"];
  sql = [sql stringByAppendingString:@"bnkacct.nt note,"];
  sql = [sql stringByAppendingString:@"bnkacct.sta state,"];
  sql = [sql stringByAppendingString:@"bnkacct.modid modifierId,"];
  sql = [sql stringByAppendingString:@"bnkacct.modtyp modifierType,"];
  sql = [sql stringByAppendingString:@"bnkacct.crttm createdTime,"];
  sql = [sql stringByAppendingString:@"bnkacct.lmt lastModifiedTime,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_bnkacct bnkacct "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (bankAccount.bankAccountId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:bankAccount.bankAccountId];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctid = %@ ", val];
  }
  if (bankAccount.bankAccountId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:bankAccount.bankAccountId0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctid > %@ ", val];
  }
  if (bankAccount.bankAccountId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:bankAccount.bankAccountId1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctid < %@ ", val];
  }
  if (bankAccount.bankAccountName != nil && bankAccount.bankAccountName.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountName andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctnm = %@ ", val];
  }
  if (bankAccount.bankAccountName0 != nil && bankAccount.bankAccountName0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountName0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctnm like %@ ", val];
  }
  if (bankAccount.bankAccountName1 != nil && bankAccount.bankAccountName1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountName1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctnm like %@ ", val];
  }
  if (bankAccount.bankAccountName2 != nil && bankAccount.bankAccountName2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountName2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctnm like %@ ", val];
  }
  if (bankAccount.bankAccountType != nil && bankAccount.bankAccountType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkaccttyp = %@ ", val];
  }
  if (bankAccount.bankAccountType0 != nil && bankAccount.bankAccountType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkaccttyp like %@ ", val];
  }
  if (bankAccount.bankAccountType1 != nil && bankAccount.bankAccountType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkaccttyp like %@ ", val];
  }
  if (bankAccount.bankAccountType2 != nil && bankAccount.bankAccountType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.bankAccountType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkaccttyp like %@ ", val];
  }
  if (bankAccount.accountNumber != nil && bankAccount.accountNumber.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.accountNumber andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctno = %@ ", val];
  }
  if (bankAccount.accountNumber0 != nil && bankAccount.accountNumber0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.accountNumber0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctno like %@ ", val];
  }
  if (bankAccount.accountNumber1 != nil && bankAccount.accountNumber1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.accountNumber1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctno like %@ ", val];
  }
  if (bankAccount.accountNumber2 != nil && bankAccount.accountNumber2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.accountNumber2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.bnkacctno like %@ ", val];
  }
  if (bankAccount.currency != nil && bankAccount.currency.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.currency andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.curr = %@ ", val];
  }
  if (bankAccount.currency0 != nil && bankAccount.currency0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.currency0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.curr like %@ ", val];
  }
  if (bankAccount.currency1 != nil && bankAccount.currency1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.currency1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.curr like %@ ", val];
  }
  if (bankAccount.currency2 != nil && bankAccount.currency2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.currency2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.curr like %@ ", val];
  }
  if (bankAccount.note != nil && bankAccount.note.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.note andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.nt = %@ ", val];
  }
  if (bankAccount.note0 != nil && bankAccount.note0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.note0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.nt like %@ ", val];
  }
  if (bankAccount.note1 != nil && bankAccount.note1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.note1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.nt like %@ ", val];
  }
  if (bankAccount.note2 != nil && bankAccount.note2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.note2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.nt like %@ ", val];
  }
  if (bankAccount.modifierId != nil && bankAccount.modifierId.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierId andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modid = %@ ", val];
  }
  if (bankAccount.modifierId0 != nil && bankAccount.modifierId0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierId0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modid like %@ ", val];
  }
  if (bankAccount.modifierId1 != nil && bankAccount.modifierId1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierId1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modid like %@ ", val];
  }
  if (bankAccount.modifierId2 != nil && bankAccount.modifierId2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierId2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modid like %@ ", val];
  }
  if (bankAccount.modifierType != nil && bankAccount.modifierType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modtyp = %@ ", val];
  }
  if (bankAccount.modifierType0 != nil && bankAccount.modifierType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modtyp like %@ ", val];
  }
  if (bankAccount.modifierType1 != nil && bankAccount.modifierType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modtyp like %@ ", val];
  }
  if (bankAccount.modifierType2 != nil && bankAccount.modifierType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:bankAccount.modifierType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and bnkacct.modtyp like %@ ", val];
  }
  return sql;
}

@end
