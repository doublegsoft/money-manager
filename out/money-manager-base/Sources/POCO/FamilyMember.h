/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

/*!
** 【家庭成员】对象.
*/
@interface FamilyMember : NSObject

/*!
** 【】属性.
*/
- (NSInteger)id;
- (void)setId:(NSInteger)newId;

/*!
** 【姓名】属性.
*/
- (NSString*)name;
- (void)setName:(NSString*)newName;

/*!
** 【出生日期】属性.
*/
- (NSDate*)birthdate;
- (void)setBirthdate:(NSDate*)newBirthdate;

/*!
** 【身份证号】属性.
*/
- (NSString*)nationalId;
- (void)setNationalId:(NSString*)newNationalId;

/*!
** 【备注】属性.
*/
- (NSString*)note;
- (void)setNote:(NSString*)newNote;

/*!
** 【系统状态】属性.
*/
- (BOOL)state;
- (void)setState:(BOOL)newState;

/*!
** 【修改者】属性.
*/
- (NSString*)modifierId;
- (void)setModifierId:(NSString*)newModifierId;

/*!
** 【修改者类型】属性.
*/
- (NSString*)modifierType;
- (void)setModifierType:(NSString*)newModifierType;

/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime;
- (void)setCreatedTime:(NSDate*)newCreatedTime;

/*!
** 【最后更新时间】属性.
*/
- (NSDate*)lastModifiedTime;
- (void)setLastModifiedTime:(NSDate*)newLastModifiedTime;

- (instancetype)init;
@end
