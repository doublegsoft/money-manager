/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "TransactionTile.h"

@interface FinancialTipView ()

@property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *arrowLabel;
@property (nonatomic, strong) UIView *separatorLine;

@end

@implementation FinancialTipView

- (instancetype)initWithFrame:(CGRect)frame tipText:(NSString *)tipText {
  self = [super initWithFrame:frame];
  if (self) {
    _tipText = tipText;
    _arrowColor = [UIColor colorWithRed:76/255.0 green:217/255.0 blue:100/255.0 alpha:1.0];
    [self setupViews];
  }
  return self;
}

- (void)setupViews {
  // Arrow label
  self.arrowLabel = [[UILabel alloc] init];
  self.arrowLabel.text = @"↑";
  self.arrowLabel.font = [UIFont systemFontOfSize:24];
  self.arrowLabel.textColor = self.arrowColor;
  [self addSubview:self.arrowLabel];
  
  // Separator line
  self.separatorLine = [[UIView alloc] init];
  self.separatorLine.backgroundColor = [UIColor lightGrayColor];
  [self addSubview:self.separatorLine];
  
  // Tip label
  self.tipLabel = [[UILabel alloc] init];
  self.tipLabel.text = self.tipText;
  self.tipLabel.textColor = [UIColor lightGrayColor];
  self.tipLabel.font = [UIFont systemFontOfSize:16];
  self.tipLabel.numberOfLines = 0;
  [self addSubview:self.tipLabel];
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  CGFloat padding = 16.0;
  CGFloat arrowWidth = 20.0;
  CGFloat separatorWidth = 1.0;
  
  // Layout arrow
  self.arrowLabel.frame = CGRectMake(padding,
                                    0,
                                    arrowWidth,
                                    self.bounds.size.height);
  
  // Layout separator
  self.separatorLine.frame = CGRectMake(CGRectGetMaxX(self.arrowLabel.frame) + padding,
                                       padding,
                                       separatorWidth,
                                       self.bounds.size.height - (padding * 2));
  
  // Layout tip text
  CGFloat tipLabelX = CGRectGetMaxX(self.separatorLine.frame) + padding;
  self.tipLabel.frame = CGRectMake(tipLabelX,
                                  0,
                                  self.bounds.size.width - tipLabelX - padding,
                                  self.bounds.size.height);
}

@end
