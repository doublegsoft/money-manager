/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "HomeVC.h"

#import "IncomeListVC.h"
#import "ExpenseListVC.h"
#import "Util/Colors.h"
#import "DS/Styles.h"
#import "DS/Container.h"
#import "DS/BarChart.h"
#import "DS/LineChart.h"
#import "DS/MoneyPad.h"
#import "DS/RecurringExpenses.h"
#import "DS/ExpenseEdit.h"

#import "DB/MoneyManagerSQLite.h"

@interface HomeVC ()

@property (nonatomic, strong) UIScrollView* scrollView;

@property (nonatomic, strong) UIView* contentView;

@property (nonatomic, strong) UIView* viewExpenseEdit;

@property (nonatomic, strong) MoneyPad* moneyPad;

@end

@implementation HomeVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = colorBackground();
  self.view.userInteractionEnabled = YES;
  
  self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
  self.scrollView.delegate = self;
  self.scrollView.backgroundColor = colorBackground();
  self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
  self.scrollView.showsVerticalScrollIndicator = YES;
  self.scrollView.showsHorizontalScrollIndicator = NO;
  [self.view addSubview:self.scrollView];
  
  self.contentView = [[UIView alloc] init];
  self.contentView.userInteractionEnabled = YES;
  [self.scrollView addSubview:self.contentView];
  
  NSInteger offsetY = padding();
  
  [self setupDaily:@"日常支出" andAmount:[NSNumber numberWithFloat:3.14f] atOffset:offsetY];
  offsetY = [self setupDaily:@"日常收入" andAmount:[NSNumber numberWithFloat:3.14f] atOffset:offsetY];
  
  offsetY += padding();
  
  UILabel* expenseTitle = [[UILabel alloc] init];
  expenseTitle.frame = CGRectMake(padding() * 1.5, offsetY, 100, 16);
  expenseTitle.text = @"近期支出";
  expenseTitle.textColor = colorTextPrimary();
  expenseTitle.font = [UIFont boldSystemFontOfSize:16];
  [self.contentView addSubview:expenseTitle];
  
  UILabel* expenseMore = [[UILabel alloc] init];
  expenseMore.userInteractionEnabled = true;
  expenseMore.frame = CGRectMake(screenWidth() - padding() * 1.5 - 56, offsetY + 2, 56, 16);
  expenseMore.text = @"支出明细";
  expenseMore.font = [UIFont systemFontOfSize:12];
  expenseMore.textColor = colorTextTertiary();
  [self.contentView addSubview:expenseMore];
  UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(gotoExpenseList:)];
  tapGesture.cancelsTouchesInView = NO;
  [expenseMore addGestureRecognizer:tapGesture];
  
  offsetY += 16 + padding();
  
  Container* container = [[Container alloc] init];
  NSInteger containerWidth = screenWidth() - padding() * 2;
  NSInteger containerHeight = 180;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), offsetY, containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
