//
//  Rectangle.m
//  Rectangle
//
//  Created by Clarice on 19/01/13.
//  Copyright (c) 2013 Omkar Nisal. All rights reserved.
//

#import "Rectangle.h"

@implementation Rectangle

-(void)area {
    area = height * width;
    area2 = height2 * width2;
    NSMutableString *a,*b;
    a = [NSMutableString stringWithFormat: @" YO Height is %i the width is %i and Area is %i",height,width,area];
    b = [NSMutableString stringWithFormat: @" The Height2 is "];
    //[a appendFormat:@"%i the width is %i and Area is %i",height,width,area];
    [b appendFormat:@"%i the width2 is %i and Area2 is %i",height2,width2,area2];
    
    NSArray *s = [NSArray arrayWithObjects: @" THis is ", @" cool", @" this is third ",nil];
 
    NSLog(@" %@ | %@ ",a,b);
    
    NSLog(@ " ^ %@  ^ ",[s objectAtIndex:2]);
    
    
    NSMutableArray *ma = [NSMutableArray arrayWithCapacity:5];
    
    for (int i=0,j=0;i<10;i+=2,j++)
    {
        [ma addObject:[NSNumber numberWithInteger:i]];
        NSLog(@ " Count is %i  at %i with value %i ",[ma count],j,i);
        
    }
    
    NSLog(@" number at 7 is %@ ",[ma objectAtIndex:3] );
    
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    
    [md setObject:@"sdlfkjsdfsjkfksjdfsdjkfhjksdfs" forKey:@"onn"];
    NSLog(@"%@",[md objectForKey:@"onn" ]);
    
}

-(void)setHeight:(int)h : (int)h2 {
    height = h;    height2 = h2;
}

-(void)setWidth:(int)w : (int) w2 {
    width = w;    width2 = w2;
}

@end
