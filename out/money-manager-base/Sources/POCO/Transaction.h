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
#import "TransactionCategory.h"
/*!
** 【交易】对象.
*/
@interface Transaction : NSObject

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
** 【交易类别】属性.
*/
- (TransactionCategory*)transactionCategory;
- (void)setTransactionCategory:(TransactionCategory*)newTransactionCategory;

/*!
** 【交易类型】属性.
*/
- (NSString*)type;
- (void)setType:(NSString*)newType;

/*!
** 【金额】属性.
*/
- (NSDecimalNumber*)amount;
- (void)setAmount:(NSDecimalNumber*)newAmount;

/*!
** 【描述】属性.
*/
- (NSString*)description;
- (void)setDescription:(NSString*)newDescription;

/*!
** 【交易时间】属性.
*/
- (NSDate*)transactionDate;
- (void)setTransactionDate:(NSDate*)newTransactionDate;

- (instancetype)init;
@end
