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
** 【银行账户】对象.
*/
@interface BankAccount : NSObject

/*!
** 【】属性.
*/
- (NSInteger)id;
- (void)setId:(NSInteger)newId;

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
** 【账户名称】属性.
*/
- (NSString*)accountNumber;
- (void)setAccountNumber:(NSString*)newAccountNumber;

/*!
** 【余额】属性.
*/
- (NSDecimalNumber*)balance;
- (void)setBalance:(NSDecimalNumber*)newBalance;

/*!
** 【货币】属性.
*/
- (NSString*)currency;
- (void)setCurrency:(NSString*)newCurrency;

/*!
** 【生效日期】属性.
*/
- (NSDate*)effectiveDate;
- (void)setEffectiveDate:(NSDate*)newEffectiveDate;

/*!
** 【到期日期】属性.
*/
- (NSDate*)expirationDate;
- (void)setExpirationDate:(NSDate*)newExpirationDate;

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