//  [container showEmptyState:@"expenditure" andTooltip:@"没有任何支出记录"];
  [self.contentView addSubview:container];
  
  BarChart* bar = [[BarChart alloc] init];
  bar.frame = CGRectMake(padding(),
                         padding(),
                         containerWidth - padding() * 2,
                         containerHeight - padding() * 2);
  bar.backgroundColor = colorSurfaceTertiary();
  [bar setValues:@[@100, @87, @30, @48, @96, @66]
          labels:@[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月"]
   selectedIndex:1];
  [container addSubview:bar];
  
  offsetY += containerHeight + padding();
  
  UILabel* incomeTitle = [[UILabel alloc] init];
  incomeTitle.frame = CGRectMake(padding() * 1.5, offsetY, 100, 16);
  incomeTitle.text = @"本年收入";
  incomeTitle.textColor = colorTextPrimary();
  incomeTitle.font = [UIFont boldSystemFontOfSize:16];
  [self.contentView addSubview:incomeTitle];
  
  UILabel* incomeMore = [[UILabel alloc] init];
  incomeMore.userInteractionEnabled = true;
  incomeMore.frame = CGRectMake(screenWidth() - padding() * 1.5 - 56, offsetY + 2, 56, 16);
  incomeMore.text = @"收入明细";
  incomeMore.font = [UIFont systemFontOfSize:12];
  incomeMore.textColor = colorTextTertiary();
  [self.contentView addSubview:incomeMore];
  tapGesture = [[UITapGestureRecognizer alloc]
                                        initWithTarget:self
                                        action:@selector(gotoIncomeList:)];
  tapGesture.cancelsTouchesInView = NO;
  [incomeMore addGestureRecognizer:tapGesture];
  
  offsetY += 16 + padding();
  
  container = [[Container alloc] init];
  containerWidth = screenWidth() - padding() * 2;
  containerHeight = 200;
  container.cornerRadius = padding();
  container.frame = CGRectMake(padding(), offsetY,
                               containerWidth, containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  
  LineChart* lineChart = [[LineChart alloc]
                          initWithFrame:CGRectMake(0, 0,
                                                   containerWidth,
                                                   containerHeight)];
  [container addSubview:lineChart];
  [self.contentView addSubview:container];
  
  offsetY += containerHeight + padding();
  
  UILabel* notifTitle = [[UILabel alloc] init];
  notifTitle.frame = CGRectMake(padding() * 1.5, offsetY, 100, 16);
  notifTitle.text = @"费用提醒";
  notifTitle.textColor = colorTextPrimary();
  notifTitle.font = [UIFont boldSystemFontOfSize:16];
  [self.contentView addSubview:notifTitle];
  
  offsetY += 16 + padding();
  
  RecurringExpenses* recurring = [[RecurringExpenses alloc] initAtY:offsetY];
  [self.contentView addSubview:recurring];
  
//  container = [[Container alloc] init];
//  containerWidth = screenWidth() - padding() * 2;
//  containerHeight = 300;
//  container.cornerRadius = padding();
//  container.frame = CGRectMake(padding(), offsetY,
//                               containerWidth, containerHeight);
//  container.backgroundColor = colorSurfaceTertiary();
//  [container showEmptyState:@"notification" andTooltip:@"没有任何提醒"];
//  [self.contentView addSubview:container];
  
  offsetY += recurring.height + padding() * 8;
  
  self.contentView.frame = CGRectMake(0, 0, screenWidth(), offsetY);
  self.scrollView.contentSize = CGSizeMake(0, offsetY);
  
  [self setupExpenseEdit];
}

/*!
** 构建顶端的日常支出和日常收入的可点击卡片
*/
- (NSInteger)setupDaily:(NSString*)title andAmount:(NSNumber*) amount atOffset:(NSInteger)offset {
  NSInteger containerWidth = (screenWidth() - padding() * 3) / 2;
  NSInteger containerHeight = 80;
  
  NSInteger x = padding();
  if (![title isEqualToString:@"日常支出"]) {
    x += containerWidth + padding();
  }
  NSInteger y = offset + padding();
  
  Container* container = [[Container alloc] init];
  container.cornerRadius = padding();
  container.frame = CGRectMake(x,
                               y,
                               containerWidth,
                               containerHeight);
  container.backgroundColor = colorSurfaceTertiary();
  container.userInteractionEnabled = YES;
  [self.contentView addSubview:container];
  
  int iconWidth = 48;
  UIImageView* iconView = [[UIImageView alloc] init];
  iconView.frame = CGRectMake(padding(), (containerHeight - iconWidth) / 2, iconWidth, iconWidth);
  
  if ([title isEqualToString:@"日常支出"]) {
    iconView.image = [UIImage imageNamed:@"DailyExpense"];
    
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doShowExpenseEdit:)];
    tapGesture.cancelsTouchesInView = NO;
    [container addGestureRecognizer:tapGesture];
  } else {
    iconView.image = [UIImage imageNamed:@"DailyIncome"];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]
                                          initWithTarget:self
                                          action:@selector(doShowIncomeEdit:)];
    tapGesture.cancelsTouchesInView = NO;
    [container addGestureRecognizer:tapGesture];
  }
  [container addSubview:iconView];
  
  UILabel* amountLabel = [[UILabel alloc] init];
  amountLabel.frame = CGRectMake(padding() + iconWidth + padding(),
                                 (containerHeight - iconWidth) / 2, 120, 24);
  if ([title isEqualToString:@"日常支出"]) {
    amountLabel.textColor = colorTextError();
  } else {
    amountLabel.textColor = colorTextSuccess();
  }
  amountLabel.text = [NSString stringWithFormat:@"%@", amount];
  amountLabel.font = [UIFont systemFontOfSize:24 weight:UIFontWeightSemibold];
  [container addSubview:amountLabel];
  
  UILabel* titleLabel = [[UILabel alloc] init];
  titleLabel.frame = CGRectMake(padding() + iconWidth + padding(),
                                (containerHeight - iconWidth) / 2, 120, 72);
  titleLabel.textColor = colorTextSecondary();
  titleLabel.text = title;
  titleLabel.font = [UIFont systemFontOfSize:12];
  [container addSubview:titleLabel];
  
  return y + containerHeight;
}

