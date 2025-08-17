/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "NavigationBar.h"

#import "DS/Styles.h"

@interface NavigationBar ()

@property (nonatomic, strong) UINavigationController* navigationController;

@property (nonatomic, strong) UILabel* titleLabel;

@end

@implementation NavigationBar

- (instancetype)initWithNavigationController:(UINavigationController*)controller {
  self = [super init];
  [self setup];
  self.navigationController = controller;
  return self;
}

- (void) setup {
  self.frame = CGRectMake(0, 0, screenWidth(), self.height);
  
  UIButton* back = [[UIButton alloc] init];
  back.frame = CGRectMake(padding() * 2, top() + padding(), 32, 32);
  [back setImage:[UIImage imageNamed:@"NavigateBack"] forState:UIControlStateNormal];
  [back addTarget:self action:@selector(doBack:) forControlEvents:UIControlEventTouchUpInside];
  [self addSubview:back];
  
  self.titleLabel = [[UILabel alloc] init];
  self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
  self.titleLabel.textColor = colorTextPrimary();
  [self addSubview:self.titleLabel];
}

- (NSInteger)height {
  return top() + 48;
}

- (void)setTitle:(NSString*)title {
  self.titleLabel.text = title;
  NSInteger width = title.length * 20;
  self.titleLabel.frame = CGRectMake(padding() * 2 + 32 + padding() * 3,
                          top() + padding() + 4, width, 22);
  [self setNeedsLayout];
}

- (void)doBack:(UIButton*)sender {
  [self.navigationController popViewControllerAnimated:YES];
}

@end
