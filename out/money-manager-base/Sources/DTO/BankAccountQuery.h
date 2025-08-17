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
** 【银行账户】查询对象.
*/
@interface BankAccountQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)bankAccountId;
- (void)setBankAccountId:(NSInteger)newBankAccountId;
- (NSInteger)bankAccountId0;
- (void)setBankAccountId0:(NSInteger)newBankAccountId0;
- (NSInteger)bankAccountId1;
- (void)setBankAccountId1:(NSInteger)newBankAccountId1;
- (NSMutableArray<NSNumber*>*)bankAccountIds;
- (void)setBankAccountIds:(NSMutableArray<NSNumber*>*)newBankAccountIds;  
/*!
** 【账户名称】属性.
*/
- (NSString*)bankAccountName;
- (void)setBankAccountName:(NSString*)newBankAccountName;
- (NSString*)bankAccountName0;
- (void)setBankAccountName0:(NSString*)newBankAccountName0;
- (NSString*)bankAccountName1;
- (void)setBankAccountName1:(NSString*)newBankAccountName1;
- (NSString*)bankAccountName2;
- (void)setBankAccountName2:(NSString*)newBankAccountName2;
/*!
** 【账户类型】属性.
*/
- (NSString*)bankAccountType;
- (void)setBankAccountType:(NSString*)newBankAccountType;
- (NSString*)bankAccountType0;
- (void)setBankAccountType0:(NSString*)newBankAccountType0;
- (NSString*)bankAccountType1;
- (void)setBankAccountType1:(NSString*)newBankAccountType1;
- (NSString*)bankAccountType2;
- (void)setBankAccountType2:(NSString*)newBankAccountType2;
- (NSMutableArray<NSString*>*)bankAccountTypes;
- (void)setBankAccountTypes:(NSMutableArray<NSString*>*)newBankAccountTypes;
/*!
** 【账户名称】属性.
*/
- (NSString*)accountNumber;
- (void)setAccountNumber:(NSString*)newAccountNumber;
- (NSString*)accountNumber0;
- (void)setAccountNumber0:(NSString*)newAccountNumber0;
- (NSString*)accountNumber1;
- (void)setAccountNumber1:(NSString*)newAccountNumber1;
- (NSString*)accountNumber2;
- (void)setAccountNumber2:(NSString*)newAccountNumber2;
/*!
** 【余额】属性.
*/
- (NSDecimalNumber*)balance;
- (void)setBalance:(NSDecimalNumber*)newBalance;
- (NSDecimalNumber*)balance0;
- (void)setBalance0:(NSDecimalNumber*)newBalance0;
- (NSDecimalNumber*)balance1;
- (void)setBalance1:(NSDecimalNumber*)newBalance1;
/*!
** 【货币】属性.
*/
- (NSString*)currency;
- (void)setCurrency:(NSString*)newCurrency;
- (NSString*)currency0;
- (void)setCurrency0:(NSString*)newCurrency0;
- (NSString*)currency1;
- (void)setCurrency1:(NSString*)newCurrency1;
- (NSString*)currency2;
- (void)setCurrency2:(NSString*)newCurrency2;
/*!
** 【生效日期】属性.
*/
- (NSDate*)effectiveDate;
- (void)setEffectiveDate:(NSDate*)newEffectiveDate;
- (NSDate*)effectiveDate0;
- (void)setEffectiveDate0:(NSDate*)newEffectiveDate0;
- (NSDate*)effectiveDate1;
- (void)setEffectiveDate1:(NSDate*)newEffectiveDate1;
/*!
** 【到期日期】属性.
*/
- (NSDate*)expirationDate;
- (void)setExpirationDate:(NSDate*)newExpirationDate;
- (NSDate*)expirationDate0;
- (void)setExpirationDate0:(NSDate*)newExpirationDate0;
- (NSDate*)expirationDate1;
- (void)setExpirationDate1:(NSDate*)newExpirationDate1;
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
