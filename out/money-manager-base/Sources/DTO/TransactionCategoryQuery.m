/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "TransactionCategoryQuery.h"

/*!
** 【交易类别】查询对象.
*/
@implementation TransactionCategoryQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _transactionCategoryId;
  NSInteger _transactionCategoryId0;
  NSInteger _transactionCategoryId1;
  NSMutableArray<NSNumber*>* _transactionCategoryIds; 
  /*!
  ** 【名称】属性.
  */
  NSString* _transactionCategoryName;
  NSString* _transactionCategoryName0;
  NSString* _transactionCategoryName1;
  NSString* _transactionCategoryName2;
  /*!
  ** 【交易类型】属性.
  */
  NSString* _transactionCategoryType;
  NSString* _transactionCategoryType0;
  NSString* _transactionCategoryType1;
  NSString* _transactionCategoryType2;
  NSMutableArray<NSString*>* _transactionCategoryTypes; 
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
    _transactionCategoryId = NSIntegerMin;
    _state = YES;
  }
  return self;
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

- (NSString*)transactionCategoryName{
  return _transactionCategoryName;
}
- (void)setTransactionCategoryName:(NSString*)newTransactionCategoryName {
  _transactionCategoryName = newTransactionCategoryName;
}
- (NSString*)transactionCategoryName0 {
  return _transactionCategoryName0;
}
- (void)setTransactionCategoryName0:(NSString*)newTransactionCategoryName0 {
  _transactionCategoryName0 = newTransactionCategoryName0;
}
- (NSString*)transactionCategoryName1 {
  return _transactionCategoryName1;
}
- (void)setTransactionCategoryName1:(NSString*)newTransactionCategoryName1 {
  _transactionCategoryName1 = newTransactionCategoryName1;
}
- (NSString*)transactionCategoryName2 {
  return _transactionCategoryName2;
}
- (void)setTransactionCategoryName2:(NSString*)newTransactionCategoryName2 {
  _transactionCategoryName2 = newTransactionCategoryName2;
}

- (NSString*)transactionCategoryType{
  return _transactionCategoryType;
}
- (void)setTransactionCategoryType:(NSString*)newTransactionCategoryType {
  _transactionCategoryType = newTransactionCategoryType;
}
- (NSString*)transactionCategoryType0 {
  return _transactionCategoryType0;
}
- (void)setTransactionCategoryType0:(NSString*)newTransactionCategoryType0 {
  _transactionCategoryType0 = newTransactionCategoryType0;
}
- (NSString*)transactionCategoryType1 {
  return _transactionCategoryType1;
}
- (void)setTransactionCategoryType1:(NSString*)newTransactionCategoryType1 {
  _transactionCategoryType1 = newTransactionCategoryType1;
}
- (NSString*)transactionCategoryType2 {
  return _transactionCategoryType2;
}
- (void)setTransactionCategoryType2:(NSString*)newTransactionCategoryType2 {
  _transactionCategoryType2 = newTransactionCategoryType2;
}
- (NSMutableArray<NSString*>*)transactionCategoryTypes {
  return _transactionCategoryTypes;
}
- (void)setTransactionCategoryTypes:(NSMutableArray<NSString*>*)newTransactionCategoryTypes {
  _transactionCategoryTypes = newTransactionCategoryTypes;
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
