/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Account.h"

/*!
** 【账户】对象.
*/
@interface Account() {

  /*!
  ** 【】属性.
  */
  NSInteger _id;

  /*!
  ** 【账户编码】属性.
  */
  NSString* _code;

  /*!
  ** 【账户名称】属性.
  */
  NSString* _name;

  /*!
  ** 【账户类型】属性.
  */
  NSString* _type;

  /*!
  ** 【类别】属性.
  */
  NSString* _category;

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

@implementation Account

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
** 【账户编码】属性.
*/
- (NSString*)code {
  return _code;
}
- (void)setCode:(NSString*)newCode {
  _code = newCode;
}

/*!
** 【账户名称】属性.
*/
- (NSString*)name {
  return _name;
}
- (void)setName:(NSString*)newName {
  _name = newName;
}

/*!
** 【账户类型】属性.
*/
- (NSString*)type {
  return _type;
}
- (void)setType:(NSString*)newType {
  _type = newType;
}

/*!
** 【类别】属性.
*/
- (NSString*)category {
  return _category;
}
- (void)setCategory:(NSString*)newCategory {
  _category = newCategory;
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
