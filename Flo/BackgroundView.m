//
//  BackgroundView.m
//  Flo
//
//  Created by tangyuhua on 2017/4/20.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "BackgroundView.h"
IB_DESIGNABLE
@implementation BackgroundView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.darkColor.CGColor);
    CGContextFillRect(context, rect);
    
    
    CGSize drawSize = CGSizeMake(self.patternSize, self.patternSize);
    
    //insert code here
    UIGraphicsBeginImageContextWithOptions(drawSize, true, 0.0);
    CGContextRef drawingContext = UIGraphicsGetCurrentContext();
    
    //set the fill color for the new context
    [self.darkColor setFill];
    CGContextFillRect(drawingContext,
                      CGRectMake(0, 0, drawSize.width, drawSize.height));
    
    
    UIBezierPath *trianglePath = [UIBezierPath bezierPath];
    //1
    [trianglePath moveToPoint:CGPointMake(drawSize.width/2,
                                          0)];
    //2
    [trianglePath addLineToPoint:CGPointMake(0,
                                             drawSize.height/2)];
    //3
    [trianglePath addLineToPoint:CGPointMake(drawSize.width,
                                             drawSize.height/2)];
    
    //4
    [trianglePath moveToPoint:CGPointMake( 0,
                                          drawSize.height/2)];
    //5
    [trianglePath addLineToPoint:CGPointMake(drawSize.width/2,
                                             drawSize.height)];
    //6
    [trianglePath addLineToPoint:CGPointMake(0,
                                         drawSize.height)];
    
    //7
    [trianglePath moveToPoint:CGPointMake(drawSize.width,
                                          drawSize.height/2)];
    //8
    [trianglePath addLineToPoint:CGPointMake(drawSize.width/2,
                                         drawSize.height)];
    //9
    [trianglePath addLineToPoint:CGPointMake(drawSize.width,
                                             drawSize.height)];
    
    [self.lightColor setFill];
    [trianglePath fill];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [[UIColor colorWithPatternImage:image] setFill];
    CGContextFillRect(context, rect);
    
    
    
    
}


@end
