/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Styles.h"

NSInteger screenWidth(void) {
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  return screenRect.size.width;
}

NSInteger screenHeight(void) {
  CGRect screenRect = [[UIScreen mainScreen] bounds];
  return screenRect.size.height;
}

NSInteger padding(void) {
  return 10;
}

NSInteger top(void) {
  UIWindow* window = UIApplication.sharedApplication.windows.firstObject;
  return window.safeAreaInsets.top;
}

NSInteger bottom(void) {
  UIWindow* window = UIApplication.sharedApplication.windows.firstObject;
  return window.safeAreaInsets.bottom;
}

UIColor* colorBackground(void) {
  return colorWithHexString(@"#04181f");
}

UIColor* colorBackdrop(void) {
  return colorWithHexString(@"#20294C");
}

UIColor* colorTextPrimary(void) {
  return colorWithHexString(@"#f3f3f3");
}

UIColor* colorTextSecondary(void) {
  return colorWithHexString(@"#E8EFF3");
}

UIColor* colorTextTertiary(void) {
  return colorWithHexString(@"#96A0B4");
}

UIColor* colorTextInfo(void) {
  return colorWithHexString(@"#7ABEFF");
}

UIColor* colorTextSuccess(void) {
  return colorWithHexString(@"#9CF7A7");
}

UIColor* colorTextWarning(void) {
  return colorWithHexString(@"#FFC97B");
}

UIColor* colorTextError(void) {
  return colorWithHexString(@"#F89B9B");
}

UIColor* colorBorderPrimary(void) {
  return colorWithHexString(@"#575758");
}

UIColor* colorBorderSecondary(void) {
  return colorWithHexString(@"#4C4C4C");
}

UIColor* colorBorderTertiary(void) {
  return colorWithHexString(@"#303030");
}

UIColor* colorDividerPrimary(void) {
  return colorWithHexString(@"#303030");
}

UIColor* colorDividerSecondary(void) {
  return colorWithHexString(@"#575758");
}

UIColor* colorDisabled(void) {
  return colorWithHexString(@"#445866");
}

UIColor* colorPrimary(void) {
  return colorWithHexString(@"#5C98F1");
}

UIColor* colorError(void) {
  return colorWithHexString(@"#F35959");
}

UIColor* colorWarning(void) {
  return colorWithHexString(@"#FAB246");
}

UIColor* colorSuccess(void) {
  return colorWithHexString(@"#5CF76E");
}


UIColor* colorInfo(void) {
  return colorWithHexString(@"#469AF9");
}

UIColor* colorFatal(void) {
  return colorWithHexString(@"#F2595E");
}

UIColor* colorCritical(void) {
  return colorWithHexString(@"#FF7B5C");
}

UIColor* colorMajor(void) {
  return colorWithHexString(@"#F6A144");
}

UIColor* colorHigh(void) {
  return colorWithHexString(@"#ECC000");
}

UIColor* colorModerate(void) {
  return colorWithHexString(@"#03C7DD");
}

UIColor* colorLow(void) {
  return colorWithHexString(@"#01CAA6");
}

UIColor* colorSurfacePrimary(void) {
  return colorWithHexString(@"#04181F");
}

UIColor* colorSurfaceSecondary(void) {
  return colorWithHexString(@"#0A1E2C");
}

UIColor* colorSurfaceTertiary(void) {
  return colorWithHexString(@"#032331");
}

UIColor* colorSurfaceError(void) {
  return colorWithHexString(@"#c30c0b");
}

UIColor* colorSurfaceWarning(void) {
  return colorWithHexString(@"#a3671c");
}

UIColor* colorSurfaceSuccess(void) {
  return colorWithHexString(@"#0CC221");
}

UIColor* colorSurfaceInfo(void) {
  return colorWithHexString(@"#0e53b3");
}

UIColor* colorGreyDarker(void) {
  return colorWithHexString(@"#676B89");
}

UIColor* colorGreyDark(void) {
  return colorWithHexString(@"#C7CBDB");
}

UIColor* colorGreyDefault(void) {
  return colorWithHexString(@"#DDDFE9");
}

UIColor* colorGreyLight(void) {
  return colorWithHexString(@"#DCE1E9");
}

UIColor* colorGreyLighter(void) {
  return colorWithHexString(@"#F0F1F4");
}
