/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "TransactionVC.h"

#import "Util/Colors.h"
#import "DS/Styles.h"
#import "DS/Container.h"

@interface TransactionVC ()

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIView* contentView;

@property (nonatomic, strong) UIView *floatingView;

@end

@implementation TransactionVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = colorBackground();
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  // self.scrollView.delegate = self;
  self.scrollView.backgroundColor = colorBackground();
  
  [self.view addSubview:self.scrollView];

  self.contentView = [[UIView alloc] init];
  [self.scrollView addSubview:self.contentView];
  self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  self.scrollView.showsVerticalScrollIndicator = YES;
  self.scrollView.showsHorizontalScrollIndicator = NO;
  self.scrollView.userInteractionEnabled = YES;
  
  int offsetY = padding();
  
  int containerWidth = screenWidth() - padding() * 2;
  int containerHeight = 180;
  
  Container* container = [[Container alloc] init];
  container.cornerRadius = padding();
  
  containerWidth = screenWidth() - padding() * 2;
  containerHeight = 300;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), offsetY,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  
  [container showEmptyState:@"dashboard" andTooltip:@"没有任何收入记录"];
  [self.contentView addSubview:container];
  
  offsetY += containerHeight + padding();
  
  container = [[Container alloc] init];
  containerWidth = screenWidth() - padding() * 2;
  containerHeight = 300;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), offsetY,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  [container showEmptyState:@"notification" andTooltip:@"没有任何提醒"];
  [self.contentView addSubview:container];
  
  offsetY += containerHeight + padding();
  
  container = [[Container alloc] init];
  containerWidth = screenWidth() - padding() * 2;
  containerHeight = 300;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), offsetY,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  [container showEmptyState:@"notification" andTooltip:@"没有任何提醒"];
  [self.contentView addSubview:container];
  
  offsetY += containerHeight + padding() * 8;
  
  self.contentView.frame = CGRectMake(0, 0, screenWidth(), offsetY);
  self.scrollView.contentSize = CGSizeMake(0, offsetY);
}

#pragma mark - 重载父级方法，覆盖默认值

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

@end
