//
//  PushButtonView.m
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "PushButtonView.h"

@implementation PushButtonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    [[UIColor greenColor] setFill];
    [path fill];
    
}


@end
