/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Images.h"

NSString* imageToBase64(UIImage* image) {
  if (!image) {
    return nil; // Handle the case of nil image
  }

  NSData* imageData = UIImageJPEGRepresentation(image, 0.8);

  if (!imageData) {
    return nil;
  }

  NSString *base64String = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
  if (!base64String) {
    return nil; 
  }

  return base64String;
}

UIImage* base64ToImage(NSString* base64) {
  if (!base64) {
    return nil; // Handle the case of nil string
  }
  NSData *imageData = [[NSData alloc] initWithBase64EncodedString:base64 options:NSDataBase64DecodingIgnoreUnknownCharacters];

  if (!imageData) {
    return nil;
  }
  UIImage *image = [UIImage imageWithData:imageData];
  return image;
}
