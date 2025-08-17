/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "InvoiceQuery.h"

/*!
** 【发票】查询对象.
*/
@implementation InvoiceQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _invoiceId;
  NSInteger _invoiceId0;
  NSInteger _invoiceId1;
  NSMutableArray<NSNumber*>* _invoiceIds; 
  /*!
  ** 【发票号】属性.
  */
  NSString* _invoiceNumber;
  NSString* _invoiceNumber0;
  NSString* _invoiceNumber1;
  NSString* _invoiceNumber2;
  /*!
  ** 【金额】属性.
  */
  NSDecimalNumber* _amount;
  NSDecimalNumber* _amount0;
  NSDecimalNumber* _amount1;
  /*!
  ** 【状态】属性.
  */
  NSString* _status;
  NSString* _status0;
  NSString* _status1;
  NSString* _status2;
  NSMutableArray<NSString*>* _statuses; 
  /*!
  ** 【到期日】属性.
  */
  NSDate* _dueDate;
  NSDate* _dueDate0;
  NSDate* _dueDate1;
  /*!
  ** 【创建时间】属性.
  */
  NSDate* _createdTime;
  NSDate* _createdTime0;
  NSDate* _createdTime1;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _invoiceId = NSIntegerMin;
  }
  return self;
}

- (NSInteger)invoiceId{
  return _invoiceId;
}
- (void)setInvoiceId:(NSInteger)newInvoiceId {
  _invoiceId = newInvoiceId;
}
- (NSInteger)invoiceId0 {
  return _invoiceId0;
}
- (void)setInvoiceId0:(NSInteger)newInvoiceId0 {
  _invoiceId0 = newInvoiceId0;
}
- (NSInteger)invoiceId1 {
  return _invoiceId1;
}
- (void)setInvoiceId1:(NSInteger)newInvoiceId1 {
  _invoiceId1 = newInvoiceId1;
}
- (NSMutableArray<NSNumber*>*)invoiceIds {
  return _invoiceIds;
}
- (void)setInvoiceIds:(NSMutableArray<NSNumber*>*)newInvoiceIds {
  _invoiceIds = newInvoiceIds;
}   

- (NSString*)invoiceNumber{
  return _invoiceNumber;
}
- (void)setInvoiceNumber:(NSString*)newInvoiceNumber {
  _invoiceNumber = newInvoiceNumber;
}
- (NSString*)invoiceNumber0 {
  return _invoiceNumber0;
}
- (void)setInvoiceNumber0:(NSString*)newInvoiceNumber0 {
  _invoiceNumber0 = newInvoiceNumber0;
}
- (NSString*)invoiceNumber1 {
  return _invoiceNumber1;
}
- (void)setInvoiceNumber1:(NSString*)newInvoiceNumber1 {
  _invoiceNumber1 = newInvoiceNumber1;
}
- (NSString*)invoiceNumber2 {
  return _invoiceNumber2;
}
- (void)setInvoiceNumber2:(NSString*)newInvoiceNumber2 {
  _invoiceNumber2 = newInvoiceNumber2;
}

- (NSDecimalNumber*)amount{
  return _amount;
}
- (void)setAmount:(NSDecimalNumber*)newAmount {
  _amount = newAmount;
}
- (NSDecimalNumber*)amount0 {
  return _amount0;
}
- (void)setAmount0:(NSDecimalNumber*)newAmount0 {
  _amount0 = newAmount0;
}
- (NSDecimalNumber*)amount1 {
  return _amount1;
}
- (void)setAmount1:(NSDecimalNumber*)newAmount1 {
  _amount1 = newAmount1;
}

- (NSString*)status{
  return _status;
}
- (void)setStatus:(NSString*)newStatus {
  _status = newStatus;
}
- (NSString*)status0 {
  return _status0;
}
- (void)setStatus0:(NSString*)newStatus0 {
  _status0 = newStatus0;
}
- (NSString*)status1 {
  return _status1;
}
- (void)setStatus1:(NSString*)newStatus1 {
  _status1 = newStatus1;
}
- (NSString*)status2 {
  return _status2;
}
- (void)setStatus2:(NSString*)newStatus2 {
  _status2 = newStatus2;
}
- (NSMutableArray<NSString*>*)statuses {
  return _statuses;
}
- (void)setStatuses:(NSMutableArray<NSString*>*)newStatuses {
  _statuses = newStatuses;
}  

- (NSDate*)dueDate{
  return _dueDate;
}
- (void)setDueDate:(NSDate*)newDueDate {
  _dueDate = newDueDate;
}
- (NSDate*)dueDate0 {
  return _dueDate0;
}
- (void)setDueDate0:(NSDate*)newDueDate0 {
  _dueDate0 = newDueDate0;
}
- (NSDate*)dueDate1 {
  return _dueDate1;
}
- (void)setDueDate1:(NSDate*)newDueDate1 {
  _dueDate1 = newDueDate1;
}

- (NSDate*)createdTime{
  return _createdTime;
}
- (void)setCreatedTime:(NSDate*)newCreatedTime {
  _createdTime = newCreatedTime;
}
- (NSDate*)createdTime0 {
  return _createdTime0;
}
- (void)setCreatedTime0:(NSDate*)newCreatedTime0 {
  _createdTime0 = newCreatedTime0;
}
- (NSDate*)createdTime1 {
  return _createdTime1;
}
- (void)setCreatedTime1:(NSDate*)newCreatedTime1 {
  _createdTime1 = newCreatedTime1;
}

@end
