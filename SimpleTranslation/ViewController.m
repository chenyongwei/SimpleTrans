//
//  ViewController.m
//  SimpleTranslation
//
//  Created by Yongwei.Chen on 6/23/14.
//  Copyright (c) 2014 KW. All rights reserved.
//

#import "ViewController.h"
#import "SimpleTranslator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.lbTrans3.text = @"翻译3";
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[SimpleTranslator translator] transChildViews:self.view];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
