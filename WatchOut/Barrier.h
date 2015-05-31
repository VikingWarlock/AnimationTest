//
//  Barrier.h
//  WatchOut
//
//  Created by VKWK on 5/31/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Barrier : NSObject

@property(nonatomic,assign)float y_Offset;
@property(nonatomic,readonly)int row;

-(id)initWithRow:(int)row;



@end
