//
//  SceneView.m
//  WatchOut
//
//  Created by viking warlock on 5/28/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "SceneView.h"
#import "Player.h"
#import "Barrier.h"

@interface SceneView()
{
    BOOL needInit;
    NSTimer *baseTimer;
    float offset;
    float markLenth;
    Player *player;
    
    NSMutableArray *barrierList;

}

@end

@implementation SceneView

-(instancetype)init
{
    self=[super init];
    if (self) {
        needInit=YES;
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self=[super initWithCoder:aDecoder];
    if (self) {
        needInit=YES;

    }
    return self;

}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        needInit=YES;
    }
    return self;
}

-(void)setup
{
    self.backgroundColor=[UIColor greenColor];
    
    player=[Player sharedObject];
    

    markLenth=self.frame.size.height/8.f;
    barrierList=[NSMutableArray array];
    offset=0.f;
    
    baseTimer=[NSTimer scheduledTimerWithTimeInterval:1/30.f target:self selector:@selector(handleNextFrame) userInfo:nil repeats:YES];
}

-(void)handleNextFrame
{
    offset+=5.f;
    if (offset>markLenth) {
        offset=-markLenth;
    }
    
    if (arc4random() % 100<3)
    {
        Barrier *barrier=[[Barrier alloc]initWithRow:(arc4random() %3)];
        [barrierList addObject:barrier];
    }

    NSMutableArray *temp;
    for(Barrier *item in barrierList)
    {
        item.y_Offset+=5.f;
        if (item.y_Offset>self.frame.size.height+5) {
            if (temp==nil) {
                temp=[NSMutableArray array];
            }
            [temp addObject:item];
        }
    }
    if (temp) {
        for(Barrier *item in temp)
        {
            [barrierList removeObject:item];
        }
    }
    
    
    [self setNeedsDisplay];
}



-(void)drawRect:(CGRect)rect
{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    if (needInit) {
        CGContextSetFillColorWithColor(ctx, [UIColor colorWithRed:111.f/255.f green:111.f/255.f blue:111.f/255.f alpha:1.f].CGColor);
        CGRect recto=CGRectMake((self.frame.size.width-100*3)/2.f, 0, 300.f, self.frame.size.height);
        CGContextFillRect(ctx, recto);
        
        CGContextSetStrokeColorWithColor(ctx, [UIColor colorWithRed:50.f/255.f green:50.f/255.f blue:50.f/255.f alpha:1.f].CGColor);
        CGContextSetLineWidth(ctx, 5.f);
        
        CGContextMoveToPoint(ctx, recto.origin.x, 0);
        CGContextAddLineToPoint(ctx, recto.origin.x, recto.size.height);
        CGContextDrawPath(ctx, kCGPathStroke);
        
        
        CGContextMoveToPoint(ctx, recto.origin.x+recto.size.width, 0);
        CGContextAddLineToPoint(ctx, recto.origin.x+recto.size.width, recto.size.height);
        CGContextDrawPath(ctx, kCGPathStroke);
        
        
        needInit=NO;

    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 20.f);
    for (int i=-1; i<10; i++) {
        CGContextMoveToPoint(ctx, recto.origin.x+recto.size.width/3.f+2.5f, i*markLenth+offset);
        CGContextAddLineToPoint(ctx, recto.origin.x+recto.size.width/3.f+2.5f, i*markLenth+offset+markLenth*0.6f);

        CGContextMoveToPoint(ctx, recto.origin.x+recto.size.width/3.f*2-2.5f, i*markLenth+offset);
        CGContextAddLineToPoint(ctx, recto.origin.x+recto.size.width/3.f*2-2.5f, i*markLenth+offset+markLenth*0.6f);

    }
    CGContextDrawPath(ctx, kCGPathStroke);
    
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillRect(ctx, CGRectMake(recto.origin.x+player.row*recto.size.width/3.f+30.f, recto.size.height-80.f, recto.size.width/3.f-60.f, 60.f));
    
    
    CGContextSetFillColorWithColor(ctx, [UIColor brownColor].CGColor);

    for(Barrier *item in barrierList)
    {
        CGContextFillRect(ctx, CGRectMake(recto.origin.x+item.row*recto.size.width/3.f+30.f, item.y_Offset, recto.size.width/3.f-60.f, 60.f));
    }
    
}

@end
