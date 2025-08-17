/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "FamilyMemberSQL.h"

@implementation FamilyMemberSQL

+ (NSString*)getInsertSQL:(FamilyMemberQuery*)familyMember {
  NSString* ret = @""
    "insert into tn_mm_fammbr ("
    "  fammbrid,"
    "  fammbrnm,"
    "  bdt,"
    "  natid,"
    "  nt,"
    "  sta,"
    "  modid,"
    "  modtyp,"
    "  crttm,"
    "  lmt"
    ") values (";
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeInteger:familyMember.familyMemberId]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:familyMember.familyMemberName andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:familyMember.birthdate]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:familyMember.nationalId andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:familyMember.note andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeBool:familyMember.state]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:familyMember.modifierId andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeString:familyMember.modifierType andVar:-1]];
  ret = [ret stringByAppendingFormat:@"%@,", [MoneyManagerSQL escapeDate:familyMember.createdTime]];
  ret = [ret stringByAppendingFormat:@"%@", [MoneyManagerSQL escapeDate:familyMember.lastModifiedTime]];
  [ret stringByAppendingString:@")"];
  return ret;
}

+ (NSString*)getUpdateSQL:(FamilyMemberQuery*)familyMember {
  NSString* ret = @""
    "update tn_mm_fammbr set ";
  if (familyMember.familyMemberName != nil) {
    ret = [ret stringByAppendingFormat:@"fammbrnm = %@, ", [MoneyManagerSQL escapeString:familyMember.familyMemberName andVar:-1]];
  }
  if (familyMember.birthdate != nil) {
    ret = [ret stringByAppendingFormat:@"bdt = %@, ", [MoneyManagerSQL escapeDate:familyMember.birthdate]];
  }
  if (familyMember.nationalId != nil) {
    ret = [ret stringByAppendingFormat:@"natid = %@, ", [MoneyManagerSQL escapeString:familyMember.nationalId andVar:-1]];
  }
  if (familyMember.note != nil) {
    ret = [ret stringByAppendingFormat:@"nt = %@, ", [MoneyManagerSQL escapeString:familyMember.note andVar:-1]];
  }
  ret = [ret stringByAppendingFormat:@"sta = %@, ", [MoneyManagerSQL escapeBool:familyMember.state]];
  if (familyMember.modifierId != nil) {
    ret = [ret stringByAppendingFormat:@"modid = %@, ", [MoneyManagerSQL escapeString:familyMember.modifierId andVar:-1]];
  }
  if (familyMember.modifierType != nil) {
    ret = [ret stringByAppendingFormat:@"modtyp = %@, ", [MoneyManagerSQL escapeString:familyMember.modifierType andVar:-1]];
  }
  if (familyMember.createdTime != nil) {
    ret = [ret stringByAppendingFormat:@"crttm = %@, ", [MoneyManagerSQL escapeDate:familyMember.createdTime]];
  }
  if (familyMember.lastModifiedTime != nil) {
    ret = [ret stringByAppendingFormat:@"lmt = %@ ", [MoneyManagerSQL escapeDate:familyMember.lastModifiedTime]];
  }
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:familyMember.familyMemberId];
  ret = [ret stringByAppendingFormat:@"and fammbrid = %@", val];
  return ret;
}

+ (NSString*)getDeleteSQL:(FamilyMemberQuery*)familyMember {
  NSString* ret = @""
    "delete from tn_mm_fammbr ";
  [ret stringByAppendingString:@"where 1=1"];
  NSString* val;
  val = [MoneyManagerSQL escapeInteger:familyMember.familyMemberId];
  ret = [ret stringByAppendingFormat:@"and fammbrid = %@", val];
  return ret;
}

