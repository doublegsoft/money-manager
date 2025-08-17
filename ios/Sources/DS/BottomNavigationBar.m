/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "BottomNavigationBar.h"
#import "DS/Styles.h"

#import "VC/HomeVC.h"
#import "VC/TransactionVC.h"
#import "VC/AnalysisVC.h"
#import "VC/SettingsVC.h"

@interface BottomNavigationBar ()

@property UIViewController* parent;

@property NSInteger selectedIndex;

@end

@implementation BottomNavigationBar

- (instancetype) initWithParent:(UIViewController*)parent
                        atIndex:(NSInteger)index {
  self = [super init];
  self.parent = parent;
  self.selectedIndex = index;
  [self setup];
  return self;
}

- (void)setup {
  self.backgroundColor = colorGreyDarker();
  self.layer.cornerRadius = 30;
  self.layer.masksToBounds = YES;
}

- (void)showFirstView {
  [self gotoHome:nil];
}

- (void)attachToView:(UIView*)view {
  int containerWidth = view.bounds.size.width;
  int containerHeight = view.bounds.size.height;
  NSInteger width = containerWidth - padding() * 2;
  int height = 60;
  
  self.frame = CGRectMake(padding(), containerHeight - height - padding() * 4, width, height);
  [view addSubview:self];
  
  UIView* itemView = [self createNavItem:@"NavHome" atIndex:0];
  [self addSubview:itemView];
  itemView = [self createNavItem:@"NavTransaction" atIndex:1];
  [self addSubview:itemView];
  itemView = [self createNavItem:@"NavAnalysis" atIndex:2];
  [self addSubview:itemView];
  itemView = [self createNavItem:@"NavSettings" atIndex:3];
  [self addSubview:itemView];
}

- (UIView*)createNavItem:(NSString*)image
                      atIndex:(int)index {
  int containerWidth = self.frame.size.width;
  int containerHeight = self.frame.size.height;
  int size = 36;
  int space = (containerWidth - size * 4) / 5;
  int offsetX = space + (size + space) * index;
  int y = (containerHeight - size) / 2;
  
  UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.frame = CGRectMake(offsetX, y, size, size);
  [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
  
  if (_selectedIndex == index) {
    button.frame = CGRectMake(offsetX - 12, y - 12, size + 24, size + 24);
    [button setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@Inverse", image]] forState:UIControlStateNormal];
  }
  
  if (index == 0) {
    [button addTarget:self
               action:@selector(gotoHome:)
     forControlEvents:UIControlEventTouchUpInside];
  } else if (index == 1) {
    [button addTarget:self
               action:@selector(gotoTransaction:)
     forControlEvents:UIControlEventTouchUpInside];
  } else if (index == 2) {
    [button addTarget:self
               action:@selector(gotoAnalysis:)
     forControlEvents:UIControlEventTouchUpInside];
  } else if (index == 3) {
    [button addTarget:self
               action:@selector(gotoSettings:)
     forControlEvents:UIControlEventTouchUpInside];
  }
  
  return button;
}

- (void)gotoHome:(UIButton*)sender {
  for (UIViewController* old in _parent.childViewControllers) {
    if ([old isKindOfClass:[HomeVC class]]) {
      [old willMoveToParentViewController:nil];
      [old.view removeFromSuperview];
      [old removeFromParentViewController];
    }
  }

  UIViewController* home = [[HomeVC alloc] init];
  [_parent addChildViewController:home];
  [_parent.view addSubview:home.view];
  
  BottomNavigationBar* navbar = [[BottomNavigationBar alloc] initWithParent:_parent
                                                                    atIndex:0];
  [navbar attachToView:_parent.view];
}

- (void)gotoTransaction:(UIButton *)sender {
  for (UIViewController* old in _parent.childViewControllers) {
    if ([old isKindOfClass:[TransactionVC class]]) {
//      [old willMoveToParentViewController:nil];
      [old.view removeFromSuperview];
      [old removeFromParentViewController];
    }
  }
  UIViewController* transaction = [[TransactionVC alloc] init];
  [_parent addChildViewController:transaction];
  [_parent.view addSubview:transaction.view];
  
  BottomNavigationBar* navbar = [[BottomNavigationBar alloc] initWithParent:_parent
                                                                    atIndex:1];
  [navbar attachToView:_parent.view];
}

- (void)gotoAnalysis:(UIButton *)sender {
  for (UIViewController* old in _parent.childViewControllers) {
    if ([old isKindOfClass:[AnalysisVC class]]) {
//      [old willMoveToParentViewController:nil];
      [old.view removeFromSuperview];
      [old removeFromParentViewController];
    }
  }
  UIViewController* analysis = [[AnalysisVC alloc] init];
  [_parent addChildViewController:analysis];
  [_parent.view addSubview:analysis.view];
//  [analysis didMoveToParentViewController:_parent];
  
  BottomNavigationBar* navbar = [[BottomNavigationBar alloc] initWithParent:_parent
                                                                    atIndex:2];
  [navbar attachToView:_parent.view];
}

- (void)gotoSettings:(UIButton *)sender {
  for (UIViewController* old in _parent.childViewControllers) {
    if ([old isKindOfClass:[SettingsVC class]]) {
//      [old willMoveToParentViewController:nil];
      [old.view removeFromSuperview];
      [old removeFromParentViewController];
    }
  }
  UIViewController* settings = [[SettingsVC alloc] init];
  [_parent addChildViewController:settings];
  [_parent.view addSubview:settings.view];
  
  BottomNavigationBar* navbar = [[BottomNavigationBar alloc] initWithParent:_parent
                                                                    atIndex:3];
  [navbar attachToView:_parent.view];
}

@end
