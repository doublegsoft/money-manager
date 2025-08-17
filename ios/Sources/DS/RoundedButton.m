/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "RoundedButton.h"

@interface RoundedButton()

@end

@implementation RoundedButton

- (instancetype)initWithFrame:(CGRect)frame
                     andTitle:(NSString*)title {
  self = [super init];
  [self setTitle:title forState:UIControlStateNormal];
  [self setFont: [UIFont systemFontOfSize:18]];
  self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, 50);
  [self render];
  return self;
}

- (void)render {
  CGRect buttonBounds = self.bounds;
  CGFloat cornerRadius = 50;

  UIBezierPath* roundedRectPath = [UIBezierPath bezierPathWithRoundedRect:buttonBounds
                                                             cornerRadius:cornerRadius];
  CAShapeLayer* maskLayer = [CAShapeLayer layer];
  maskLayer.path = roundedRectPath.CGPath;
  self.layer.mask = maskLayer;
  self.clipsToBounds = YES;
}

@end
