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
** 【家庭成员】查询对象.
*/
@interface FamilyMemberQuery : NSObject
/*!
** 【】属性.
*/
- (NSInteger)familyMemberId;
- (void)setFamilyMemberId:(NSInteger)newFamilyMemberId;
- (NSInteger)familyMemberId0;
- (void)setFamilyMemberId0:(NSInteger)newFamilyMemberId0;
- (NSInteger)familyMemberId1;
- (void)setFamilyMemberId1:(NSInteger)newFamilyMemberId1;
- (NSMutableArray<NSNumber*>*)familyMemberIds;
- (void)setFamilyMemberIds:(NSMutableArray<NSNumber*>*)newFamilyMemberIds;  
/*!
** 【姓名】属性.
*/
- (NSString*)familyMemberName;
- (void)setFamilyMemberName:(NSString*)newFamilyMemberName;
- (NSString*)familyMemberName0;
- (void)setFamilyMemberName0:(NSString*)newFamilyMemberName0;
- (NSString*)familyMemberName1;
- (void)setFamilyMemberName1:(NSString*)newFamilyMemberName1;
- (NSString*)familyMemberName2;
- (void)setFamilyMemberName2:(NSString*)newFamilyMemberName2;
/*!
** 【出生日期】属性.
*/
- (NSDate*)birthdate;
- (void)setBirthdate:(NSDate*)newBirthdate;
- (NSDate*)birthdate0;
- (void)setBirthdate0:(NSDate*)newBirthdate0;
- (NSDate*)birthdate1;
- (void)setBirthdate1:(NSDate*)newBirthdate1;
/*!
** 【身份证号】属性.
*/
- (NSString*)nationalId;
- (void)setNationalId:(NSString*)newNationalId;
- (NSString*)nationalId0;
- (void)setNationalId0:(NSString*)newNationalId0;
- (NSString*)nationalId1;
- (void)setNationalId1:(NSString*)newNationalId1;
- (NSString*)nationalId2;
- (void)setNationalId2:(NSString*)newNationalId2;
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
