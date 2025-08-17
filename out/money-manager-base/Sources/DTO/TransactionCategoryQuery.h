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
** 【交易类别】查询对象.
*/
@interface TransactionCategoryQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)transactionCategoryId;
- (void)setTransactionCategoryId:(NSInteger)newTransactionCategoryId;
- (NSInteger)transactionCategoryId0;
- (void)setTransactionCategoryId0:(NSInteger)newTransactionCategoryId0;
- (NSInteger)transactionCategoryId1;
- (void)setTransactionCategoryId1:(NSInteger)newTransactionCategoryId1;
- (NSMutableArray<NSNumber*>*)transactionCategoryIds;
- (void)setTransactionCategoryIds:(NSMutableArray<NSNumber*>*)newTransactionCategoryIds;  
/*!
** 【名称】属性.
*/
- (NSString*)transactionCategoryName;
- (void)setTransactionCategoryName:(NSString*)newTransactionCategoryName;
- (NSString*)transactionCategoryName0;
- (void)setTransactionCategoryName0:(NSString*)newTransactionCategoryName0;
- (NSString*)transactionCategoryName1;
- (void)setTransactionCategoryName1:(NSString*)newTransactionCategoryName1;
- (NSString*)transactionCategoryName2;
- (void)setTransactionCategoryName2:(NSString*)newTransactionCategoryName2;
/*!
** 【交易类型】属性.
*/
- (NSString*)transactionCategoryType;
- (void)setTransactionCategoryType:(NSString*)newTransactionCategoryType;
- (NSString*)transactionCategoryType0;
- (void)setTransactionCategoryType0:(NSString*)newTransactionCategoryType0;
- (NSString*)transactionCategoryType1;
- (void)setTransactionCategoryType1:(NSString*)newTransactionCategoryType1;
- (NSString*)transactionCategoryType2;
- (void)setTransactionCategoryType2:(NSString*)newTransactionCategoryType2;
- (NSMutableArray<NSString*>*)transactionCategoryTypes;
- (void)setTransactionCategoryTypes:(NSMutableArray<NSString*>*)newTransactionCategoryTypes;
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
