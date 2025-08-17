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
#import "TransactionQuery.h"  

/*!
** 【记账登记】查询对象.
*/
@interface LedgerEntryQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)ledgerEntryId;
- (void)setLedgerEntryId:(NSInteger)newLedgerEntryId;
- (NSInteger)ledgerEntryId0;
- (void)setLedgerEntryId0:(NSInteger)newLedgerEntryId0;
- (NSInteger)ledgerEntryId1;
- (void)setLedgerEntryId1:(NSInteger)newLedgerEntryId1;
- (NSMutableArray<NSNumber*>*)ledgerEntryIds;
- (void)setLedgerEntryIds:(NSMutableArray<NSNumber*>*)newLedgerEntryIds;  
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
** 【交易】属性.
*/
- (NSInteger)transactionId;
- (void)setTransactionId:(NSInteger)newTransactionId;
- (NSInteger)transactionId0;
- (void)setTransactionId0:(NSInteger)newTransactionId0;
- (NSInteger)transactionId1;
- (void)setTransactionId1:(NSInteger)newTransactionId1;
- (NSMutableArray<NSNumber*>*)transactionIds;
- (void)setTransactionIds:(NSMutableArray<NSNumber*>*)newTransactionIds;  
- (TransactionQuery*)transaction;
- (void)setTransaction:(TransactionQuery*)newTransaction;
/*!
** 【登记日期】属性.
*/
- (NSDate*)entryDate;
- (void)setEntryDate:(NSDate*)newEntryDate;
- (NSDate*)entryDate0;
- (void)setEntryDate0:(NSDate*)newEntryDate0;
- (NSDate*)entryDate1;
- (void)setEntryDate1:(NSDate*)newEntryDate1;
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
** 【借方金额】属性.
*/
- (NSDecimalNumber*)creditAmount;
- (void)setCreditAmount:(NSDecimalNumber*)newCreditAmount;
- (NSDecimalNumber*)creditAmount0;
- (void)setCreditAmount0:(NSDecimalNumber*)newCreditAmount0;
- (NSDecimalNumber*)creditAmount1;
- (void)setCreditAmount1:(NSDecimalNumber*)newCreditAmount1;
/*!
** 【贷方金额】属性.
*/
- (NSDecimalNumber*)debitAmount;
- (void)setDebitAmount:(NSDecimalNumber*)newDebitAmount;
- (NSDecimalNumber*)debitAmount0;
- (void)setDebitAmount0:(NSDecimalNumber*)newDebitAmount0;
- (NSDecimalNumber*)debitAmount1;
- (void)setDebitAmount1:(NSDecimalNumber*)newDebitAmount1;
/*!
** 【系统状态】属性.
*/
- (BOOL)state;
- (void)setState:(BOOL)newState;
- (BOOL)state0;
- (void)setState0:(BOOL)newState0;
- (BOOL)state1;
- (void)setState1:(BOOL)newState1;
- (NSMutableArray<NSNumber*>*)states;
- (void)setStates:(NSMutableArray<NSNumber*>*)newStates;  
/*!
** 【修改者】属性.
*/
- (NSString*)modifierId;
- (void)setModifierId:(NSString*)newModifierId;
- (NSString*)modifierId0;
- (void)setModifierId0:(NSString*)newModifierId0;
- (NSString*)modifierId1;
- (void)setModifierId1:(NSString*)newModifierId1;
- (NSString*)modifierId2;
- (void)setModifierId2:(NSString*)newModifierId2;
/*!
** 【修改者类型】属性.
*/
- (NSString*)modifierType;
- (void)setModifierType:(NSString*)newModifierType;
- (NSString*)modifierType0;
- (void)setModifierType0:(NSString*)newModifierType0;
- (NSString*)modifierType1;
- (void)setModifierType1:(NSString*)newModifierType1;
- (NSString*)modifierType2;
- (void)setModifierType2:(NSString*)newModifierType2;
/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime;
- (void)setCreatedTime:(NSDate*)newCreatedTime;
- (NSDate*)createdTime0;
- (void)setCreatedTime0:(NSDate*)newCreatedTime0;
- (NSDate*)createdTime1;
- (void)setCreatedTime1:(NSDate*)newCreatedTime1;
/*!
** 【最后更新时间】属性.
*/
- (NSDate*)lastModifiedTime;
- (void)setLastModifiedTime:(NSDate*)newLastModifiedTime;
- (NSDate*)lastModifiedTime0;
- (void)setLastModifiedTime0:(NSDate*)newLastModifiedTime0;
- (NSDate*)lastModifiedTime1;
- (void)setLastModifiedTime1:(NSDate*)newLastModifiedTime1;
@end
