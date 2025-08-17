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
#import "POCO/TransactionCategory.h"
#import "DTO/TransactionCategoryQuery.h"

@interface TransactionCategorySQL : NSObject

/*!
** 获取插入语句。
*/
+ (NSString*)getInsertSQL:(TransactionCategoryQuery*)transactionCategory;

/*!
** 获取更新语句。
*/
+ (NSString*)getUpdateSQL:(TransactionCategoryQuery*)transactionCategory;

/*!
** 获取删除语句。
*/
+ (NSString*)getDeleteSQL:(TransactionCategoryQuery*)transactionCategory;

/*!
** 获取查询语句。
*/
+ (NSString*)getSelectSQL:(TransactionCategoryQuery*)transactionCategory;

@end
