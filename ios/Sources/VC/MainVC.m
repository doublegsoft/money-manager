/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "MainVC.h"
#import "HomeVC.h"
#import "TransactionVC.h"

#import "Util/Colors.h"
#import "DS/Styles.h"
#import "DS/BottomNavigationBar.h"
#import "DS/Container.h"

@interface MainVC ()

@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UIView* contentView;
@property (nonatomic, strong) UIButton* floatingButton;

@property (nonatomic, strong) UIView *floatingView;

@end

@implementation MainVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = colorBackground();
  
  BottomNavigationBar* navbar = [[BottomNavigationBar alloc] initWithParent:self atIndex:0];
  [navbar showFirstView];
  [navbar attachToView:self.view];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent; 
}

@end
