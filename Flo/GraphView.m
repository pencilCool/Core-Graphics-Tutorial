//
//  GraphView.m
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "GraphView.h"

@interface GraphView()


@end


IB_DESIGNABLE
@implementation GraphView
{
  
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.graphPoints = @[@4, @2, @6, @4, @5, @8, @3].mutableCopy;
    }
    return self;
}
- (void)drawRect:(CGRect)rect {

    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(8, 8)];
    
    [path addClip];
    
    
    //2 - get the current context
    
    CGContextRef    context =  UIGraphicsGetCurrentContext();
    //NSArray *colors = @[self.startColor.CGColor, self.endColor.CGColor];
    CGColorSpaceRef colorSpace =   CGColorSpaceCreateDeviceRGB();
   // CGFloat colorLocations = { 0.0 , 1.0 };
    NSArray *colors = [NSArray arrayWithObjects:
                       (id)self.startColor.CGColor, (id)self.endColor.CGColor, nil];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)colors, nil);
    
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(0, self.bounds.size.height);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    

    
    CGFloat margin = 20.0f;
    
    CGFloat (^columnXPoint)(NSInteger) =
    ^CGFloat (NSInteger column){
        CGFloat spacer = (width - margin *2 - 4) / (CGFloat)(self.graphPoints.count - 1) ;
        CGFloat   x      = column *spacer;
        x               += margin + 2;
        return x;
    };
    
    CGFloat topBorder = 60;
    CGFloat bottomBorder = 50;
    CGFloat graphHeight = height - topBorder - bottomBorder;
    NSNumber * maxValue = [self.graphPoints valueForKeyPath:@"@max.intValue"];
    
    CGFloat (^columnYPoint)(NSInteger) =
    ^CGFloat (NSInteger graphPoint){
        
        CGFloat   y      = graphPoint / (CGFloat)[maxValue floatValue] * graphHeight;
        y  =     graphHeight + topBorder - y;
        return y;
    };
    
    [[UIColor whiteColor] setFill];
    [[UIColor whiteColor] setStroke];
    UIBezierPath *graphPath = [UIBezierPath bezierPath];
    [graphPath moveToPoint:CGPointMake(columnXPoint(0), columnYPoint([self.graphPoints[0] integerValue]))];
    
    for (NSInteger i = 0; i< self.graphPoints.count; i ++) {
        CGPoint nextPoint = CGPointMake(columnXPoint(i), columnYPoint([self.graphPoints[i] integerValue]));
        [graphPath addLineToPoint:nextPoint];
    }

    
    CGContextSaveGState(context);
 
    UIBezierPath *clippingPath = graphPath.copy;
    [clippingPath addLineToPoint:CGPointMake(columnXPoint(self.graphPoints.count -1), height)];
    [clippingPath addLineToPoint:CGPointMake(columnXPoint(0), height)];

    [clippingPath closePath];
    
    [clippingPath addClip];
    

    CGFloat highestYPoint = columnYPoint(maxValue.floatValue);
    startPoint = CGPointMake(margin, highestYPoint);
    endPoint   = CGPointMake(margin, self.bounds.size.height);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);

    graphPath.lineWidth = 2.0f;
    [graphPath stroke];
    
    
    //Draw the circles on top of graph stroke
    for(NSInteger  i = 0; i< self.graphPoints.count; i ++) {
        CGPoint point = CGPointMake(columnXPoint(i), columnYPoint([self.graphPoints[i] floatValue]));
        point.x -= 5.0/2;
        point.y -= 5.0/2;
        
        UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(point.x, point.y, 5.0, 5.0)];
        [circle fill];
    }
    
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    //top line
    [linePath moveToPoint:CGPointMake(margin,topBorder)];
    [linePath addLineToPoint: CGPointMake(width - margin,
                                          topBorder)];
    
    
    //center line
    [linePath moveToPoint:CGPointMake(margin,
                                      graphHeight/2 + topBorder)];
    [linePath addLineToPoint:CGPointMake(width - margin,
                                         graphHeight/2 + topBorder)];
    
    //bottom line
    [linePath moveToPoint:CGPointMake(margin,
                                      height - bottomBorder)];
    [linePath addLineToPoint:CGPointMake(width - margin,
                                         height - bottomBorder)];
    [[UIColor colorWithWhite:1.0 alpha:0.3] setStroke];
   
    linePath.lineWidth = 1.0;
    [linePath stroke];
    
    
    

}



@end
