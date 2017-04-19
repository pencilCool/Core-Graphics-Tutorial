//
//  PushButtonView.h
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushButtonView : UIButton
@property (nonatomic, strong) IBInspectable UIColor *fillColor;
@property (nonatomic, assign) IBInspectable BOOL    isAddButton;
@end
