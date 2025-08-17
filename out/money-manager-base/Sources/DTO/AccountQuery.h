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
** 【账户】查询对象.
*/
@interface AccountQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)accountId;
- (void)setAccountId:(NSInteger)newAccountId;
- (NSInteger)accountId0;
- (void)setAccountId0:(NSInteger)newAccountId0;
- (NSInteger)accountId1;
- (void)setAccountId1:(NSInteger)newAccountId1;
- (NSMutableArray<NSNumber*>*)accountIds;
- (void)setAccountIds:(NSMutableArray<NSNumber*>*)newAccountIds;  
/*!
** 【账户编码】属性.
*/
- (NSString*)accountCode;
- (void)setAccountCode:(NSString*)newAccountCode;
- (NSString*)accountCode0;
- (void)setAccountCode0:(NSString*)newAccountCode0;
- (NSString*)accountCode1;
- (void)setAccountCode1:(NSString*)newAccountCode1;
- (NSString*)accountCode2;
- (void)setAccountCode2:(NSString*)newAccountCode2;
/*!
** 【账户名称】属性.
*/
- (NSString*)accountName;
- (void)setAccountName:(NSString*)newAccountName;
- (NSString*)accountName0;
- (void)setAccountName0:(NSString*)newAccountName0;
- (NSString*)accountName1;
- (void)setAccountName1:(NSString*)newAccountName1;
- (NSString*)accountName2;
- (void)setAccountName2:(NSString*)newAccountName2;
/*!
** 【账户类型】属性.
*/
- (NSString*)accountType;
- (void)setAccountType:(NSString*)newAccountType;
- (NSString*)accountType0;
- (void)setAccountType0:(NSString*)newAccountType0;
- (NSString*)accountType1;
- (void)setAccountType1:(NSString*)newAccountType1;
- (NSString*)accountType2;
- (void)setAccountType2:(NSString*)newAccountType2;
- (NSMutableArray<NSString*>*)accountTypes;
- (void)setAccountTypes:(NSMutableArray<NSString*>*)newAccountTypes;
/*!
** 【类别】属性.
*/
- (NSString*)category;
- (void)setCategory:(NSString*)newCategory;
- (NSString*)category0;
- (void)setCategory0:(NSString*)newCategory0;
- (NSString*)category1;
- (void)setCategory1:(NSString*)newCategory1;
- (NSString*)category2;
- (void)setCategory2:(NSString*)newCategory2;
/*!
** 【备注】属性.
*/
- (NSString*)note;
- (void)setNote:(NSString*)newNote;
- (NSString*)note0;
- (void)setNote0:(NSString*)newNote0;
- (NSString*)note1;
- (void)setNote1:(NSString*)newNote1;
- (NSString*)note2;
- (void)setNote2:(NSString*)newNote2;
/*!
** 【系统状态】属性.
*/
- (BOOL)state;
- (void)setState:(BOOL)newState;
- (BOOL)state0;
- (void)setState0:(BOOL)newState0;
- (BOOL)state1;
- (void)setState1:(BOOL)newState1;
- (NSMutableArray<NSNumber*>*)states;
- (void)setStates:(NSMutableArray<NSNumber*>*)newStates;  
/*!
** 【修改者】属性.
*/
- (NSString*)modifierId;
- (void)setModifierId:(NSString*)newModifierId;
- (NSString*)modifierId0;
- (void)setModifierId0:(NSString*)newModifierId0;
- (NSString*)modifierId1;
- (void)setModifierId1:(NSString*)newModifierId1;
- (NSString*)modifierId2;
- (void)setModifierId2:(NSString*)newModifierId2;
/*!
** 【修改者类型】属性.
*/
- (NSString*)modifierType;
- (void)setModifierType:(NSString*)newModifierType;
- (NSString*)modifierType0;
- (void)setModifierType0:(NSString*)newModifierType0;
- (NSString*)modifierType1;
- (void)setModifierType1:(NSString*)newModifierType1;
- (NSString*)modifierType2;
- (void)setModifierType2:(NSString*)newModifierType2;
/*!
** 【创建时间】属性.
*/
- (NSDate*)createdTime;
- (void)setCreatedTime:(NSDate*)newCreatedTime;
- (NSDate*)createdTime0;
- (void)setCreatedTime0:(NSDate*)newCreatedTime0;
- (NSDate*)createdTime1;
- (void)setCreatedTime1:(NSDate*)newCreatedTime1;
/*!
** 【最后更新时间】属性.
*/
- (NSDate*)lastModifiedTime;
- (void)setLastModifiedTime:(NSDate*)newLastModifiedTime;
- (NSDate*)lastModifiedTime0;
- (void)setLastModifiedTime0:(NSDate*)newLastModifiedTime0;
- (NSDate*)lastModifiedTime1;
- (void)setLastModifiedTime1:(NSDate*)newLastModifiedTime1;
@end
