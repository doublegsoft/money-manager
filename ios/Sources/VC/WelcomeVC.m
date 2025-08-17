/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "WelcomeVC.h"

#import "NavigationVC.h"
#import "DS/Styles.h"
#import "DS/RoundedButton.h"

@interface WelcomeVC ()

@end

@implementation WelcomeVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self renderIllustration];
  [self renderTitle];
  [self renderEntry];
  [self renderBackground];
}

- (void)renderBackground {
  CAGradientLayer* gradientLayer = [CAGradientLayer layer];
  UIColor* startColor = colorWithHexString(@"83E3EA");
  UIColor* endColor = colorWithHexString(@"00A8B2");
  gradientLayer.colors = @[(id)startColor.CGColor, (id)endColor.CGColor];
  gradientLayer.locations = @[@0.0, @1.0];
  gradientLayer.frame = self.view.bounds;
  gradientLayer.startPoint = CGPointMake(0.0, 0.0);
  gradientLayer.endPoint = CGPointMake(1.0, 1.0);
  [self.view.layer insertSublayer:gradientLayer atIndex:0];
}

- (void)renderIllustration {
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//  screenWidth *= [UIScreen mainScreen].scale;
  
  UIImageView* illustration = [[UIImageView alloc] init];
  UIImage* image = [UIImage imageNamed:@"Manager"];
  illustration.image = image;
  illustration.contentMode = UIViewContentModeScaleAspectFit;
  illustration.frame = CGRectMake(0, 120, screenWidth, screenWidth * 1588 / 1060);
  [self.view addSubview:illustration];
}

- (void)renderTitle {
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
//  screenWidth *= [UIScreen mainScreen].scale;
  
  const double width = 260;
  UILabel* title = [[UILabel alloc] init];
  title.text = @"Money Manager";
  title.textColor = UIColor.whiteColor;
  title.font = [UIFont systemFontOfSize:32 weight:400];
  title.frame = CGRectMake((screenWidth - width) / 2, 100, width, 42);
  [self.view addSubview:title];
}

- (void)renderEntry {
  CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
  CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
  
  CGRect rect = CGRectMake((screenWidth - 200) / 2, screenHeight - 120, 200, 50);
  RoundedButton* entry = [[RoundedButton alloc] initWithFrame:rect
                                                     andTitle:@"开始使用"];
  [entry setTitleColor:colorTextPrimary() forState:UIControlStateNormal];
  entry.backgroundColor = colorSurfacePrimary();
  [self.view addSubview:entry];
  [entry addTarget:self
            action:@selector(gotoMain:)
  forControlEvents:UIControlEventTouchUpInside];

}

- (void)gotoMain:(UIButton*)sender {
  UIWindow* window = [UIApplication sharedApplication].keyWindow;
  if (window){
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController* mainVC = [storyboard instantiateInitialViewController];
    UINavigationController* rootViewController = [[NavigationVC alloc] initWithRootViewController:mainVC];
    rootViewController.navigationBarHidden = YES;
    
    window.rootViewController = rootViewController;
  } else {
    NSLog(@"Window is not available");
  }
}
@end
