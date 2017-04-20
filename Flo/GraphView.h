//
//  GraphView.h
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView
@property (nonatomic, strong) IBInspectable UIColor *startColor;
@property (nonatomic, strong) IBInspectable UIColor *endColor;

@property (nonatomic, strong) NSMutableArray *graphPoints;
@end
