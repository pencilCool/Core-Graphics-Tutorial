//
//  BackgroundView.h
//  Flo
//
//  Created by tangyuhua on 2017/4/20.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BackgroundView : UIView


@property (nonatomic, strong) IBInspectable UIColor *lightColor;
@property (nonatomic, strong) IBInspectable UIColor *darkColor;
@property (nonatomic, assign) IBInspectable CGFloat patternSize;
@end
