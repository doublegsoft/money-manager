/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "FamilyMemberQuery.h"

/*!
** 【家庭成员】查询对象.
*/
@implementation FamilyMemberQuery {
  /*!
  ** 【】属性.
  */
  NSInteger _familyMemberId;
  NSInteger _familyMemberId0;
  NSInteger _familyMemberId1;
  NSMutableArray<NSNumber*>* _familyMemberIds; 
  /*!
  ** 【姓名】属性.
  */
  NSString* _familyMemberName;
  NSString* _familyMemberName0;
  NSString* _familyMemberName1;
  NSString* _familyMemberName2;
  /*!
  ** 【出生日期】属性.
  */
  NSDate* _birthdate;
  NSDate* _birthdate0;
  NSDate* _birthdate1;
  /*!
  ** 【身份证号】属性.
  */
  NSString* _nationalId;
  NSString* _nationalId0;
  NSString* _nationalId1;
  NSString* _nationalId2;
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
    _familyMemberId = NSIntegerMin;
    _state = YES;
  }
  return self;
}

- (NSInteger)familyMemberId{
  return _familyMemberId;
}
- (void)setFamilyMemberId:(NSInteger)newFamilyMemberId {
  _familyMemberId = newFamilyMemberId;
}
- (NSInteger)familyMemberId0 {
  return _familyMemberId0;
}
- (void)setFamilyMemberId0:(NSInteger)newFamilyMemberId0 {
  _familyMemberId0 = newFamilyMemberId0;
}
- (NSInteger)familyMemberId1 {
  return _familyMemberId1;
}
- (void)setFamilyMemberId1:(NSInteger)newFamilyMemberId1 {
  _familyMemberId1 = newFamilyMemberId1;
}
- (NSMutableArray<NSNumber*>*)familyMemberIds {
  return _familyMemberIds;
}
- (void)setFamilyMemberIds:(NSMutableArray<NSNumber*>*)newFamilyMemberIds {
  _familyMemberIds = newFamilyMemberIds;
}   

- (NSString*)familyMemberName{
  return _familyMemberName;
}
- (void)setFamilyMemberName:(NSString*)newFamilyMemberName {
  _familyMemberName = newFamilyMemberName;
}
- (NSString*)familyMemberName0 {
  return _familyMemberName0;
}
- (void)setFamilyMemberName0:(NSString*)newFamilyMemberName0 {
  _familyMemberName0 = newFamilyMemberName0;
}
- (NSString*)familyMemberName1 {
  return _familyMemberName1;
}
- (void)setFamilyMemberName1:(NSString*)newFamilyMemberName1 {
  _familyMemberName1 = newFamilyMemberName1;
}
- (NSString*)familyMemberName2 {
  return _familyMemberName2;
}
- (void)setFamilyMemberName2:(NSString*)newFamilyMemberName2 {
  _familyMemberName2 = newFamilyMemberName2;
}

- (NSDate*)birthdate{
  return _birthdate;
}
- (void)setBirthdate:(NSDate*)newBirthdate {
  _birthdate = newBirthdate;
}
- (NSDate*)birthdate0 {
  return _birthdate0;
}
- (void)setBirthdate0:(NSDate*)newBirthdate0 {
  _birthdate0 = newBirthdate0;
}
- (NSDate*)birthdate1 {
  return _birthdate1;
}
- (void)setBirthdate1:(NSDate*)newBirthdate1 {
  _birthdate1 = newBirthdate1;
}

- (NSString*)nationalId{
  return _nationalId;
}
- (void)setNationalId:(NSString*)newNationalId {
  _nationalId = newNationalId;
}
- (NSString*)nationalId0 {
  return _nationalId0;
}
- (void)setNationalId0:(NSString*)newNationalId0 {
  _nationalId0 = newNationalId0;
}
- (NSString*)nationalId1 {
  return _nationalId1;
}
- (void)setNationalId1:(NSString*)newNationalId1 {
  _nationalId1 = newNationalId1;
}
- (NSString*)nationalId2 {
  return _nationalId2;
}
- (void)setNationalId2:(NSString*)newNationalId2 {
  _nationalId2 = newNationalId2;
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
