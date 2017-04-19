//
//  CounterView.m
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "CounterView.h"
static int      NoOfGlasses = 8;
static CGFloat  π           = M_PI;


IB_DESIGNABLE
@implementation CounterView


- (instancetype) initWithCoder:(NSCoder *)aDecoder  {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.outlineColor = [UIColor blueColor];
        self.counterColor = [UIColor orangeColor];
        self.counter = 5;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius = MAX(self.bounds.size.width, self.bounds.size.height);
    CGFloat arcWidth = 76;
    CGFloat startAngle = 3 * π / 4;
    CGFloat endAngle = π / 4 ;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:(radius/2 - arcWidth/2) startAngle:startAngle endAngle:endAngle clockwise:true];
    path.lineWidth = arcWidth;
    [self.counterColor setStroke];
    [path stroke];
}
@end


