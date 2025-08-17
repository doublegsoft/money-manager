/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "InvoiceSQL.h"

@implementation InvoiceSQL

+ (NSString*)getInsertSQL:(InvoiceQuery*)invoice {
  NSString* ret = @""
    "insert into tn_mm_inv ("
    "  invid,"
    "  invnum,"
    "  amount,"
    "  status,"
    "  duedate,"
    "  crttm"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:invoice.invoiceId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:invoice.invoiceNumber andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDecimal:invoice.amount]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:invoice.status andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:invoice.dueDate]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:invoice.createdTime]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(InvoiceQuery*)invoice {
  NSString* ret = @""
    "update tn_mm_inv set ";
  if (invoice.invoiceNumber != nil) {
    ret = [ret stringByAppendingFormat:@"invnum = %@, ", [MoneyManagerSQL escapeString:invoice.invoiceNumber andVar:-1]];
  }
  if (invoice.amount != nil) {
    ret = [ret stringByAppendingFormat:@"amount = %@, ", [MoneyManagerSQL escapeDecimal:invoice.amount]];
  }
  if (invoice.status != nil) {
    ret = [ret stringByAppendingFormat:@"status = %@, ", [MoneyManagerSQL escapeString:invoice.status andVar:-1]];
  }
  if (invoice.dueDate != nil) {
    ret = [ret stringByAppendingFormat:@"duedate = %@, ", [MoneyManagerSQL escapeDate:invoice.dueDate]];
  }
  if (invoice.createdTime != nil) {
    ret = [ret stringByAppendingFormat:@"crttm = %@ ", [MoneyManagerSQL escapeDate:invoice.createdTime]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:invoice.invoiceId];
  ret = [ret stringByAppendingFormat:@"and invid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(InvoiceQuery*)invoice {
  NSString* ret = @""
    "delete from tn_mm_inv ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:invoice.invoiceId];
  ret = [ret stringByAppendingFormat:@"and invid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(InvoiceQuery*)invoice {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"inv.invid invoiceId,"];
  sql = [sql stringByAppendingString:@"inv.invnum invoiceNumber,"];
  sql = [sql stringByAppendingString:@"inv.amount amount,"];
  sql = [sql stringByAppendingString:@"inv.status status,"];
  sql = [sql stringByAppendingString:@"inv.duedate dueDate,"];
  sql = [sql stringByAppendingString:@"inv.crttm createdTime,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_inv inv "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (invoice.invoiceId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:invoice.invoiceId];
    sql = [sql stringByAppendingFormat:@"and inv.invid = %@ ", val];
  }
  if (invoice.invoiceId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:invoice.invoiceId0];
    sql = [sql stringByAppendingFormat:@"and inv.invid > %@ ", val];
  }
  if (invoice.invoiceId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:invoice.invoiceId1];
    sql = [sql stringByAppendingFormat:@"and inv.invid < %@ ", val];
  }
  if (invoice.invoiceNumber != nil && invoice.invoiceNumber.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.invoiceNumber andVar:-1];
    sql = [sql stringByAppendingFormat:@"and inv.invnum = %@ ", val];
  }
  if (invoice.invoiceNumber0 != nil && invoice.invoiceNumber0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.invoiceNumber0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and inv.invnum like %@ ", val];
  }
  if (invoice.invoiceNumber1 != nil && invoice.invoiceNumber1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.invoiceNumber1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and inv.invnum like %@ ", val];
  }
  if (invoice.invoiceNumber2 != nil && invoice.invoiceNumber2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.invoiceNumber2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and inv.invnum like %@ ", val];
  }
  if (invoice.status != nil && invoice.status.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.status andVar:-1];
    sql = [sql stringByAppendingFormat:@"and inv.status = %@ ", val];
  }
  if (invoice.status0 != nil && invoice.status0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.status0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and inv.status like %@ ", val];
  }
  if (invoice.status1 != nil && invoice.status1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.status1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and inv.status like %@ ", val];
  }
  if (invoice.status2 != nil && invoice.status2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:invoice.status2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and inv.status like %@ ", val];
  }
  return sql;
}

@end
