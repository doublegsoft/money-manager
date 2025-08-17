/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "AccountQuery.h"

/*!
** 【账户】查询对象.
*/
@implementation AccountQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _accountId;
  NSInteger _accountId0;
  NSInteger _accountId1;
  NSMutableArray<NSNumber*>* _accountIds; 
  /*!
  ** 【账户编码】属性.
  */
  NSString* _accountCode;
  NSString* _accountCode0;
  NSString* _accountCode1;
  NSString* _accountCode2;
  /*!
  ** 【账户名称】属性.
  */
  NSString* _accountName;
  NSString* _accountName0;
  NSString* _accountName1;
  NSString* _accountName2;
  /*!
  ** 【账户类型】属性.
  */
  NSString* _accountType;
  NSString* _accountType0;
  NSString* _accountType1;
  NSString* _accountType2;
  NSMutableArray<NSString*>* _accountTypes; 
  /*!
  ** 【类别】属性.
  */
  NSString* _category;
  NSString* _category0;
  NSString* _category1;
  NSString* _category2;
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
    _accountId = NSIntegerMin;
    _state = YES;
  }
  return self;
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

- (NSString*)accountCode{
  return _accountCode;
}
- (void)setAccountCode:(NSString*)newAccountCode {
  _accountCode = newAccountCode;
}
- (NSString*)accountCode0 {
  return _accountCode0;
}
- (void)setAccountCode0:(NSString*)newAccountCode0 {
  _accountCode0 = newAccountCode0;
}
- (NSString*)accountCode1 {
  return _accountCode1;
}
- (void)setAccountCode1:(NSString*)newAccountCode1 {
  _accountCode1 = newAccountCode1;
}
- (NSString*)accountCode2 {
  return _accountCode2;
}
- (void)setAccountCode2:(NSString*)newAccountCode2 {
  _accountCode2 = newAccountCode2;
}

- (NSString*)accountName{
  return _accountName;
}
- (void)setAccountName:(NSString*)newAccountName {
  _accountName = newAccountName;
}
- (NSString*)accountName0 {
  return _accountName0;
}
- (void)setAccountName0:(NSString*)newAccountName0 {
  _accountName0 = newAccountName0;
}
- (NSString*)accountName1 {
  return _accountName1;
}
- (void)setAccountName1:(NSString*)newAccountName1 {
  _accountName1 = newAccountName1;
}
- (NSString*)accountName2 {
  return _accountName2;
}
- (void)setAccountName2:(NSString*)newAccountName2 {
  _accountName2 = newAccountName2;
}

- (NSString*)accountType{
  return _accountType;
}
- (void)setAccountType:(NSString*)newAccountType {
  _accountType = newAccountType;
}
- (NSString*)accountType0 {
  return _accountType0;
}
- (void)setAccountType0:(NSString*)newAccountType0 {
  _accountType0 = newAccountType0;
}
- (NSString*)accountType1 {
  return _accountType1;
}
- (void)setAccountType1:(NSString*)newAccountType1 {
  _accountType1 = newAccountType1;
}
- (NSString*)accountType2 {
  return _accountType2;
}
- (void)setAccountType2:(NSString*)newAccountType2 {
  _accountType2 = newAccountType2;
}
- (NSMutableArray<NSString*>*)accountTypes {
  return _accountTypes;
}
- (void)setAccountTypes:(NSMutableArray<NSString*>*)newAccountTypes {
  _accountTypes = newAccountTypes;
}  

- (NSString*)category{
  return _category;
}
- (void)setCategory:(NSString*)newCategory {
  _category = newCategory;
}
- (NSString*)category0 {
  return _category0;
}
- (void)setCategory0:(NSString*)newCategory0 {
  _category0 = newCategory0;
}
- (NSString*)category1 {
  return _category1;
}
- (void)setCategory1:(NSString*)newCategory1 {
  _category1 = newCategory1;
}
- (NSString*)category2 {
  return _category2;
}
- (void)setCategory2:(NSString*)newCategory2 {
  _category2 = newCategory2;
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
