//
//  Player.m
//  WatchOut
//
//  Created by viking warlock on 5/28/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.row=1;
    }
    return self;
}


+(Player *)sharedObject
{
    static dispatch_once_t once;
    static id shared;
    dispatch_once(&once, ^{
        if (shared==nil) {
            shared=[[Player alloc]init];
        }
    });
    return shared;
}

-(void)right
{
    self.row++;
    if (self.row>2) {
        self.row=2;
    }
}

-(void)left
{
    self.row--;
    if (self.row<0) {
        self.row=0;
    }
}



@end
