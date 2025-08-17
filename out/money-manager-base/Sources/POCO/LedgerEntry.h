/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#import "Account.h"
#import "Transaction.h"
/*!
** 【记账登记】对象.
*/
@interface LedgerEntry : NSObject

/*!
** 【】属性.
*/
- (NSInteger)id;
- (void)setId:(NSInteger)newId;

/*!
** 【账户】属性.
*/
- (Account*)account;
- (void)setAccount:(Account*)newAccount;

/*!
** 【交易】属性.
*/
- (Transaction*)transaction;
- (void)setTransaction:(Transaction*)newTransaction;

/*!
** 【登记日期】属性.
*/
- (NSDate*)entryDate;
- (void)setEntryDate:(NSDate*)newEntryDate;

/*!
** 【描述】属性.
*/
- (NSString*)description;
- (void)setDescription:(NSString*)newDescription;

/*!
** 【借方金额】属性.
*/
- (NSDecimalNumber*)creditAmount;
- (void)setCreditAmount:(NSDecimalNumber*)newCreditAmount;

/*!
** 【贷方金额】属性.
*/
- (NSDecimalNumber*)debitAmount;
- (void)setDebitAmount:(NSDecimalNumber*)newDebitAmount;

/*!
** 【系统状态】属性.
*/
- (BOOL)state;
- (void)setState:(BOOL)newState;

/*!
** 【修改者】属性.
*/
- (NSString*)modifierId;
- (void)setModifierId:(NSString*)newModifierId;

/*!
** 【修改者类型】属性.
*/
- (NSString*)modifierType;
- (void)setModifierType:(NSString*)newModifierType;

/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime;
- (void)setCreatedTime:(NSDate*)newCreatedTime;

/*!
** 【最后更新时间】属性.
*/
- (NSDate*)lastModifiedTime;
- (void)setLastModifiedTime:(NSDate*)newLastModifiedTime;

- (instancetype)init;
@end