- (void)setupExpenseEdit {
  CGFloat bottomSheetHeight = screenHeight() * 0.88;

  self.viewExpenseEdit = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, bottomSheetHeight)];
  self.viewExpenseEdit.backgroundColor = colorBackdrop();
  self.viewExpenseEdit.layer.cornerRadius = 16.0;
  self.viewExpenseEdit.layer.shadowColor = [UIColor blackColor].CGColor;
  self.viewExpenseEdit.layer.shadowOpacity = 0.2;
  self.viewExpenseEdit.layer.shadowOffset = CGSizeMake(0, -2);
  self.viewExpenseEdit.layer.shadowRadius = 10;
  
  UIButton* dismiss = [[UIButton alloc] init];
  dismiss.frame = CGRectMake(padding() * 1.5, padding(), 32, 32);
  [dismiss setImage:[UIImage imageNamed:@"NavigateClose"] forState:UIControlStateNormal];
  [dismiss addTarget:self action:@selector(hideExpenseEdit) forControlEvents:UIControlEventTouchUpInside];
  [self.viewExpenseEdit addSubview:dismiss];
  
  UIButton* saveButton = [UIButton buttonWithType:UIButtonTypeSystem];
  saveButton.frame = CGRectMake(screenWidth() - 50 - padding() * 1.5, padding() + 2, 50, 24);
  saveButton.font = [UIFont boldSystemFontOfSize:18];
  [saveButton setTitleColor:colorPrimary() forState:UIControlStateNormal];
  [saveButton setTitle:@"保存" forState:UIControlStateNormal];
  [saveButton addTarget:self action:@selector(hideExpenseEdit) forControlEvents:UIControlEventTouchUpInside];
  [self.viewExpenseEdit addSubview:saveButton];
  
  /*!
  **
  */
  [self.view addSubview:self.viewExpenseEdit];
  
  int offsetY = 48;
//  _moneyPad = [[MoneyPad alloc] initAtY:offsetY];
//  [self.viewExpenseEdit addSubview:_moneyPad];
//  
//  offsetY += 240;
  
  ExpenseEdit* expenseEdit = [[ExpenseEdit alloc] initAtY:offsetY];
  [self.viewExpenseEdit addSubview:expenseEdit];
}

- (void)showExpenseEdit {
  [_moneyPad clear];
  [UIView animateWithDuration:0.3 animations:^{
    CGRect frame = self.viewExpenseEdit.frame;
    frame.origin.y = self.view.frame.size.height - frame.size.height;
    self.viewExpenseEdit.frame = frame;
  }];
}

- (void)hideExpenseEdit {
  [UIView animateWithDuration:0.3 animations:^{
    CGRect frame = self.viewExpenseEdit.frame;
    frame.origin.y = self.view.frame.size.height;
    self.viewExpenseEdit.frame = frame;
  }];
}

#pragma mark - 点击显示底部弹出的支出登记

- (void)doShowExpenseEdit:(UITapGestureRecognizer*)sender {
  [[MoneyManagerSQLite sharedInstance] installDatabase];
  [self showExpenseEdit];
}

- (void)doShowIncomeEdit:(UITapGestureRecognizer*)sender {
  [self showExpenseEdit];
}

#pragma mark - 点击明细

- (void)gotoExpenseList:(UITapGestureRecognizer*)sender {
  ExpenseListVC* vc = [[ExpenseListVC alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
}

- (void)gotoIncomeList:(UITapGestureRecognizer*)sender {
  IncomeListVC* vc = [[IncomeListVC alloc] init];
  [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

}

#pragma mark - 重载父级方法，覆盖默认值

- (UIStatusBarStyle)preferredStatusBarStyle {
  return UIStatusBarStyleLightContent;
}

@end
