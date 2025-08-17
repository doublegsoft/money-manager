/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "LedgerEntry.h"

/*!
** 【记账登记】对象.
*/
@interface LedgerEntry() {

  /*!
  ** 【】属性.
  */
  NSInteger _id;

  /*!
  ** 【账户】属性.
  */
  Account* _account;

  /*!
  ** 【交易】属性.
  */
  Transaction* _transaction;

  /*!
  ** 【登记日期】属性.
  */
  NSDate* _entryDate;

  /*!
  ** 【描述】属性.
  */
  NSString* _description;

  /*!
  ** 【借方金额】属性.
  */
  NSDecimalNumber* _creditAmount;

  /*!
  ** 【贷方金额】属性.
  */
  NSDecimalNumber* _debitAmount;

  /*!
  ** 【系统状态】属性.
  */
  BOOL _state;

  /*!
  ** 【修改者】属性.
  */
  NSString* _modifierId;

  /*!
  ** 【修改者类型】属性.
  */
  NSString* _modifierType;

  /*!
  ** 【创建时间】属性.
  */
  NSDate* _createdTime;

  /*!
  ** 【最后更新时间】属性.
  */
  NSDate* _lastModifiedTime;
}
@end

@implementation LedgerEntry

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
** 【交易】属性.
*/
- (Transaction*)transaction {
  return _transaction;
}
- (void)setTransaction:(Transaction*)newTransaction {
  _transaction = newTransaction;
}

/*!
** 【登记日期】属性.
*/
- (NSDate*)entryDate {
  return _entryDate;
}
- (void)setEntryDate:(NSDate*)newEntryDate {
  _entryDate = newEntryDate;
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
** 【借方金额】属性.
*/
- (NSDecimalNumber*)creditAmount {
  return _creditAmount;
}
- (void)setCreditAmount:(NSDecimalNumber*)newCreditAmount {
  _creditAmount = newCreditAmount;
}

/*!
** 【贷方金额】属性.
*/
- (NSDecimalNumber*)debitAmount {
  return _debitAmount;
}
- (void)setDebitAmount:(NSDecimalNumber*)newDebitAmount {
  _debitAmount = newDebitAmount;
}

/*!
** 【系统状态】属性.
*/
- (BOOL)state {
  return _state;
}
- (void)setState:(BOOL)newState {
  _state = newState;
}

/*!
** 【修改者】属性.
*/
- (NSString*)modifierId {
  return _modifierId;
}
- (void)setModifierId:(NSString*)newModifierId {
  _modifierId = newModifierId;
}

/*!
** 【修改者类型】属性.
*/
- (NSString*)modifierType {
  return _modifierType;
}
- (void)setModifierType:(NSString*)newModifierType {
  _modifierType = newModifierType;
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

/*!
** 【最后更新时间】属性.
*/
- (NSDate*)lastModifiedTime {
  return _lastModifiedTime;
}
- (void)setLastModifiedTime:(NSDate*)newLastModifiedTime {
  _lastModifiedTime = newLastModifiedTime;
}

@end
