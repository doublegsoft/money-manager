/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "ExpenseEdit.h"

#import "MoneyPad.h"
#import "Styles.h"

@interface ExpenseEdit ()

@property (nonatomic, strong) MoneyPad* moneyPad;

@property (nonatomic, strong) UIImageView* check;

@end

@implementation ExpenseEdit {
  
  NSInteger _offsetY;
  
}

- (instancetype)initAtY:(NSInteger)y {
  self = [super init];
  _offsetY = y;
  _check = [[UIImageView alloc] init];
  _check.image = [UIImage imageNamed:@"BadgeCheck"];
  [self setup];
  return self;
}

- (void)setup {
  
  NSInteger offsetY = 0;
  _moneyPad = [[MoneyPad alloc] initAtY:offsetY];
  [self addSubview:_moneyPad];
  
  offsetY += 240;
  
  NSInteger iconSize = 48;
  NSInteger countInRow = 6;
  NSArray<NSString*>* icons = @[@"ExpChildGrowth", @"ExpLiving", @"ExpCreditCard", @"ExpCarParking",
                                @"ExpTelecom", @"ExpGas", @"ExpWater", @"ExpElectricity", @"ExpTransport",
                                @"ExpFood", @"ExpSeeDoctor", @"ExpOthers"];
  for (NSInteger i = 0; i < icons.count; i++) {
    NSString* iconPath = icons[i];
    if (i % countInRow == 0) {
      offsetY += iconSize + padding();
    }
    NSInteger index = i % countInRow;
    UIImageView* icon = [[UIImageView alloc] init];
    icon.userInteractionEnabled = YES;
    icon.frame = CGRectMake(padding() * (index + 1) + iconSize * index, offsetY, iconSize, iconSize);
    icon.image = [UIImage imageNamed:iconPath];
    
    UITapGestureRecognizer* gesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(doCheckCategory:)];
    [icon addGestureRecognizer:gesture];
    
    [self addSubview:icon];
  }
  
  offsetY += iconSize + padding() * 2;
  
  UITextView* note = [[UITextView alloc] initWithFrame:CGRectMake(padding(),
                                                                  offsetY,
                                                                  screenWidth() - padding() * 2,
                                                                  80)];
  note.delegate = self;
  note.backgroundColor = colorGreyDarker();
  note.font = [UIFont systemFontOfSize:16];
  note.text = @"输入备注内容";
  
  note.textColor = colorTextPrimary();
  note.keyboardType = UIKeyboardTypeDefault;
  note.autocorrectionType = UITextAutocorrectionTypeYes;
  note.spellCheckingType = UITextSpellCheckingTypeYes;
  note.layer.cornerRadius = 10;
  note.layer.masksToBounds = YES;
  
  [self addSubview:note];
  
  offsetY += 80;
  
  UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(doDismissKeyboard:)];
  [self addGestureRecognizer:tap];
  
  self.userInteractionEnabled = YES;
  self.frame = CGRectMake(0, _offsetY, screenWidth(), offsetY);
}

#pragma mark - 选中支出类别

- (void)doCheckCategory:(UITapGestureRecognizer*)sender {
  UIImageView* icon = (UIImageView*)sender.view;
  NSInteger x = icon.frame.origin.x;
  NSInteger y = icon.frame.origin.y;
  NSInteger w = icon.frame.size.width;
  NSInteger h = icon.frame.size.height;
  
  _check.frame = CGRectMake(x + w - 24, y + h - 24, 24, 24);
  [self addSubview:_check];
}

#pragma mark - 隐藏键盘

- (void)doDismissKeyboard:(UITapGestureRecognizer*)sender {
 [self endEditing:YES];
}

#pragma mark - UITextViewDelegate Methods

- (void)textViewDidBeginEditing:(UITextView *)textView {
  if ([textView.text isEqualToString:@"Type here..."]) {
    textView.text = @""; // Clear placeholder text when editing starts
    textView.textColor = [UIColor blackColor];
  }
}

- (void)textViewDidEndEditing:(UITextView *)textView {
  if (textView.text.length == 0) {
    textView.text = @"输入备注内容"; // Restore placeholder if empty
    textView.textColor = [UIColor lightGrayColor];
  }
}

- (void)textViewDidChange:(UITextView *)textView {
  // Respond to text changes
  NSLog(@"Text changed: %@", textView.text);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
  // Control what characters can be typed, return no to block
  return YES;
}


@end
