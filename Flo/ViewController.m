//
//  ViewController.m
//  Flo
//
//  Created by tangyuhua on 2017/4/19.
//  Copyright © 2017年 tangyuhua. All rights reserved.
//

#import "ViewController.h"
#import "CounterView.h"

@interface ViewController ()
@property(nonatomic, weak) IBOutlet CounterView *CounterView;
@property(nonatomic, weak) IBOutlet UILabel     *counterLabel;



@end

@implementation ViewController

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
}
- (IBAction)subtractionTap:(id)sender {
    self.CounterView.counter --;
    self.counterLabel.text = [@(self.CounterView.counter) stringValue];
}



@end
