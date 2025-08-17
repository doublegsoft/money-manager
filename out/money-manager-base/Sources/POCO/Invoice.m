/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Invoice.h"

/*!
** 【发票】对象.
*/
@interface Invoice() {

  /*!
  ** 【】属性.
  */
  NSInteger _id;

  /*!
  ** 【发票号】属性.
  */
  NSString* _invoiceNumber;

  /*!
  ** 【金额】属性.
  */
  NSDecimalNumber* _amount;

  /*!
  ** 【状态】属性.
  */
  NSString* _status;

  /*!
  ** 【到期日】属性.
  */
  NSDate* _dueDate;

  /*!
  ** 【创建时间】属性.
  */
  NSDate* _createdTime;
}
@end

@implementation Invoice

- (instancetype)init {
  self = [super init];
  if (self) {
  }
  return self;
}

/*!
** 【】属性.
*/
- (NSInteger)id {
  return _id;
}
- (void)setId:(NSInteger)newId {
  _id = newId;
}

/*!
** 【发票号】属性.
*/
- (NSString*)invoiceNumber {
  return _invoiceNumber;
}
- (void)setInvoiceNumber:(NSString*)newInvoiceNumber {
  _invoiceNumber = newInvoiceNumber;
}

/*!
** 【金额】属性.
*/
- (NSDecimalNumber*)amount {
  return _amount;
}
- (void)setAmount:(NSDecimalNumber*)newAmount {
  _amount = newAmount;
}

/*!
** 【状态】属性.
*/
- (NSString*)status {
  return _status;
}
- (void)setStatus:(NSString*)newStatus {
  _status = newStatus;
}

/*!
** 【到期日】属性.
*/
- (NSDate*)dueDate {
  return _dueDate;
}
- (void)setDueDate:(NSDate*)newDueDate {
  _dueDate = newDueDate;
}

/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime {
  return _createdTime;
}
- (void)setCreatedTime:(NSDate*)newCreatedTime {
  _createdTime = newCreatedTime;
}

@end
