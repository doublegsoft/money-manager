/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Container.h"
#import "EmptyState.h"

@implementation Container

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    [self setupLayer];
  }
  return self;
}

- (void)showEmptyState:(NSString*)type
            andTooltip:(NSString *)tooltip{
  EmptyState* empty = [[EmptyState alloc] initWithType:type
                                            andTooltip:tooltip];
  int width = empty.frame.size.width;
  int height = empty.frame.size.height;
  int x = (self.bounds.size.width - width) / 2;
  int y = (self.bounds.size.height - height) / 2;
  while (self.subviews.count > 0) {
    [self.subviews[0] removeFromSuperview];
  }
  empty.frame = CGRectMake(x, y, width, height);
  [self addSubview:empty];
}

- (void)showUnderConstruction {
  int width = 237 / 2;
  int height = 233 / 2;
  int x = (self.bounds.size.width - width) / 2;
  int y = (self.bounds.size.height - height) / 2;
  UIImageView* imageView = [[UIImageView alloc] init];
  imageView.frame = CGRectMake(x, y, width, height);
  imageView.image = [UIImage imageNamed:@"UnderConstruction"];
  [self addSubview:imageView];
}

- (void)setupLayer {
  _cornerRadius = 15;
  [self updateLayer];
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
  _cornerRadius = cornerRadius;
  [self updateLayer];
}

- (void)updateLayer {
  self.layer.cornerRadius = _cornerRadius;
  self.layer.masksToBounds = YES;
}
@end
