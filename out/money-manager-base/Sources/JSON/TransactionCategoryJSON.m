/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#import "TransactionCategoryJSON.h"

/*!
** 【交易类别】对象.
*/
@implementation TransactionCategoryJSON

+ (NSString*)serializeWithObject:(TransactionCategory*)obj ifError:(NSError**)error {
  NSDictionary* dictionary = [TransactionCategoryJSON serializeToDictionary:obj];
  NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:error];

  if (error != nil) {
    return nil;
  }
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary*)serializeToDictionary:(TransactionCategory*)obj {
  return nil;
}

+ (TransactionCategory*)deserializeWithJson:(NSString*)json ifError:(NSError**)error {
  NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:error];
  if (error != nil) {
    return nil;
  }
  return [TransactionCategoryJSON deserializeWithDictionary:dictionary];
}

+ (TransactionCategory*)deserializeWithDictionary:(NSDictionary*)dict {
  TransactionCategory* ret = [[TransactionCategory alloc] init];
  return ret;
}

@end
