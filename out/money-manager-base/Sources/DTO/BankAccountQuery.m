/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "BankAccountQuery.h"

/*!
** 【银行账户】查询对象.
*/
@implementation BankAccountQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _bankAccountId;
  NSInteger _bankAccountId0;
  NSInteger _bankAccountId1;
  NSMutableArray<NSNumber*>* _bankAccountIds; 
  /*!
  ** 【账户名称】属性.
  */
  NSString* _bankAccountName;
  NSString* _bankAccountName0;
  NSString* _bankAccountName1;
  NSString* _bankAccountName2;
  /*!
  ** 【账户类型】属性.
  */
  NSString* _bankAccountType;
  NSString* _bankAccountType0;
  NSString* _bankAccountType1;
  NSString* _bankAccountType2;
  NSMutableArray<NSString*>* _bankAccountTypes; 
  /*!
  ** 【账户名称】属性.
  */
  NSString* _accountNumber;
  NSString* _accountNumber0;
  NSString* _accountNumber1;
  NSString* _accountNumber2;
  /*!
  ** 【余额】属性.
  */
  NSDecimalNumber* _balance;
  NSDecimalNumber* _balance0;
  NSDecimalNumber* _balance1;
  /*!
  ** 【货币】属性.
  */
  NSString* _currency;
  NSString* _currency0;
  NSString* _currency1;
  NSString* _currency2;
  /*!
  ** 【生效日期】属性.
  */
  NSDate* _effectiveDate;
  NSDate* _effectiveDate0;
  NSDate* _effectiveDate1;
  /*!
  ** 【到期日期】属性.
  */
  NSDate* _expirationDate;
  NSDate* _expirationDate0;
  NSDate* _expirationDate1;
  /*!
  ** 【备注】属性.
  */
  NSString* _note;
  NSString* _note0;
  NSString* _note1;
  NSString* _note2;
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
    _bankAccountId = NSIntegerMin;
    _state = YES;
  }
  return self;
}

- (NSInteger)bankAccountId{
  return _bankAccountId;
}
- (void)setBankAccountId:(NSInteger)newBankAccountId {
  _bankAccountId = newBankAccountId;
}
- (NSInteger)bankAccountId0 {
  return _bankAccountId0;
}
- (void)setBankAccountId0:(NSInteger)newBankAccountId0 {
  _bankAccountId0 = newBankAccountId0;
}
- (NSInteger)bankAccountId1 {
  return _bankAccountId1;
}
- (void)setBankAccountId1:(NSInteger)newBankAccountId1 {
  _bankAccountId1 = newBankAccountId1;
}
- (NSMutableArray<NSNumber*>*)bankAccountIds {
  return _bankAccountIds;
}
- (void)setBankAccountIds:(NSMutableArray<NSNumber*>*)newBankAccountIds {
  _bankAccountIds = newBankAccountIds;
}   

- (NSString*)bankAccountName{
  return _bankAccountName;
}
- (void)setBankAccountName:(NSString*)newBankAccountName {
  _bankAccountName = newBankAccountName;
}
- (NSString*)bankAccountName0 {
  return _bankAccountName0;
}
- (void)setBankAccountName0:(NSString*)newBankAccountName0 {
  _bankAccountName0 = newBankAccountName0;
}
- (NSString*)bankAccountName1 {
  return _bankAccountName1;
}
- (void)setBankAccountName1:(NSString*)newBankAccountName1 {
  _bankAccountName1 = newBankAccountName1;
}
- (NSString*)bankAccountName2 {
  return _bankAccountName2;
}
- (void)setBankAccountName2:(NSString*)newBankAccountName2 {
  _bankAccountName2 = newBankAccountName2;
}

- (NSString*)bankAccountType{
  return _bankAccountType;
}
- (void)setBankAccountType:(NSString*)newBankAccountType {
  _bankAccountType = newBankAccountType;
}
- (NSString*)bankAccountType0 {
  return _bankAccountType0;
}
- (void)setBankAccountType0:(NSString*)newBankAccountType0 {
  _bankAccountType0 = newBankAccountType0;
}
- (NSString*)bankAccountType1 {
  return _bankAccountType1;
}
- (void)setBankAccountType1:(NSString*)newBankAccountType1 {
  _bankAccountType1 = newBankAccountType1;
}
- (NSString*)bankAccountType2 {
  return _bankAccountType2;
}
- (void)setBankAccountType2:(NSString*)newBankAccountType2 {
  _bankAccountType2 = newBankAccountType2;
}
- (NSMutableArray<NSString*>*)bankAccountTypes {
  return _bankAccountTypes;
}
- (void)setBankAccountTypes:(NSMutableArray<NSString*>*)newBankAccountTypes {
  _bankAccountTypes = newBankAccountTypes;
}  

