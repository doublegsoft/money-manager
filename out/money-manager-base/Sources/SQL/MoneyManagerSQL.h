/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#define _SQL_ERROR_SUCCESS                             0
#define _SQL_ERROR_PRIMARY_KEY_NOT_FOUND               401101
#define _SQL_ERROR_NO_COLUMN_UPDATE                    401102
#define _SQL_ERROR_NO_OBJECT_SPECIFIED                 402101

@interface MoneyManagerSQL : NSObject

+ (NSString*)escapeArray:(NSString*)str;

+ (NSString*)escapeInteger:(NSInteger)number;

+ (NSString*)escapeString:(NSString*)str andVar:(NSInteger)var;

+ (NSString*)escapeDate:(NSDate*)date;

+ (NSString*)escapeDecimal:(NSDecimalNumber*)number;

+ (NSString*)escapeBool:(BOOL)flag;

@end
