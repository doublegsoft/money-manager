/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#import "AccountJSON.h"

/*!
** 【账户】对象.
*/
@implementation AccountJSON

+ (NSString*)serializeWithObject:(Account*)obj ifError:(NSError**)error {
  NSDictionary* dictionary = [AccountJSON serializeToDictionary:obj];
  NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:error];

  if (error != nil) {
    return nil;
  }
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary*)serializeToDictionary:(Account*)obj {
  return nil;
}

+ (Account*)deserializeWithJson:(NSString*)json ifError:(NSError**)error {
  NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:error];
  if (error != nil) {
    return nil;
  }
  return [AccountJSON deserializeWithDictionary:dictionary];
}

+ (Account*)deserializeWithDictionary:(NSDictionary*)dict {
  Account* ret = [[Account alloc] init];
  return ret;
}

@end
