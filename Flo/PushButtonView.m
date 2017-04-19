//
//  PushButtonView.m
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "PushButtonView.h"
IB_DESIGNABLE
@implementation PushButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.fillColor = [UIColor greenColor];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.fillColor = [UIColor greenColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [self.fillColor setFill];
    [path fill];
    CGFloat plusHeight = 3.0f;
    CGFloat plusWidth  = MIN(self.bounds.size.width, self.bounds.size.height) * 0.6;
    UIBezierPath *plusPath = [UIBezierPath bezierPath];
    plusPath.lineWidth = plusHeight;
    
    [plusPath moveToPoint:CGPointMake(self.bounds.size.width/2 - plusWidth/2, self.bounds.size.height/2)];
    [plusPath addLineToPoint:CGPointMake(self.bounds.size.width/2 + plusWidth/2, self.bounds.size.height/2)];
    
    if(self.isAddButton)
    {
        [plusPath moveToPoint:CGPointMake(self.bounds.size.width/2 , self.bounds.size.height/2 - plusWidth/2)];
        [plusPath addLineToPoint:CGPointMake(self.bounds.size.width/2 , self.bounds.size.height/2 + plusWidth/2)];
    }

    [[UIColor whiteColor] setStroke];
    [plusPath stroke];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
}

@end
