/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "ExpenseListVC.h"

#import "Util/Colors.h"
#import "DS/Styles.h"
#import "DS/Container.h"
#import "DS/NavigationBar.h"

@interface ExpenseListVC ()

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIView* contentView;

@property (nonatomic, strong) UIView *floatingView;

@end

@implementation ExpenseListVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NavigationBar* navbar = [[NavigationBar alloc] initWithNavigationController:self.navigationController];
  [self.view addSubview:navbar];
  navbar.title = @"支出明细";
  
  self.view.backgroundColor = colorBackground();
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  self.scrollView.backgroundColor = colorBackground();
  
  [self.view addSubview:self.scrollView];

  self.contentView = [[UIView alloc] init];
  [self.scrollView addSubview:self.contentView];
  self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  self.scrollView.showsVerticalScrollIndicator = YES;
  self.scrollView.showsHorizontalScrollIndicator = NO;
  self.scrollView.userInteractionEnabled = YES;
  
  NSInteger offsetY = padding();
  
  NSInteger containerWidth = screenWidth() - padding() * 2;
  NSInteger containerHeight = 180;
  
  Container* container = [[Container alloc] init];
  containerWidth = screenWidth() - padding() * 2;
  containerHeight = 300;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), offsetY,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  [container showEmptyState:@"expense" andTooltip:@"没有任何支出记录"];
  [self.contentView addSubview:container];

  self.contentView.frame = CGRectMake(0, 0, screenWidth(), offsetY);
  self.scrollView.frame = CGRectMake(0, navbar.height, screenWidth(),
                                     screenHeight() - navbar.height);
  self.scrollView.contentSize = CGSizeMake(0, offsetY);
}

#pragma mark - 重载父级方法，覆盖默认值

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

@end
