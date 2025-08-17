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
** 【发票】对象.
*/
@interface Invoice : NSObject

/*!
** 【】属性.
*/
- (NSInteger)id;
- (void)setId:(NSInteger)newId;

/*!
** 【发票号】属性.
*/
- (NSString*)invoiceNumber;
- (void)setInvoiceNumber:(NSString*)newInvoiceNumber;

/*!
** 【金额】属性.
*/
- (NSDecimalNumber*)amount;
- (void)setAmount:(NSDecimalNumber*)newAmount;

/*!
** 【状态】属性.
*/
- (NSString*)status;
- (void)setStatus:(NSString*)newStatus;

/*!
** 【到期日】属性.
*/
- (NSDate*)dueDate;
- (void)setDueDate:(NSDate*)newDueDate;

/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime;
- (void)setCreatedTime:(NSDate*)newCreatedTime;

- (instancetype)init;
@end
