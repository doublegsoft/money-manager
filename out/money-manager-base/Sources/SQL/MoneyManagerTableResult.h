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
** 查询结果对象.
*/
@interface MoneyManagerTableResult : NSObject

/*!
**
*/
- (instancetype)initWithColumnCount:(NSInteger)columnCount;

/*!
**
*/
- (NSString*)getColumnTitleAtIndex:(NSInteger)index;

/*!
**
*/
- (void)setColumnTitle:(NSString*)title atIndex:(NSInteger)index;

/*!
**
*/
- (NSNumber*)getColumnTypeAtIndex:(NSInteger)index;

/*!
**
*/
- (void)setColumnType:(NSNumber*)type atIndex:(NSInteger)index;

/*!
**
*/
- (NSObject*)getValueAtRow:(NSInteger)row andColumn:(NSInteger)col;

/*!
**
*/
- (void)setValue:(NSObject*)value atRow:(NSInteger)row andColumn:(NSInteger)col;

/*!
**
*/
- (NSInteger)getCount;

@end
