/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "SettingsVC.h"

#import "Util/Colors.h"
#import "Util/Images.h"
#import "DS/Styles.h"
#import "DS/Container.h"
#import "DS/Avatar.h"

@interface SettingsVC ()

@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) UIView* contentView;

@property (nonatomic, strong) Avatar* avatar;

@end

@implementation SettingsVC

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = colorBackground();
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
  self.scrollView.backgroundColor = colorBackground();
  
  [self.view addSubview:self.scrollView];
  
  self.contentView = [[UIView alloc] init];
  self.contentView.userInteractionEnabled = YES;
  [self.scrollView addSubview:self.contentView];
  self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  self.scrollView.showsVerticalScrollIndicator = YES;
  self.scrollView.showsHorizontalScrollIndicator = NO;
  self.scrollView.userInteractionEnabled = YES;
  
  NSInteger offsetY = padding() * 6;
  
  int avatarWidth = 108;
  self.avatar = [[Avatar alloc] initWithFrame:CGRectMake((screenWidth() - avatarWidth) / 2,
                                                            offsetY, avatarWidth, avatarWidth)];
  NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
  [self.contentView addSubview:self.avatar];
  
  NSString* avatarBase64 = [defaults stringForKey:@"avatar"];
  if (avatarBase64 != nil) {
    self.avatar.image = base64ToImage(avatarBase64);
  }
  
  UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(doPickImage:)];
  tapGesture.cancelsTouchesInView = NO;
  [self.avatar addGestureRecognizer:tapGesture];
  
  offsetY += avatarWidth + padding();
  
  [self setupStatCard:@"ChartBar" atOffset:offsetY forIndex: 0];
  [self setupStatCard:@"ChartDonut" atOffset:offsetY forIndex: 1];
  [self setupStatCard:@"ChartPolar" atOffset:offsetY forIndex: 2];
  offsetY = [self setupStatCard:@"ChartBubble" atOffset:offsetY forIndex: 3];
  
  offsetY += padding();
  
  self.contentView.frame = CGRectMake(0, 0, screenWidth(), offsetY);
}

