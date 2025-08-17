/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <Foundation/Foundation.h>

#import "LedgerEntryJSON.h"
#import "AccountJSON.h"
#import "TransactionJSON.h"

/*!
** 【记账登记】对象.
*/
@implementation LedgerEntryJSON

+ (NSString*)serializeWithObject:(LedgerEntry*)obj ifError:(NSError**)error {
  NSDictionary* dictionary = [LedgerEntryJSON serializeToDictionary:obj];
  NSData* jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:error];

  if (error != nil) {
    return nil;
  }
  return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

+ (NSDictionary*)serializeToDictionary:(LedgerEntry*)obj {
  return nil;
}

+ (LedgerEntry*)deserializeWithJson:(NSString*)json ifError:(NSError**)error {
  NSData* jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:error];
  if (error != nil) {
    return nil;
  }
  return [LedgerEntryJSON deserializeWithDictionary:dictionary];
}

+ (LedgerEntry*)deserializeWithDictionary:(NSDictionary*)dict {
  LedgerEntry* ret = [[LedgerEntry alloc] init];
  return ret;
}

@end
