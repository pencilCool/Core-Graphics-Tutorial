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
#import "Flo-Bridging-Header.h"
#import "Flo-Swift.h"


@interface ViewController ()
@property(nonatomic, weak) IBOutlet CounterView *CounterView;
@property(nonatomic, weak) IBOutlet UILabel     *counterLabel;

@property(nonatomic, weak) IBOutlet UIView      *containerView;
@property(nonatomic, weak) IBOutlet GraphView   *GraphView;

@property(nonatomic, assign) BOOL isGraphViewShowing;

@property(nonatomic, weak) IBOutlet UILabel *averageWaterDrunk;
@property(nonatomic, weak) IBOutlet UILabel *maxLabel;

@property(nonatomic, weak) IBOutlet MedalView *medalView;
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
    [self checkTotal];
    [self setupGraphDisplay];
}
- (IBAction)subtractionTap:(id)sender {
    self.CounterView.counter --;
    self.counterLabel.text = [@(self.CounterView.counter) stringValue];
    [self checkTotal];
    [self setupGraphDisplay];
}

- (IBAction)counterViewTap:(id)sender {
    if (self.isGraphViewShowing) {
        [UIView transitionFromView:self.GraphView toView:self.CounterView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft| UIViewAnimationOptionShowHideTransitionViews completion:nil];
    }else{
         [UIView transitionFromView:self.CounterView toView:self.GraphView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight| UIViewAnimationOptionShowHideTransitionViews completion:nil];
    }
    self.isGraphViewShowing = !self.isGraphViewShowing;
    [self setupGraphDisplay];
}

- (void)checkTotal{
    if (self.CounterView.counter >= 8) {
        [self.medalView showMedalWithShow:true];
    }else{
        [self.medalView showMedalWithShow:false];
    }
}

- (void)setupGraphDisplay {
    
    //Use 7 days for graph - can use any number,
    //but labels and sample data are set up for 7 days
    NSInteger noOfDays = 7;
    
    //1 - replace last day with today's actual data
    self.GraphView.graphPoints[self.GraphView.graphPoints.count-1] = @(self.CounterView.counter);
    
    //2 - indicate that the graph needs to be redrawn
    [self.GraphView setNeedsDisplay];
    
    self.maxLabel.text = [[self.GraphView.graphPoints valueForKeyPath:@"@max.intValue"] stringValue];
    
    //3 - calculate average from graphPoints
    NSNumber *average = [self.GraphView.graphPoints valueForKeyPath:@"@avg.self"];
    
    self.averageWaterDrunk.text = [average stringValue];
    //set up labels
    //day of week labels are set up in storyboard with tags
    //today is last day of the array need to go backwards
    
    //4 - get today's day number
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    
    NSCalendar *calender = [NSCalendar currentCalendar];
    NSDateComponents  *components = [calender components:NSCalendarUnitWeekday fromDate:[NSDate date]];
    NSInteger weekday =  [components weekday];
 
    
    NSArray *days = @[@"S", @"S", @"M", @"T", @"W", @"T", @"F"];
    
    //5 - set up the day name labels with correct day
    for(NSInteger i = days.count ; i >=1 ; i -- )
    {
        UILabel  *labelView = [self.GraphView viewWithTag:i];
        if(labelView)
        {
            if (weekday == 7)
            {
                weekday = 0;
            }
            labelView.text = days[weekday--];
            if (weekday < 0 ){
                weekday = days.count - 1;
            }
        }
    }
}




@end