- (void)setupProfileSection {
  // Profile Image
  UIImageView* profileImageView = [[UIImageView alloc] init];
  profileImageView.translatesAutoresizingMaskIntoConstraints = NO;
  profileImageView.layer.cornerRadius = 40;
  profileImageView.clipsToBounds = YES;
  profileImageView.contentMode = UIViewContentModeScaleAspectFill;
  profileImageView.image = [UIImage imageNamed:@"profile"];
  [self.contentView addSubview:profileImageView];
  
  // Name Label
  UILabel* nameLabel = [[UILabel alloc] init];
  nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
  nameLabel.text = @"Arya Muller";
  nameLabel.font = [UIFont boldSystemFontOfSize:20];
  nameLabel.textAlignment = NSTextAlignmentCenter;
  [self.contentView addSubview:nameLabel];
  
  // Layout constraints
  [NSLayoutConstraint activateConstraints:@[
    [profileImageView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    [profileImageView.topAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.topAnchor constant:20],
    [profileImageView.widthAnchor constraintEqualToConstant:80],
    [profileImageView.heightAnchor constraintEqualToConstant:80],
    
    [nameLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
    [nameLabel.topAnchor constraintEqualToAnchor:profileImageView.bottomAnchor constant:12]
  ]];
}

- (NSInteger)setupStatCard:(NSString*)type atOffset:(NSInteger)offset forIndex:(NSInteger)index {
  NSInteger containerWidth = (screenWidth() - padding() * 5) / 2;
  NSInteger containerHeight = 80;
  
  NSInteger x = (index % 2) * (containerWidth + padding()) + padding() * 2;
  NSInteger y = offset + (index / 2) * (containerHeight + padding()) + padding();
  
  Container* container = [[Container alloc] init];
  container.cornerRadius = padding();
  container.frame = CGRectMake(x,
                               y,
                               containerWidth,
                               containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  [self.contentView addSubview:container];
  
  NSInteger iconWidth = 48;
  UIImageView* icon = [[UIImageView alloc] init];
  icon.frame = CGRectMake(padding(), (containerHeight - iconWidth) / 2, iconWidth, iconWidth);
  icon.image = [UIImage imageNamed:type];
  [container addSubview:icon];
  
  UILabel* title = [[UILabel alloc] init];
  title.frame = CGRectMake(padding() + iconWidth + padding(),
                           (containerHeight - iconWidth) / 2, 120, 24);
  if (index == 0) {
    title.textColor = colorTextInfo();
    title.text = @"餐饮";
  } else if (index == 1) {
    title.textColor = colorTextError();
    title.text = @"零食";
  } else if (index == 2) {
    title.textColor = colorTextSuccess();
    title.text = @"交通";
  } else if (index == 3) {
    title.textColor = colorTextWarning();
    title.text = @"其他";
  }
  title.font = [UIFont systemFontOfSize:15];
  [container addSubview:title];
  return y + containerHeight;
}

#pragma mark - 选择图片来源

- (void)doPickImage:(UIGestureRecognizer*)gesture {
  [self pickImage];
}

- (void)pickImage {
  UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"请选择图片来源"
                                                                           message:nil
                                                                    preferredStyle:UIAlertControllerStyleActionSheet];

  // Add actions
  UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"相机"
                                                    style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
    [self presentImagePicker:UIImagePickerControllerSourceTypeCamera];
  }];

  UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"相册"
                                                   style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction *action) {
    [self presentImagePicker:UIImagePickerControllerSourceTypePhotoLibrary];
  }];

  UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                         style:UIAlertActionStyleCancel
                                                       handler:^(UIAlertAction *action) {
    
  }];

  [alertController addAction:action1];
  [alertController addAction:action2];
  [alertController addAction:cancelAction];

  [self presentViewController:alertController animated:YES completion:nil];
}

- (void)presentImagePicker:(UIImagePickerControllerSourceType)sourceType {
  if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
    UIImagePickerController* imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = sourceType;
    [self presentViewController:imagePicker animated:YES completion:nil];
  }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info {
  [picker dismissViewControllerAnimated:YES completion:nil];

  UIImage* selectedImage = nil;

  // Try to get the edited image (if editing was allowed)
  selectedImage = info[UIImagePickerControllerEditedImage];

  // If there is no edited image, try to get the original image
  if (!selectedImage) {
    selectedImage = info[UIImagePickerControllerOriginalImage];
  }

  if (selectedImage) {
    TOCropViewController* cropController = [[TOCropViewController alloc] initWithCroppingStyle:TOCropViewCroppingStyleCircular
                                                                                         image:selectedImage];
    cropController.delegate = self;

    [picker dismissViewControllerAnimated:YES completion:^{
      [self presentViewController:cropController animated:YES completion:nil];
    }];
  }
}

#pragma mark - TOCropViewControllerDelegate

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
//    self.croppedFrame = cropRect;
//    self.angle = angle;
    [self updateImageViewWithImage:image fromCropViewController:cropViewController];
}

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToCircularImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
//    self.croppedFrame = cropRect;
//    self.angle = angle;
    [self updateImageViewWithImage:image fromCropViewController:cropViewController];
}

- (void)updateImageViewWithImage:(UIImage*)image fromCropViewController:(TOCropViewController *)cropViewController
{
  [cropViewController dismissAnimatedFromParentViewController:self
                                             withCroppedImage:image
                                                       toView:self.avatar
                                                      toFrame:CGRectZero
                                                        setup:^{ }
                                                   completion:^{
    // 图片转化整字符串
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:imageToBase64(image) forKey:@"avatar"];
    [defaults synchronize];
    self.avatar.image = image;
  }];
}

#pragma mark - 重载父级方法，覆盖默认值

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}



@end
