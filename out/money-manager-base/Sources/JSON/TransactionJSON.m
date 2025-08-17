/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#import "TransactionJSON.h"
#import "AccountJSON.h"
#import "TransactionCategoryJSON.h"

/*!
** 【交易】对象.
*/
@implementation TransactionJSON

+ (NSString*)serializeWithObject:(Transaction*)obj ifError:(NSError**)error {
  NSDictionary* dictionary = [TransactionJSON serializeToDictionary:obj];
  NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:error];

  if (error != nil) {
    return nil;
  }
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary*)serializeToDictionary:(Transaction*)obj {
  return nil;
}

+ (Transaction*)deserializeWithJson:(NSString*)json ifError:(NSError**)error {
  NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:error];
  if (error != nil) {
    return nil;
  }
  return [TransactionJSON deserializeWithDictionary:dictionary];
}

+ (Transaction*)deserializeWithDictionary:(NSDictionary*)dict {
  Transaction* ret = [[Transaction alloc] init];
  return ret;
}

@end
