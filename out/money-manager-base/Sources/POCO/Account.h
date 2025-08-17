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
** 【账户】对象.
*/
@interface Account : NSObject

/*!
** 【】属性.
*/
- (NSInteger)id;
- (void)setId:(NSInteger)newId;

/*!
** 【账户编码】属性.
*/
- (NSString*)code;
- (void)setCode:(NSString*)newCode;

/*!
** 【账户名称】属性.
*/
- (NSString*)name;
- (void)setName:(NSString*)newName;

/*!
** 【账户类型】属性.
*/
- (NSString*)type;
- (void)setType:(NSString*)newType;

/*!
** 【类别】属性.
*/
- (NSString*)category;
- (void)setCategory:(NSString*)newCategory;

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
