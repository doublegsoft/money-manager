/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#import "MoneyManagerSQL.h"
#import "POCO/LedgerEntry.h"
#import "DTO/LedgerEntryQuery.h"

@interface LedgerEntrySQL : NSObject

/*!
** 获取插入语句。
*/
+ (NSString*)getInsertSQL:(LedgerEntryQuery*)ledgerEntry;

/*!
** 获取更新语句。
*/
+ (NSString*)getUpdateSQL:(LedgerEntryQuery*)ledgerEntry;

/*!
** 获取删除语句。
*/
+ (NSString*)getDeleteSQL:(LedgerEntryQuery*)ledgerEntry;

/*!
** 获取查询语句。
*/
+ (NSString*)getSelectSQL:(LedgerEntryQuery*)ledgerEntry;

@end
