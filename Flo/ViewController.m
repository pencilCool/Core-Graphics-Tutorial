//
//  ViewController.m
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ViewController.h"
#import "CounterView.h"
#import "GraphView.h"
@interface ViewController ()
@property(nonatomic, weak) IBOutlet CounterView *CounterView;
@property(nonatomic, weak) IBOutlet UILabel     *counterLabel;

@property(nonatomic, weak) IBOutlet UIView      *containerView;
@property(nonatomic, weak) IBOutlet GraphView   *GraphView;

@property(nonatomic, assign) BOOL isGraphViewShowing;

@end

@implementation ViewController

- (instancetype) init {
    
    self = [super init];
    if (self) {
        _isGraphViewShowing = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButtonTap:(id)sender {
    self.CounterView.counter  ++;
    self.counterLabel.text = [@(self.CounterView.counter) stringValue];
    [self counterViewTap:nil];
}
- (IBAction)subtractionTap:(id)sender {
    self.CounterView.counter --;
    self.counterLabel.text = [@(self.CounterView.counter) stringValue];
    [self counterViewTap:nil];
}

- (IBAction)counterViewTap:(id)sender {
    if (self.isGraphViewShowing) {
        [UIView transitionFromView:self.GraphView toView:self.CounterView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft| UIViewAnimationOptionShowHideTransitionViews completion:nil];
    }else{
         [UIView transitionFromView:self.CounterView toView:self.GraphView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight| UIViewAnimationOptionShowHideTransitionViews completion:nil];
    }
    self.isGraphViewShowing = !self.isGraphViewShowing;
}



@end
