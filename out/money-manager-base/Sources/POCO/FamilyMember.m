/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "FamilyMember.h"

/*!
** 【家庭成员】对象.
*/
@interface FamilyMember() {

  /*!
  ** 【】属性.
  */
  NSInteger _id;

  /*!
  ** 【姓名】属性.
  */
  NSString* _name;

  /*!
  ** 【出生日期】属性.
  */
  NSDate* _birthdate;

  /*!
  ** 【身份证号】属性.
  */
  NSString* _nationalId;

  /*!
  ** 【备注】属性.
  */
  NSString* _note;

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

@implementation FamilyMember

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
** 【姓名】属性.
*/
- (NSString*)name {
  return _name;
}
- (void)setName:(NSString*)newName {
  _name = newName;
}

/*!
** 【出生日期】属性.
*/
- (NSDate*)birthdate {
  return _birthdate;
}
- (void)setBirthdate:(NSDate*)newBirthdate {
  _birthdate = newBirthdate;
}

/*!
** 【身份证号】属性.
*/
- (NSString*)nationalId {
  return _nationalId;
}
- (void)setNationalId:(NSString*)newNationalId {
  _nationalId = newNationalId;
}

/*!
** 【备注】属性.
*/
- (NSString*)note {
  return _note;
}
- (void)setNote:(NSString*)newNote {
  _note = newNote;
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
