/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Transaction.h"

/*!
** 【交易】对象.
*/
@interface Transaction() {

  /*!
  ** 【】属性.
  */
  NSInteger _id;

  /*!
  ** 【账户】属性.
  */
  Account* _account;

  /*!
  ** 【交易类别】属性.
  */
  TransactionCategory* _transactionCategory;

  /*!
  ** 【交易类型】属性.
  */
  NSString* _type;

  /*!
  ** 【金额】属性.
  */
  NSDecimalNumber* _amount;

  /*!
  ** 【描述】属性.
  */
  NSString* _description;

  /*!
  ** 【交易时间】属性.
  */
  NSDate* _transactionDate;
}
@end

@implementation Transaction

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
** 【账户】属性.
*/
- (Account*)account {
  return _account;
}
- (void)setAccount:(Account*)newAccount {
  _account = newAccount;
}

/*!
** 【交易类别】属性.
*/
- (TransactionCategory*)transactionCategory {
  return _transactionCategory;
}
- (void)setTransactionCategory:(TransactionCategory*)newTransactionCategory {
  _transactionCategory = newTransactionCategory;
}

/*!
** 【交易类型】属性.
*/
- (NSString*)type {
  return _type;
}
- (void)setType:(NSString*)newType {
  _type = newType;
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
** 【描述】属性.
*/
- (NSString*)description {
  return _description;
}
- (void)setDescription:(NSString*)newDescription {
  _description = newDescription;
}

/*!
** 【交易时间】属性.
*/
- (NSDate*)transactionDate {
  return _transactionDate;
}
- (void)setTransactionDate:(NSDate*)newTransactionDate {
  _transactionDate = newTransactionDate;
}

@end
