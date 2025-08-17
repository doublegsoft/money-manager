/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "Avatar.h"

#import "Styles.h"

@interface Avatar()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *initialsLabel;
@end

@implementation Avatar

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  self.userInteractionEnabled = YES;
  if (self) {
    [self setup];
  }
  return self;
}

- (void)setup {
  self.backgroundColor = [UIColor clearColor];

  _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
  _imageView.contentMode = UIViewContentModeScaleAspectFill;
  _imageView.clipsToBounds = YES;
  [self addSubview:_imageView];

  _initialsLabel = [[UILabel alloc] initWithFrame:self.bounds];
  _initialsLabel.textAlignment = NSTextAlignmentCenter;
  _initialsLabel.textColor = [UIColor whiteColor];
  _initialsLabel.font = [UIFont systemFontOfSize:self.bounds.size.width * 0.4];
  [self addSubview:_initialsLabel];
  self.rounded = YES;
  self.placeholderBackgroundColor = colorBackground();
  self.initialsColor = colorBackground();
  
  self.image = [UIImage imageNamed:@"Avatar"];
}

- (void)updateAvatar {
  if (self.image) {
    self.imageView.image = self.image;
    self.imageView.hidden = NO;
    self.initialsLabel.hidden = YES;
  } else if (self.initials && self.initials.length > 0) {
    self.imageView.hidden = YES;
    self.initialsLabel.hidden = NO;
    self.initialsLabel.text = [self extractInitials:self.initials];
    self.initialsLabel.textColor = self.initialsColor;
    self.initialsLabel.font = self.initialsFont ? self.initialsFont : [UIFont systemFontOfSize:self.bounds.size.width * 0.4];
    self.backgroundColor = colorBackground();

  } else {
    self.imageView.hidden = YES;
    self.initialsLabel.hidden = YES;
  }
  if (self.rounded) {
    self.layer.cornerRadius = self.bounds.size.width/2;
    self.layer.masksToBounds = YES;
  } else {
    self.layer.cornerRadius = 0;
    self.layer.masksToBounds = NO;
  }
  [self setNeedsLayout];
}

-(void) layoutSubviews{
  [super layoutSubviews];
  self.imageView.frame = self.bounds;
  self.initialsLabel.frame = self.bounds;
  if (self.rounded) {
    self.layer.cornerRadius = self.bounds.size.width/2;
    self.layer.masksToBounds = YES;
  } else {
    self.layer.cornerRadius = 0;
    self.layer.masksToBounds = NO;
  }
}

- (NSString *)extractInitials:(NSString *)name {
  NSMutableString *result = [NSMutableString string];
  NSArray *words = [name componentsSeparatedByString:@" "];
  for(NSString *word in words){
    if(word.length > 0){
      [result appendString:[[word substringToIndex:1] uppercaseString]];
    }
    if(result.length >= 2){
      break;
    }
  }
  return result;
}


- (void)setImage:(UIImage *)image {
  _image = image;
  [self updateAvatar];
}

- (void)setInitials:(NSString *)initials {
  _initials = initials;
  [self updateAvatar];
}

-(void)setInitialsColor:(UIColor *)initialsColor {
  _initialsColor = initialsColor;
  [self updateAvatar];
}

- (void)setInitialsFont:(UIFont *)initialsFont {
  _initialsFont = initialsFont;
  [self updateAvatar];
}

-(void)setPlaceholderBackgroundColor:(UIColor *)placeholderBackgroundColor{
  _placeholderBackgroundColor = placeholderBackgroundColor;
  [self updateAvatar];
}

- (void)setRounded:(BOOL)rounded {
  _rounded = rounded;
  [self updateAvatar];
}

@end