- (NSString*)accountNumber{
  return _accountNumber;
}
- (void)setAccountNumber:(NSString*)newAccountNumber {
  _accountNumber = newAccountNumber;
}
- (NSString*)accountNumber0 {
  return _accountNumber0;
}
- (void)setAccountNumber0:(NSString*)newAccountNumber0 {
  _accountNumber0 = newAccountNumber0;
}
- (NSString*)accountNumber1 {
  return _accountNumber1;
}
- (void)setAccountNumber1:(NSString*)newAccountNumber1 {
  _accountNumber1 = newAccountNumber1;
}
- (NSString*)accountNumber2 {
  return _accountNumber2;
}
- (void)setAccountNumber2:(NSString*)newAccountNumber2 {
  _accountNumber2 = newAccountNumber2;
}

- (NSDecimalNumber*)balance{
  return _balance;
}
- (void)setBalance:(NSDecimalNumber*)newBalance {
  _balance = newBalance;
}
- (NSDecimalNumber*)balance0 {
  return _balance0;
}
- (void)setBalance0:(NSDecimalNumber*)newBalance0 {
  _balance0 = newBalance0;
}
- (NSDecimalNumber*)balance1 {
  return _balance1;
}
- (void)setBalance1:(NSDecimalNumber*)newBalance1 {
  _balance1 = newBalance1;
}

- (NSString*)currency{
  return _currency;
}
- (void)setCurrency:(NSString*)newCurrency {
  _currency = newCurrency;
}
- (NSString*)currency0 {
  return _currency0;
}
- (void)setCurrency0:(NSString*)newCurrency0 {
  _currency0 = newCurrency0;
}
- (NSString*)currency1 {
  return _currency1;
}
- (void)setCurrency1:(NSString*)newCurrency1 {
  _currency1 = newCurrency1;
}
- (NSString*)currency2 {
  return _currency2;
}
- (void)setCurrency2:(NSString*)newCurrency2 {
  _currency2 = newCurrency2;
}

- (NSDate*)effectiveDate{
  return _effectiveDate;
}
- (void)setEffectiveDate:(NSDate*)newEffectiveDate {
  _effectiveDate = newEffectiveDate;
}
- (NSDate*)effectiveDate0 {
  return _effectiveDate0;
}
- (void)setEffectiveDate0:(NSDate*)newEffectiveDate0 {
  _effectiveDate0 = newEffectiveDate0;
}
- (NSDate*)effectiveDate1 {
  return _effectiveDate1;
}
- (void)setEffectiveDate1:(NSDate*)newEffectiveDate1 {
  _effectiveDate1 = newEffectiveDate1;
}

- (NSDate*)expirationDate{
  return _expirationDate;
}
- (void)setExpirationDate:(NSDate*)newExpirationDate {
  _expirationDate = newExpirationDate;
}
- (NSDate*)expirationDate0 {
  return _expirationDate0;
}
- (void)setExpirationDate0:(NSDate*)newExpirationDate0 {
  _expirationDate0 = newExpirationDate0;
}
- (NSDate*)expirationDate1 {
  return _expirationDate1;
}
- (void)setExpirationDate1:(NSDate*)newExpirationDate1 {
  _expirationDate1 = newExpirationDate1;
}

- (NSString*)note{
  return _note;
}
- (void)setNote:(NSString*)newNote {
  _note = newNote;
}
- (NSString*)note0 {
  return _note0;
}
- (void)setNote0:(NSString*)newNote0 {
  _note0 = newNote0;
}
- (NSString*)note1 {
  return _note1;
}
- (void)setNote1:(NSString*)newNote1 {
  _note1 = newNote1;
}
- (NSString*)note2 {
  return _note2;
}
- (void)setNote2:(NSString*)newNote2 {
  _note2 = newNote2;
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
