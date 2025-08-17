/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "TransactionQuery.h"
#import "AccountQuery.h"  
#import "TransactionCategoryQuery.h"  

/*!
** 【交易】查询对象.
*/
@implementation TransactionQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _transactionId;
  NSInteger _transactionId0;
  NSInteger _transactionId1;
  NSMutableArray<NSNumber*>* _transactionIds; 
  /*!
  ** 【账户】属性.
  */
  NSInteger _accountId;
  NSInteger _accountId0;
  NSInteger _accountId1;
  NSMutableArray<NSNumber*>* _accountIds; 
  AccountQuery* _account;
  /*!
  ** 【交易类别】属性.
  */
  NSInteger _transactionCategoryId;
  NSInteger _transactionCategoryId0;
  NSInteger _transactionCategoryId1;
  NSMutableArray<NSNumber*>* _transactionCategoryIds; 
  TransactionCategoryQuery* _transactionCategory;
  /*!
  ** 【交易类型】属性.
  */
  NSString* _transactionType;
  NSString* _transactionType0;
  NSString* _transactionType1;
  NSString* _transactionType2;
  NSMutableArray<NSString*>* _transactionTypes; 
  /*!
  ** 【金额】属性.
  */
  NSDecimalNumber* _amount;
  NSDecimalNumber* _amount0;
  NSDecimalNumber* _amount1;
  /*!
  ** 【描述】属性.
  */
  NSString* _description;
  NSString* _description0;
  NSString* _description1;
  NSString* _description2;
  /*!
  ** 【交易时间】属性.
  */
  NSDate* _transactionDate;
  NSDate* _transactionDate0;
  NSDate* _transactionDate1;
}

- (instancetype)init {
  self = [super init];
  if (self) {
    _transactionId = NSIntegerMin;
    _accountId = NSIntegerMin;
    _transactionCategoryId = NSIntegerMin;
  }
  return self;
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

- (NSInteger)transactionCategoryId{
  return _transactionCategoryId;
}
- (void)setTransactionCategoryId:(NSInteger)newTransactionCategoryId {
  _transactionCategoryId = newTransactionCategoryId;
}
- (NSInteger)transactionCategoryId0 {
  return _transactionCategoryId0;
}
- (void)setTransactionCategoryId0:(NSInteger)newTransactionCategoryId0 {
  _transactionCategoryId0 = newTransactionCategoryId0;
}
- (NSInteger)transactionCategoryId1 {
  return _transactionCategoryId1;
}
- (void)setTransactionCategoryId1:(NSInteger)newTransactionCategoryId1 {
  _transactionCategoryId1 = newTransactionCategoryId1;
}
- (NSMutableArray<NSNumber*>*)transactionCategoryIds {
  return _transactionCategoryIds;
}
- (void)setTransactionCategoryIds:(NSMutableArray<NSNumber*>*)newTransactionCategoryIds {
  _transactionCategoryIds = newTransactionCategoryIds;
}   
- (TransactionCategoryQuery*)transactionCategory {
  return _transactionCategory;
}  
- (void)setTransactionCategory:(TransactionCategoryQuery*)newTransactionCategory {
  _transactionCategory = newTransactionCategory;
}

- (NSString*)transactionType{
  return _transactionType;
}
- (void)setTransactionType:(NSString*)newTransactionType {
  _transactionType = newTransactionType;
}
- (NSString*)transactionType0 {
  return _transactionType0;
}
- (void)setTransactionType0:(NSString*)newTransactionType0 {
  _transactionType0 = newTransactionType0;
}
- (NSString*)transactionType1 {
  return _transactionType1;
}
- (void)setTransactionType1:(NSString*)newTransactionType1 {
  _transactionType1 = newTransactionType1;
}
- (NSString*)transactionType2 {
  return _transactionType2;
}
- (void)setTransactionType2:(NSString*)newTransactionType2 {
  _transactionType2 = newTransactionType2;
}
- (NSMutableArray<NSString*>*)transactionTypes {
  return _transactionTypes;
}
- (void)setTransactionTypes:(NSMutableArray<NSString*>*)newTransactionTypes {
  _transactionTypes = newTransactionTypes;
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

- (NSDate*)transactionDate{
  return _transactionDate;
}
- (void)setTransactionDate:(NSDate*)newTransactionDate {
  _transactionDate = newTransactionDate;
}
- (NSDate*)transactionDate0 {
  return _transactionDate0;
}
- (void)setTransactionDate0:(NSDate*)newTransactionDate0 {
  _transactionDate0 = newTransactionDate0;
}
- (NSDate*)transactionDate1 {
  return _transactionDate1;
}
- (void)setTransactionDate1:(NSDate*)newTransactionDate1 {
  _transactionDate1 = newTransactionDate1;
}

@end
