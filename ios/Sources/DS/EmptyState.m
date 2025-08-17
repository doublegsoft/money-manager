/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "EmptyState.h"
#import "Styles.h"

@interface EmptyState()

@property NSString* type;

@property NSString* tooltip;

@end

@implementation EmptyState

- (instancetype)initWithType:(NSString*)type
                   andTooltip:(NSString*)tooltip
{
  self = [super init];
  self.type = type;
  self.tooltip = tooltip;
  [self render];
  return self;
}

- (void)render {
  int width = 100;
  int height = 100;
  
  self.frame = CGRectMake(0, 0, width, height + 20);
  UIImageView* imageView = [[UIImageView alloc] init];
  imageView.frame = CGRectMake(0, 0, width, height);
  if ([self.type isEqualToString:@"dashboard"]) {
    imageView.image = [UIImage imageNamed:@"EmptyDashboard"];
  } else if ([self.type isEqualToString:@"income"]) {
    imageView.image = [UIImage imageNamed:@"EmptyDashboard"];
  } else if ([self.type isEqualToString:@"expenditure"]) {
    imageView.image = [UIImage imageNamed:@"EmptyExpenditure"];
  } else if ([self.type isEqualToString:@"expense"]) {
    imageView.image = [UIImage imageNamed:@"EmptyExpenditure"];
  } else if ([self.type isEqualToString:@"member"]) {
    imageView.image = [UIImage imageNamed:@"EmptyMember"];
  } else if ([self.type isEqualToString:@"notification"]) {
    imageView.image = [UIImage imageNamed:@"EmptyNotification"];
  } else if ([self.type isEqualToString:@"card"]) {
    imageView.image = [UIImage imageNamed:@"EmptyCard"];
  } else if ([self.type isEqualToString:@"schedule"]) {
    imageView.image = [UIImage imageNamed:@"EmptySchedule"];
  }
  
  int offsetX = (int)((120 - _tooltip.length * 16) / 2);
  if (offsetX < 0) {
    offsetX = 0;
  }
  UILabel* label = [[UILabel alloc] init];
  label.font = [UIFont systemFontOfSize:12];
  label.frame = CGRectMake(offsetX, height, width, 20);
  label.text = self.tooltip;
  label.textColor = colorDisabled();
  
  [self addSubview:imageView];
  [self addSubview:label];
}

@end
