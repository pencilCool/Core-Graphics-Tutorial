//
//  CounterView.h
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterView : UIView

@property (assign, nonatomic) IBInspectable NSInteger counter;
@property (strong, nonatomic) IBInspectable UIColor *outlineColor ;
@property (strong, nonatomic) IBInspectable UIColor *counterColor ;



@end
