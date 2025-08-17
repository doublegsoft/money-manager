/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import <AudioToolbox/AudioToolbox.h>

#import "MoneyPad.h"
#import "DS/Styles.h"

@interface MoneyPad()

@property NSInteger offsetY;

@property (nonatomic) SystemSoundID soundID;

@property (atomic, strong) UILabel* number;

@end

@implementation MoneyPad

- (instancetype)initAtY:(NSInteger)y {
  self = [super init];
  self.userInteractionEnabled = YES;
  self.offsetY = y;
  [self setup];
  return self;
}

- (void)setup {
  NSInteger numberHeight = 48;
  _number = [[UILabel alloc] init];
  _number.frame = CGRectMake(padding() * 2, 0, screenWidth() - padding() * 4, numberHeight);
  _number.text = @"0";
  _number.font = [UIFont systemFontOfSize:numberHeight - 4];
  _number.textColor = colorTextPrimary();
  _number.textAlignment = NSTextAlignmentRight;
  [self addSubview:_number];
  
  NSInteger y = numberHeight;
  
  [self setupNumber:@"1" forIndex:0 atOffset:y];
  [self setupNumber:@"2" forIndex:1 atOffset:y];
  [self setupNumber:@"3" forIndex:2 atOffset:y];
  [self setupNumber:@"4" forIndex:3 atOffset:y];
  [self setupNumber:@"5" forIndex:4 atOffset:y];
  [self setupNumber:@"6" forIndex:5 atOffset:y];
  [self setupNumber:@"7" forIndex:6 atOffset:y];
  [self setupNumber:@"8" forIndex:7 atOffset:y];
  [self setupNumber:@"9" forIndex:8 atOffset:y];
  [self setupNumber:@"." forIndex:9 atOffset:y];
  [self setupNumber:@"0" forIndex:10 atOffset:y];
  [self setupNumber:@"x" forIndex:11 atOffset:y];
  
  NSInteger containerWidth = (screenWidth() - padding() * 4) / 3;
  NSInteger containerHeight = containerWidth * 72 / 170;
  self.frame = CGRectMake(0,
                          self.offsetY,
                          screenWidth(),
                          numberHeight + containerHeight * 4 + padding() * 3);
  
  NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"tap" ofType:@"mp3"];
  NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
  AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_soundID);
}

- (NSInteger)setupNumber:(NSString*)number forIndex:(NSInteger)index atOffset:(NSInteger)offset {
  NSInteger containerWidth = (screenWidth() - padding() * 4) / 3;
  NSInteger containerHeight = containerWidth * 72 / 170;
  
  NSInteger x = (index % 3) * (containerWidth + padding()) + padding();
  NSInteger y = offset + (index / 3) * (containerHeight + padding()) + padding();

  UIImageView* imageView = [[UIImageView alloc] init];
  imageView.userInteractionEnabled = YES;
  imageView.frame = CGRectMake(x, y, containerWidth, containerHeight);
  if ([@"." isEqualToString:number]) {
    imageView.image = [UIImage imageNamed:@"NumberDot"];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumberDot:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"x" isEqualToString:number]) {
    imageView.image = [UIImage imageNamed:@"NumberX"];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumberX:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else {
    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"Number%@", number]];
  }
  
  if ([@"1" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber1:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"2" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber2:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"3" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber3:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"4" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber4:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"5" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber5:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"6" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber6:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"7" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber7:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"8" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber8:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"9" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber9:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  } else if ([@"0" isEqualToString:number]) {
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doTapNumber0:)];
    tapGesture.cancelsTouchesInView = NO;
    [imageView addGestureRecognizer:tapGesture];
  }
  [self addSubview:imageView];
  return y;
}

#pragma mark - 点击数字

- (void)doTapNumber1:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"1"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber2:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"2"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber3:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"3"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber4:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"4"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber5:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"5"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber6:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"6"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber7:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"7"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber8:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"8"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber9:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"9"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumber0:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"0"];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumberDot:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"."];
  AudioServicesPlaySystemSound(_soundID);
}

- (void)doTapNumberX:(UITapGestureRecognizer*)sender {
  [self echoNumber:@"x"];
  AudioServicesPlaySystemSound(_soundID);
}

-(void)echoNumber:(NSString*)number {
  if ([number isEqualToString:@"x"]) {
    if ([_number.text isEqualToString:@"0"]) {
      return;
    }
    if (_number.text.length == 1) {
      _number.text = @"0";
      return;
    }
    _number.text = [_number.text substringWithRange:NSMakeRange(0, _number.text.length - 1)];
    return;
  }
  if ([number isEqualToString:@"."]) {
    if ([_number.text containsString:@"."]) {
      return;
    }
    
  }
  if ([_number.text isEqualToString:@"0"]) {
    if ([number isEqualToString:@"."]) {
      _number.text = [_number.text stringByAppendingString:number];
      return;
    }
    _number.text = number;
    return;
  }
  _number.text = [_number.text stringByAppendingString:number];
}

-(void)clear {
  _number.text = @"0";
}

-(void)dealloc {
  NSLog(@"MyView deallocated");
  AudioServicesDisposeSystemSoundID(_soundID);
}

@end
