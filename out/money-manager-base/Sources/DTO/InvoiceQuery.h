/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

/*!
** 【发票】查询对象.
*/
@interface InvoiceQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)invoiceId;
- (void)setInvoiceId:(NSInteger)newInvoiceId;
- (NSInteger)invoiceId0;
- (void)setInvoiceId0:(NSInteger)newInvoiceId0;
- (NSInteger)invoiceId1;
- (void)setInvoiceId1:(NSInteger)newInvoiceId1;
- (NSMutableArray<NSNumber*>*)invoiceIds;
- (void)setInvoiceIds:(NSMutableArray<NSNumber*>*)newInvoiceIds;  
/*!
** 【发票号】属性.
*/
- (NSString*)invoiceNumber;
- (void)setInvoiceNumber:(NSString*)newInvoiceNumber;
- (NSString*)invoiceNumber0;
- (void)setInvoiceNumber0:(NSString*)newInvoiceNumber0;
- (NSString*)invoiceNumber1;
- (void)setInvoiceNumber1:(NSString*)newInvoiceNumber1;
- (NSString*)invoiceNumber2;
- (void)setInvoiceNumber2:(NSString*)newInvoiceNumber2;
/*!
** 【金额】属性.
*/
- (NSDecimalNumber*)amount;
- (void)setAmount:(NSDecimalNumber*)newAmount;
- (NSDecimalNumber*)amount0;
- (void)setAmount0:(NSDecimalNumber*)newAmount0;
- (NSDecimalNumber*)amount1;
- (void)setAmount1:(NSDecimalNumber*)newAmount1;
/*!
** 【状态】属性.
*/
- (NSString*)status;
- (void)setStatus:(NSString*)newStatus;
- (NSString*)status0;
- (void)setStatus0:(NSString*)newStatus0;
- (NSString*)status1;
- (void)setStatus1:(NSString*)newStatus1;
- (NSString*)status2;
- (void)setStatus2:(NSString*)newStatus2;
- (NSMutableArray<NSString*>*)statuses;
- (void)setStatuses:(NSMutableArray<NSString*>*)newStatuses;
/*!
** 【到期日】属性.
*/
- (NSDate*)dueDate;
- (void)setDueDate:(NSDate*)newDueDate;
- (NSDate*)dueDate0;
- (void)setDueDate0:(NSDate*)newDueDate0;
- (NSDate*)dueDate1;
- (void)setDueDate1:(NSDate*)newDueDate1;
/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime;
- (void)setCreatedTime:(NSDate*)newCreatedTime;
- (NSDate*)createdTime0;
- (void)setCreatedTime0:(NSDate*)newCreatedTime0;
- (NSDate*)createdTime1;
- (void)setCreatedTime1:(NSDate*)newCreatedTime1;
@end
