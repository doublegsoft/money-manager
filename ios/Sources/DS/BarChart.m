/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "BarChart.h"

#import "DS/Styles.h"

@implementation BarChart

- (void)setValues:(NSArray<NSNumber *> *)values
          labels:(NSArray<NSString *> *)labels
   selectedIndex:(NSInteger)selectedIndex {
  _values = values;
  _labels = labels;
  _selectedIndex = selectedIndex;
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();
  
  // Find max value for scaling
  CGFloat maxValue = [[_values valueForKeyPath:@"@max.floatValue"] floatValue];
  
  CGFloat totalWidth = rect.size.width;
  CGFloat barWidth = (totalWidth / _values.count) * 0.8;
  CGFloat spacing = (totalWidth - (barWidth * _values.count)) / (_values.count + 1);
  
  // Draw each bar
  for (NSInteger i = 0; i < _values.count; i++) {
    CGFloat value = [_values[i] floatValue];
    CGFloat normalizedHeight = (value / maxValue) * (rect.size.height - 40);
    
    CGFloat x = spacing + (spacing + barWidth) * i;
    CGFloat y = rect.size.height - normalizedHeight - 30;
    
    CGRect barRect = CGRectMake(x, y, barWidth, normalizedHeight);
    
    // Set bar color
    if (i == _selectedIndex) {
      [colorGreyDark() setFill];
    } else {
      [colorGreyDark() setFill];
    }
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:barRect
                                              byRoundingCorners:UIRectCornerAllCorners
                                                    cornerRadii:CGSizeMake(barWidth/2, barWidth/2)];
    [path fill];
    
    NSString* label = _labels[i];
    NSDictionary *attributes = @{
      NSFontAttributeName: [UIFont systemFontOfSize:12],
      NSForegroundColorAttributeName: colorGreyDark()
    };
    
    CGSize labelSize = [label sizeWithAttributes:attributes];
    CGPoint labelPoint = CGPointMake(x + (barWidth - labelSize.width)/2,
                                   rect.size.height - 20);
    
    [label drawAtPoint:labelPoint withAttributes:attributes];
  }
}

@end
