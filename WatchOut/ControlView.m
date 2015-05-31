//
//  ControlView.m
//  WatchOut
//
//  Created by viking warlock on 5/28/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "ControlView.h"
#import "Player.h"

@implementation ControlView

-(void)setup
{
    rightControl=[[UIControl alloc]initWithFrame:CGRectMake(self.frame.size.width/2.f, 0, self.frame.size.width/2.f, self.frame.size.height)];
    [self addSubview:rightControl];
    [rightControl addTarget:self action:@selector(right) forControlEvents:UIControlEventTouchUpInside];
    
    leftControl=[[UIControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width/2.f, self.frame.size.height)];
    [self addSubview:leftControl];
    [leftControl addTarget:self action:@selector(left) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

-(void)right
{
    [[Player sharedObject]right];
}

-(void)left
{
    [[Player sharedObject]left];
}



@end
