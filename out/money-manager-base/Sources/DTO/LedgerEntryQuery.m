/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "LedgerEntryQuery.h"
#import "AccountQuery.h"  
#import "TransactionQuery.h"  

/*!
** 【记账登记】查询对象.
*/
@implementation LedgerEntryQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _ledgerEntryId;
  NSInteger _ledgerEntryId0;
  NSInteger _ledgerEntryId1;
  NSMutableArray<NSNumber*>* _ledgerEntryIds; 
  /*!
  ** 【账户】属性.
  */
  NSInteger _accountId;
  NSInteger _accountId0;
  NSInteger _accountId1;
  NSMutableArray<NSNumber*>* _accountIds; 
  AccountQuery* _account;
  /*!
  ** 【交易】属性.
  */
  NSInteger _transactionId;
  NSInteger _transactionId0;
  NSInteger _transactionId1;
  NSMutableArray<NSNumber*>* _transactionIds; 
  TransactionQuery* _transaction;
  /*!
  ** 【登记日期】属性.
  */
  NSDate* _entryDate;
  NSDate* _entryDate0;
  NSDate* _entryDate1;
  /*!
  ** 【描述】属性.
  */
  NSString* _description;
  NSString* _description0;
  NSString* _description1;
  NSString* _description2;
  /*!
  ** 【借方金额】属性.
  */
  NSDecimalNumber* _creditAmount;
  NSDecimalNumber* _creditAmount0;
  NSDecimalNumber* _creditAmount1;
  /*!
  ** 【贷方金额】属性.
  */
  NSDecimalNumber* _debitAmount;
  NSDecimalNumber* _debitAmount0;
  NSDecimalNumber* _debitAmount1;
  /*!
  ** 【系统状态】属性.
  */
  BOOL _state;
  BOOL _state0;
  BOOL _state1;
  NSMutableArray<NSNumber*>* _states; 
  /*!
  ** 【修改者】属性.
  */
  NSString* _modifierId;
  NSString* _modifierId0;
  NSString* _modifierId1;
  NSString* _modifierId2;
  /*!
  ** 【修改者类型】属性.
  */
  NSString* _modifierType;
  NSString* _modifierType0;
  NSString* _modifierType1;
  NSString* _modifierType2;
  /*!
  ** 【创建时间】属性.
  */
  NSDate* _createdTime;
  NSDate* _createdTime0;
  NSDate* _createdTime1;
  /*!
  ** 【最后更新时间】属性.
  */
  NSDate* _lastModifiedTime;
  NSDate* _lastModifiedTime0;
  NSDate* _lastModifiedTime1;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _ledgerEntryId = NSIntegerMin;
    _accountId = NSIntegerMin;
    _transactionId = NSIntegerMin;
    _state = YES;
  }
  return self;
}

- (NSInteger)ledgerEntryId{
  return _ledgerEntryId;
}
- (void)setLedgerEntryId:(NSInteger)newLedgerEntryId {
  _ledgerEntryId = newLedgerEntryId;
}
- (NSInteger)ledgerEntryId0 {
  return _ledgerEntryId0;
}
- (void)setLedgerEntryId0:(NSInteger)newLedgerEntryId0 {
  _ledgerEntryId0 = newLedgerEntryId0;
}
- (NSInteger)ledgerEntryId1 {
  return _ledgerEntryId1;
}
- (void)setLedgerEntryId1:(NSInteger)newLedgerEntryId1 {
  _ledgerEntryId1 = newLedgerEntryId1;
}
- (NSMutableArray<NSNumber*>*)ledgerEntryIds {
  return _ledgerEntryIds;
}
- (void)setLedgerEntryIds:(NSMutableArray<NSNumber*>*)newLedgerEntryIds {
  _ledgerEntryIds = newLedgerEntryIds;
}   

- (NSInteger)accountId{
  return _accountId;
}
- (void)setAccountId:(NSInteger)newAccountId {
  _accountId = newAccountId;
}
- (NSInteger)accountId0 {
  return _accountId0;
}
- (void)setAccountId0:(NSInteger)newAccountId0 {
  _accountId0 = newAccountId0;
}
- (NSInteger)accountId1 {
  return _accountId1;
}
- (void)setAccountId1:(NSInteger)newAccountId1 {
  _accountId1 = newAccountId1;
}
- (NSMutableArray<NSNumber*>*)accountIds {
  return _accountIds;
}
- (void)setAccountIds:(NSMutableArray<NSNumber*>*)newAccountIds {
  _accountIds = newAccountIds;
}   
- (AccountQuery*)account {
  return _account;
}  
- (void)setAccount:(AccountQuery*)newAccount {
  _account = newAccount;
}

- (NSInteger)transactionId{
  return _transactionId;
}
- (void)setTransactionId:(NSInteger)newTransactionId {
  _transactionId = newTransactionId;
}
- (NSInteger)transactionId0 {
  return _transactionId0;
}
- (void)setTransactionId0:(NSInteger)newTransactionId0 {
  _transactionId0 = newTransactionId0;
}
- (NSInteger)transactionId1 {
  return _transactionId1;
}
- (void)setTransactionId1:(NSInteger)newTransactionId1 {
  _transactionId1 = newTransactionId1;
}
- (NSMutableArray<NSNumber*>*)transactionIds {
  return _transactionIds;
}
- (void)setTransactionIds:(NSMutableArray<NSNumber*>*)newTransactionIds {
  _transactionIds = newTransactionIds;
}   
- (TransactionQuery*)transaction {
  return _transaction;
}  
- (void)setTransaction:(TransactionQuery*)newTransaction {
  _transaction = newTransaction;
}