+ (NSString*)getSelectSQL:(FamilyMemberQuery*)familyMember {
  NSString* sql = @"select ";
  sql = [sql stringByAppendingString:@"fammbr.fammbrid familyMemberId,"];
  sql = [sql stringByAppendingString:@"fammbr.fammbrnm familyMemberName,"];
  sql = [sql stringByAppendingString:@"fammbr.bdt birthdate,"];
  sql = [sql stringByAppendingString:@"fammbr.natid nationalId,"];
  sql = [sql stringByAppendingString:@"fammbr.nt note,"];
  sql = [sql stringByAppendingString:@"fammbr.sta state,"];
  sql = [sql stringByAppendingString:@"fammbr.modid modifierId,"];
  sql = [sql stringByAppendingString:@"fammbr.modtyp modifierType,"];
  sql = [sql stringByAppendingString:@"fammbr.crttm createdTime,"];
  sql = [sql stringByAppendingString:@"fammbr.lmt lastModifiedTime,"];
  sql = [sql stringByAppendingString:@"0 "];
  sql = [sql stringByAppendingString:@"from tn_mm_fammbr fammbr "];
  sql = [sql stringByAppendingString:@"where 1 = 1 "];
  if (familyMember.familyMemberId != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:familyMember.familyMemberId];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrid = %@ ", val];
  }
  if (familyMember.familyMemberId0 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:familyMember.familyMemberId0];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrid > %@ ", val];
  }
  if (familyMember.familyMemberId1 != NSIntegerMin)
  {
    NSString* val = [MoneyManagerSQL escapeInteger:familyMember.familyMemberId1];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrid < %@ ", val];
  }
  if (familyMember.familyMemberName != nil && familyMember.familyMemberName.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.familyMemberName andVar:-1];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrnm = %@ ", val];
  }
  if (familyMember.familyMemberName0 != nil && familyMember.familyMemberName0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.familyMemberName0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrnm like %@ ", val];
  }
  if (familyMember.familyMemberName1 != nil && familyMember.familyMemberName1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.familyMemberName1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrnm like %@ ", val];
  }
  if (familyMember.familyMemberName2 != nil && familyMember.familyMemberName2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.familyMemberName2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and fammbr.fammbrnm like %@ ", val];
  }
  if (familyMember.nationalId != nil && familyMember.nationalId.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.nationalId andVar:-1];
    sql = [sql stringByAppendingFormat:@"and fammbr.natid = %@ ", val];
  }
  if (familyMember.nationalId0 != nil && familyMember.nationalId0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.nationalId0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and fammbr.natid like %@ ", val];
  }
  if (familyMember.nationalId1 != nil && familyMember.nationalId1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.nationalId1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and fammbr.natid like %@ ", val];
  }
  if (familyMember.nationalId2 != nil && familyMember.nationalId2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.nationalId2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and fammbr.natid like %@ ", val];
  }
  if (familyMember.note != nil && familyMember.note.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.note andVar:-1];
    sql = [sql stringByAppendingFormat:@"and fammbr.nt = %@ ", val];
  }
  if (familyMember.note0 != nil && familyMember.note0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.note0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and fammbr.nt like %@ ", val];
  }
  if (familyMember.note1 != nil && familyMember.note1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.note1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and fammbr.nt like %@ ", val];
  }
  if (familyMember.note2 != nil && familyMember.note2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.note2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and fammbr.nt like %@ ", val];
  }
  if (familyMember.modifierId != nil && familyMember.modifierId.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierId andVar:-1];
    sql = [sql stringByAppendingFormat:@"and fammbr.modid = %@ ", val];
  }
  if (familyMember.modifierId0 != nil && familyMember.modifierId0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierId0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and fammbr.modid like %@ ", val];
  }
  if (familyMember.modifierId1 != nil && familyMember.modifierId1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierId1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and fammbr.modid like %@ ", val];
  }
  if (familyMember.modifierId2 != nil && familyMember.modifierId2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierId2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and fammbr.modid like %@ ", val];
  }
  if (familyMember.modifierType != nil && familyMember.modifierType.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierType andVar:-1];
    sql = [sql stringByAppendingFormat:@"and fammbr.modtyp = %@ ", val];
  }
  if (familyMember.modifierType0 != nil && familyMember.modifierType0.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierType0 andVar:0];
    sql = [sql stringByAppendingFormat:@"and fammbr.modtyp like %@ ", val];
  }
  if (familyMember.modifierType1 != nil && familyMember.modifierType1.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierType1 andVar:1];
    sql = [sql stringByAppendingFormat:@"and fammbr.modtyp like %@ ", val];
  }
  if (familyMember.modifierType2 != nil && familyMember.modifierType2.length > 0)
  {
    NSString* val = [MoneyManagerSQL escapeString:familyMember.modifierType2 andVar:2];
    sql = [sql stringByAppendingFormat:@"and fammbr.modtyp like %@ ", val];
  }
  return sql;
}

@end
