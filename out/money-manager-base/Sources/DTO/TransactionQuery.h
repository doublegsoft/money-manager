/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>
#import "AccountQuery.h"  
#import "TransactionCategoryQuery.h"  

/*!
** 【交易】查询对象.
*/
@interface TransactionQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)transactionId;
- (void)setTransactionId:(NSInteger)newTransactionId;
- (NSInteger)transactionId0;
- (void)setTransactionId0:(NSInteger)newTransactionId0;
- (NSInteger)transactionId1;
- (void)setTransactionId1:(NSInteger)newTransactionId1;
- (NSMutableArray<NSNumber*>*)transactionIds;
- (void)setTransactionIds:(NSMutableArray<NSNumber*>*)newTransactionIds;  
/*!
** 【账户】属性.
*/
- (NSInteger)accountId;
- (void)setAccountId:(NSInteger)newAccountId;
- (NSInteger)accountId0;
- (void)setAccountId0:(NSInteger)newAccountId0;
- (NSInteger)accountId1;
- (void)setAccountId1:(NSInteger)newAccountId1;
- (NSMutableArray<NSNumber*>*)accountIds;
- (void)setAccountIds:(NSMutableArray<NSNumber*>*)newAccountIds;  
- (AccountQuery*)account;
- (void)setAccount:(AccountQuery*)newAccount;
/*!
** 【交易类别】属性.
*/
- (NSInteger)transactionCategoryId;
- (void)setTransactionCategoryId:(NSInteger)newTransactionCategoryId;
- (NSInteger)transactionCategoryId0;
- (void)setTransactionCategoryId0:(NSInteger)newTransactionCategoryId0;
- (NSInteger)transactionCategoryId1;
- (void)setTransactionCategoryId1:(NSInteger)newTransactionCategoryId1;
- (NSMutableArray<NSNumber*>*)transactionCategoryIds;
- (void)setTransactionCategoryIds:(NSMutableArray<NSNumber*>*)newTransactionCategoryIds;  
- (TransactionCategoryQuery*)transactionCategory;
- (void)setTransactionCategory:(TransactionCategoryQuery*)newTransactionCategory;
/*!
** 【交易类型】属性.
*/
- (NSString*)transactionType;
- (void)setTransactionType:(NSString*)newTransactionType;
- (NSString*)transactionType0;
- (void)setTransactionType0:(NSString*)newTransactionType0;
- (NSString*)transactionType1;
- (void)setTransactionType1:(NSString*)newTransactionType1;
- (NSString*)transactionType2;
- (void)setTransactionType2:(NSString*)newTransactionType2;
- (NSMutableArray<NSString*>*)transactionTypes;
- (void)setTransactionTypes:(NSMutableArray<NSString*>*)newTransactionTypes;
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
** 【描述】属性.
*/
- (NSString*)description;
- (void)setDescription:(NSString*)newDescription;
- (NSString*)description0;
- (void)setDescription0:(NSString*)newDescription0;
- (NSString*)description1;
- (void)setDescription1:(NSString*)newDescription1;
- (NSString*)description2;
- (void)setDescription2:(NSString*)newDescription2;
/*!
** 【交易时间】属性.
*/
- (NSDate*)transactionDate;
- (void)setTransactionDate:(NSDate*)newTransactionDate;
- (NSDate*)transactionDate0;
- (void)setTransactionDate0:(NSDate*)newTransactionDate0;
- (NSDate*)transactionDate1;
- (void)setTransactionDate1:(NSDate*)newTransactionDate1;
@end
