//
//  SceneView.m
//  WatchOut
//
//  Created by viking warlock on 5/28/15.
//  Copyright (c) 2015 VikingWarlock. All rights reserved.
//

#import "SceneView.h"
#import "Player.h"

@interface SceneView()
{
    BOOL needInit;
    NSTimer *baseTimer;
    
    float offset;
    float markLenth;
    
    Player *player;
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
    
    player=[[Player alloc]init];
    

    markLenth=self.frame.size.height/8.f;
    
    offset=0.f;
    
    baseTimer=[NSTimer scheduledTimerWithTimeInterval:1/30.f target:self selector:@selector(handleNextFrame) userInfo:nil repeats:YES];
}

-(void)handleNextFrame
{
    offset+=5.f;
    if (offset>markLenth) {
        offset=-markLenth;
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
//    }else
//    {
//        CGContextRestoreGState(ctx);
//    }

    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetLineWidth(ctx, 20.f);
    for (int i=-1; i<10; i++) {
        CGContextMoveToPoint(ctx, recto.origin.x+recto.size.width/3.f+2.5f, i*markLenth+offset);
        CGContextAddLineToPoint(ctx, recto.origin.x+recto.size.width/3.f+2.5f, i*markLenth+offset+markLenth*0.6f);

        CGContextMoveToPoint(ctx, recto.origin.x+recto.size.width/3.f*2-2.5f, i*markLenth+offset);
        CGContextAddLineToPoint(ctx, recto.origin.x+recto.size.width/3.f*2-2.5f, i*markLenth+offset+markLenth*0.6f);

    }
    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    
    
}

@end
