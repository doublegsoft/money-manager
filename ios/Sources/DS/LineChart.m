/*
** ┏┓┏┳━━┳━┓┏━━┳┓╋┏┳┓┏┳━━┳━┓┏━━┳━━┳━━┳━┓
** ┃┗┛┃┏┓┃┏┓┫┃━┫┃╋┃┃┗┛┃┏┓┃┏┓┫┏┓┃┏┓┃┃━┫┏┛
** ┃┃┃┃┗┛┃┃┃┃┃━┫┗━┛┃┃┃┃┏┓┃┃┃┃┏┓┃┗┛┃┃━┫┃
** ┗┻┻┻━━┻┛┗┻━━┻━┓┏┻┻┻┻┛┗┻┛┗┻┛┗┻━┓┣━━┻┛
** ╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃╋╋╋╋╋╋╋╋╋╋╋╋┏━┛┃
** ╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛╋╋╋╋╋╋╋╋╋╋╋╋┗━━┛
*/
#import "LineChart.h"

#import "DS/Styles.h"

@implementation LineChart

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.backgroundColor = colorSurfaceTertiary();
    self.lineColor = colorSuccess();
    self.lineWidth = 2.0;
    
    // Sample data points
    self.dataPoints = @[@70, @65, @68, @72, @75, @78, @82, @85, @80, @77, @75, @78];
  }
  return self;
}

- (void)updateGraph {
  [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {
  if (self.dataPoints.count == 0) return;

  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetLineWidth(context, self.lineWidth);
  CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);

  CGFloat margin = padding() * 2;
  CGFloat graphWidth = rect.size.width - (2 * margin);
  CGFloat graphHeight = rect.size.height - (2 * margin);

  CGFloat minValue = CGFLOAT_MAX;
  CGFloat maxValue = -CGFLOAT_MAX;

  for (NSNumber *point in self.dataPoints) {
    minValue = MIN(minValue, point.floatValue);
    maxValue = MAX(maxValue, point.floatValue);
  }

  CGFloat valueRange = maxValue - minValue;

  UIBezierPath* linePath = [UIBezierPath bezierPath];
  CGFloat previousY = 0;

  for (NSInteger i = 0; i < self.dataPoints.count; i++) {
    CGFloat xPosition = margin + (i * (graphWidth / (self.dataPoints.count - 1)));
    CGFloat yPosition = padding() + graphHeight -
                        (([self.dataPoints[i] floatValue] - minValue) / valueRange * graphHeight);

    if (i == 0) {
      [linePath moveToPoint:CGPointMake(xPosition, yPosition)];
    } else {
      [linePath addCurveToPoint:CGPointMake(xPosition, yPosition)
                  controlPoint1:CGPointMake(xPosition - (graphWidth / (self.dataPoints.count * 2)), previousY)
                  controlPoint2:CGPointMake(xPosition - (graphWidth / (self.dataPoints.count * 2)), yPosition)];
    }
     previousY = yPosition;
  }

  UIBezierPath *fillPath = [linePath copy];
  CGPoint lastPoint = [fillPath currentPoint];
  [fillPath addLineToPoint:CGPointMake(lastPoint.x, rect.size.height - padding())];
  [fillPath addLineToPoint:CGPointMake(padding(), rect.size.height - padding())];
  // close the path to make a filled region
  [fillPath closePath];

  // 3. Create a gradient layer
  CAGradientLayer *gradientLayer = [CAGradientLayer layer];
  gradientLayer.frame = rect;
  gradientLayer.colors = @[(id)colorSuccess().CGColor,
                           (id)colorWithHexString(@"#AAE4B1")];
  gradientLayer.startPoint = CGPointMake(0.5, 0);
  gradientLayer.endPoint = CGPointMake(0.5, 1.2);

  // 4. Use fill path as mask for the gradient
  CAShapeLayer *maskLayer = [CAShapeLayer layer];
  maskLayer.path = fillPath.CGPath;
  gradientLayer.mask = maskLayer;

  // 5. Add gradient to layer hierarchy
  [self.layer insertSublayer:gradientLayer atIndex:0];
    
  // 6. Draw the line on top of the gradient
  CGContextAddPath(context, linePath.CGPath);
  CGContextStrokePath(context);


  // Draw x-axis labels (months)
  NSArray* months = @[@"1月", @"2月", @"3月", @"4月", @"5月", @"6月",
                      @"7月", @"8月", @"9月", @"10月", @"11月", @"12月"];

  NSDictionary *attributes = @{
    NSFontAttributeName: [UIFont systemFontOfSize:10],
    NSForegroundColorAttributeName: colorGreyDark()
  };

  for (NSInteger i = 0; i < months.count; i++) {
    CGFloat xPosition = margin + (i * (graphWidth / (months.count - 1)));
    NSString *month = months[i];
    CGSize textSize = [month sizeWithAttributes:attributes];

    [month drawAtPoint:CGPointMake(xPosition - (textSize.width / 2),
                                   rect.size.height - padding() * 2)
        withAttributes:attributes];
  }
}

@end
