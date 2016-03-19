//
//  ViewController.m
//  PhotoMixter
//
//  Created by DLRL on 18/03/16.
//  Copyright © 2016 Dexati. All rights reserved.
//

#import "MainScreenController.h"
#import "CustomLineView.h"

@interface MainScreenController ()
{
IBOutlet CustomLineView *line;
}
@end

@implementation MainScreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width,
                               [UIScreen mainScreen].bounds.size.height);
    line = [[CustomLineView alloc] initWithFrame:frame];
    [line setChangeShape:2];

    [line setBackgroundColor:[UIColor greenColor]];
    [self.view addSubview:line];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)tringleClick:(id)sender
{
    [line setChangeShape:2];
    [line clearPath];
    
    [line setNeedsDisplay];
}


-(IBAction)rectClick:(id)sender
{
    [line setChangeShape:1];
    [line clearPath];
    [line setNeedsDisplay];
}
@end
