//
//  Barrier.m
//  WatchOut
//
//  Created by VKWK on 5/31/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "Barrier.h"


@interface Barrier()
{
    int private_row;
}
@end

@implementation Barrier

-(id)initWithRow:(int)row
{
    self=[super init];
    if (self) {
        private_row=row;
        self.y_Offset=-10.f;
    }
    return self;

}


-(int)row
{
    return private_row;
}




@end
