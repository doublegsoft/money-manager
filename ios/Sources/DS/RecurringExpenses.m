/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "RecurringExpenses.h"

#import "DS/Container.h"
#import "DS/Styles.h"

@implementation RecurringExpenses {
  
  NSInteger _offsetY;
  
  NSInteger _height;
  
}

- (instancetype)initAtY:(NSInteger)y {
  self = [super init];
  _offsetY = y;
  _height = 0;
  [self setup];
  return self;
}

- (NSInteger)height {
  return _height;
}

- (void)setup {
  NSInteger y = _offsetY;
  [self buildTile:@"ExpElectricity" andTitle:@"家庭电费" andDeadline:@"每月月初" andAmount:@"不定" atY:y];
  y += padding() + 64;
  _height += padding() + 64;
  [self buildTile:@"ExpWater" andTitle:@"家庭水费" andDeadline:@"每月月初" andAmount:@"不定" atY:y];
  y += padding() + 64;
  _height += padding() + 64;
  [self buildTile:@"ExpGas" andTitle:@"家庭天然气费" andDeadline:@"每月月初" andAmount:@"不定" atY:y];
  y += padding() + 64;
  _height += padding() + 64;
  [self buildTile:@"ExpCarParking" andTitle:@"家庭停车费" andDeadline:@"每月12日之前" andAmount:@"500元" atY:y];
  y += padding() + 64;
  _height += padding() + 64;
  [self buildTile:@"ExpCreditCard" andTitle:@"信用卡还款" andDeadline:@"每月8日之前" andAmount:@"不定" atY:y];
  y += padding() + 64;
  _height += padding() + 64;
}

- (void)empty {
  Container* container = [[Container alloc] init];
  NSInteger containerWidth = screenWidth() - padding() * 2;
  NSInteger containerHeight = 180;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), _offsetY,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  [container showEmptyState:@"notification" andTooltip:@"没有任何提醒"];
  [self addSubview:container];
  
  _height += containerHeight;
}

- (void)buildTile:(NSString*)imageName
            andTitle:(NSString*)title
         andDeadline:(NSString*)deadline
        andAmount:(NSString*)amount
              atY:(NSInteger)y{
  Container* container = [[Container alloc] init];
  NSInteger containerWidth = screenWidth() - padding() * 2;
  NSInteger containerHeight = 64;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), y,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  
  UIImageView* imageView = [[UIImageView alloc] init];
  imageView.frame = CGRectMake(padding(), padding() + 6, 36, 36);
  imageView.image = [UIImage imageNamed:imageName];
  [container addSubview:imageView];
  
  UILabel* titleLabel = [[UILabel alloc] init];
  titleLabel.frame = CGRectMake(padding() * 2 + 48, padding(), 200, 24);
  titleLabel.textColor = colorTextSecondary();
  titleLabel.font = [UIFont systemFontOfSize:15];
  titleLabel.text = title;
  [container addSubview:titleLabel];
  
  UILabel* deadlineLabel = [[UILabel alloc] init];
  deadlineLabel.frame = CGRectMake(padding() * 2 + 48, 32, 200, 24);
  deadlineLabel.textColor = colorTextTertiary();
  deadlineLabel.font = [UIFont systemFontOfSize:13];
  deadlineLabel.text = deadline;
  [container addSubview:deadlineLabel];
  
  UILabel* amountLabel = [[UILabel alloc] init];
  amountLabel.frame = CGRectMake(screenWidth() - padding() * 3 - 60, 20, 70, 24);
  amountLabel.textColor = colorTextError();
  amountLabel.font = [UIFont boldSystemFontOfSize:18];
  amountLabel.text = amount;
  [container addSubview:amountLabel];
  
  [self addSubview:container];
}

@end
