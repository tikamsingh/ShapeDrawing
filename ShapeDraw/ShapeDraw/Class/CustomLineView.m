//
//  CustomLineView.m
//  PhotoMixter
//
//  Created by DLRL on 19/03/16.
//  Copyright © 2016 Dexati. All rights reserved.
//

#import "CustomLineView.h"

// hold all the points.
NSMutableArray *pointDrawArray;



#define kTringle 5


@implementation CustomLineView

static CGPoint MyBeganpoint;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        pointDrawArray=[[NSMutableArray alloc] init];
        
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextBeginPath(context);

    switch (_changeShape) {
        case 1:
            if(pointDrawArray.count > 0)
            {
                CGPoint myStartPoint=CGPointFromString([pointDrawArray objectAtIndex:0]);
                
                //CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
                
                
                UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(myStartPoint.x, myStartPoint.y, 10, 10)];
                [UIColor.grayColor setFill];
                [rectanglePath fill];
                rectanglePath.lineWidth = 1;
                [UIColor.blackColor setStroke];
                [rectanglePath stroke];
                
                for (int j=0; j<[pointDrawArray count]-1; j++)
                {
                    
                    CGPoint myEndPoint=CGPointFromString([pointDrawArray objectAtIndex:j+1]);
                    //CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
                    
                    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(myEndPoint.x, myEndPoint.y, 10, 10)];
                    [UIColor.grayColor setFill];
                    [rectanglePath fill];
                    rectanglePath.lineWidth = 1;
                    [UIColor.blackColor setStroke];
                    [rectanglePath stroke];
                }
            }

            break;
        case 2:
                if(pointDrawArray.count > 0)
                {
                    CGPoint myStartPoint=CGPointFromString([pointDrawArray objectAtIndex:0]);
                    
                    //CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
                    
                    
                    UIBezierPath* trianglePath = [UIBezierPath bezierPath];
                    [trianglePath moveToPoint:CGPointMake(myStartPoint.x, myStartPoint.y)];
                    [trianglePath addLineToPoint:CGPointMake(myStartPoint.x-kTringle,myStartPoint.y+2*kTringle)];
                    [trianglePath addLineToPoint:CGPointMake(myStartPoint.x+kTringle, myStartPoint.y+2*kTringle)];
                    [trianglePath closePath];

                    trianglePath.lineWidth = 1;
                    [UIColor.blackColor setStroke];
                    [trianglePath stroke];
                    for (int j=0; j<[pointDrawArray count]-1; j++)
                    {
                        
                        CGPoint myEndPoint=CGPointFromString([pointDrawArray objectAtIndex:j+1]);
                        //CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
                        
                        
                        UIBezierPath* trianglePath = [UIBezierPath bezierPath];
                        [trianglePath moveToPoint:CGPointMake(myEndPoint.x, myEndPoint.y)];
                        [trianglePath addLineToPoint:CGPointMake(myEndPoint.x-kTringle,myEndPoint.y+2*kTringle)];
                        [trianglePath addLineToPoint:CGPointMake(myEndPoint.x+kTringle, myEndPoint.y+2*kTringle)];
                        [trianglePath closePath];
                        
                        trianglePath.lineWidth = 1;
                        [UIColor.blackColor setStroke];
                        [trianglePath stroke];
                    }
                }

            break;
            
            
        default:
            break;
            
    
        }
    
    CGContextSaveGState(context);
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch=[touches anyObject];
    MyBeganpoint=[touch locationInView:self];
    NSString *sPoint=NSStringFromCGPoint(MyBeganpoint);
    [pointDrawArray addObject:sPoint];
    [self setNeedsDisplay];
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
-(void)clearPath
{
    [pointDrawArray removeAllObjects];
}

// We need to hold the line info.

@end

