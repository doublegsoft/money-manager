/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Colors.h"

UIColor* colorWithHexString(NSString *hexString) {
  NSString* cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
  if ([cleanString length] != 6 && [cleanString length] != 8) {
    return nil;
  }

  NSRange range = NSMakeRange(0,2);
  NSString* redString = [cleanString substringWithRange:range];
  range = NSMakeRange(2, 2);
  NSString* greenString = [cleanString substringWithRange:range];
  range = NSMakeRange(4, 2);
  NSString* blueString = [cleanString substringWithRange:range];

  NSString* alphaString = nil;
  if ([cleanString length] == 8) {
    range = NSMakeRange(6, 2);
    alphaString = [cleanString substringWithRange:range];
  }
  unsigned int red, green, blue, alpha;
  [[NSScanner scannerWithString:redString] scanHexInt:&red];
  [[NSScanner scannerWithString:greenString] scanHexInt:&green];
  [[NSScanner scannerWithString:blueString] scanHexInt:&blue];

  if (alphaString) {
    [[NSScanner scannerWithString:alphaString] scanHexInt:&alpha];
  } else {
    alpha = 255;
  }


  return [UIColor colorWithRed:(float)red / 255.0f
                         green:(float)green / 255.0f
                          blue:(float)blue / 255.0f
                         alpha:(float)alpha / 255.0f];
}
