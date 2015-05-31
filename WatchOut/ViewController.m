//
//  ViewController.m
//  WatchOut
//
//  Created by viking warlock on 5/27/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "ViewController.h"
#import "SceneView.h"
#import "ControlView.h"

@interface ViewController ()

@property(nonatomic,weak)IBOutlet SceneView *scene;
@property(nonatomic,weak)IBOutlet ControlView *control;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.scene setup];
    [self.control setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