- (NSDate*)entryDate{
  return _entryDate;
}
- (void)setEntryDate:(NSDate*)newEntryDate {
  _entryDate = newEntryDate;
}
- (NSDate*)entryDate0 {
  return _entryDate0;
}
- (void)setEntryDate0:(NSDate*)newEntryDate0 {
  _entryDate0 = newEntryDate0;
}
- (NSDate*)entryDate1 {
  return _entryDate1;
}
- (void)setEntryDate1:(NSDate*)newEntryDate1 {
  _entryDate1 = newEntryDate1;
}

- (NSString*)description{
  return _description;
}
- (void)setDescription:(NSString*)newDescription {
  _description = newDescription;
}
- (NSString*)description0 {
  return _description0;
}
- (void)setDescription0:(NSString*)newDescription0 {
  _description0 = newDescription0;
}
- (NSString*)description1 {
  return _description1;
}
- (void)setDescription1:(NSString*)newDescription1 {
  _description1 = newDescription1;
}
- (NSString*)description2 {
  return _description2;
}
- (void)setDescription2:(NSString*)newDescription2 {
  _description2 = newDescription2;
}

- (NSDecimalNumber*)creditAmount{
  return _creditAmount;
}
- (void)setCreditAmount:(NSDecimalNumber*)newCreditAmount {
  _creditAmount = newCreditAmount;
}
- (NSDecimalNumber*)creditAmount0 {
  return _creditAmount0;
}
- (void)setCreditAmount0:(NSDecimalNumber*)newCreditAmount0 {
  _creditAmount0 = newCreditAmount0;
}
- (NSDecimalNumber*)creditAmount1 {
  return _creditAmount1;
}
- (void)setCreditAmount1:(NSDecimalNumber*)newCreditAmount1 {
  _creditAmount1 = newCreditAmount1;
}

- (NSDecimalNumber*)debitAmount{
  return _debitAmount;
}
- (void)setDebitAmount:(NSDecimalNumber*)newDebitAmount {
  _debitAmount = newDebitAmount;
}
- (NSDecimalNumber*)debitAmount0 {
  return _debitAmount0;
}
- (void)setDebitAmount0:(NSDecimalNumber*)newDebitAmount0 {
  _debitAmount0 = newDebitAmount0;
}
- (NSDecimalNumber*)debitAmount1 {
  return _debitAmount1;
}
- (void)setDebitAmount1:(NSDecimalNumber*)newDebitAmount1 {
  _debitAmount1 = newDebitAmount1;
}

- (BOOL)state{
  return _state;
}
- (void)setState:(BOOL)newState {
  _state = newState;
}
- (BOOL)state0 {
  return _state0;
}
- (void)setState0:(BOOL)newState0 {
  _state0 = newState0;
}
- (BOOL)state1 {
  return _state1;
}
- (void)setState1:(BOOL)newState1 {
  _state1 = newState1;
}
- (NSMutableArray<NSNumber*>*)states {
  return _states;
}
- (void)setStates:(NSMutableArray<NSNumber*>*)newStates {
  _states = newStates;
}   

- (NSString*)modifierId{
  return _modifierId;
}
- (void)setModifierId:(NSString*)newModifierId {
  _modifierId = newModifierId;
}
- (NSString*)modifierId0 {
  return _modifierId0;
}
- (void)setModifierId0:(NSString*)newModifierId0 {
  _modifierId0 = newModifierId0;
}
- (NSString*)modifierId1 {
  return _modifierId1;
}
- (void)setModifierId1:(NSString*)newModifierId1 {
  _modifierId1 = newModifierId1;
}
- (NSString*)modifierId2 {
  return _modifierId2;
}
- (void)setModifierId2:(NSString*)newModifierId2 {
  _modifierId2 = newModifierId2;
}

- (NSString*)modifierType{
  return _modifierType;
}
- (void)setModifierType:(NSString*)newModifierType {
  _modifierType = newModifierType;
}
- (NSString*)modifierType0 {
  return _modifierType0;
}
- (void)setModifierType0:(NSString*)newModifierType0 {
  _modifierType0 = newModifierType0;
}
- (NSString*)modifierType1 {
  return _modifierType1;
}
- (void)setModifierType1:(NSString*)newModifierType1 {
  _modifierType1 = newModifierType1;
}
- (NSString*)modifierType2 {
  return _modifierType2;
}
- (void)setModifierType2:(NSString*)newModifierType2 {
  _modifierType2 = newModifierType2;
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

- (NSDate*)lastModifiedTime{
  return _lastModifiedTime;
}
- (void)setLastModifiedTime:(NSDate*)newLastModifiedTime {
  _lastModifiedTime = newLastModifiedTime;
}
- (NSDate*)lastModifiedTime0 {
  return _lastModifiedTime0;
}
- (void)setLastModifiedTime0:(NSDate*)newLastModifiedTime0 {
  _lastModifiedTime0 = newLastModifiedTime0;
}
- (NSDate*)lastModifiedTime1 {
  return _lastModifiedTime1;
}
- (void)setLastModifiedTime1:(NSDate*)newLastModifiedTime1 {
  _lastModifiedTime1 = newLastModifiedTime1;
}

@end
