//
//  main.m
//  Rectangle
//
//  Created by Clarice on 19/01/13.
//  Copyright (c) 2013 Omkar Nisal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "Rectangle.h"

int main(int argc, char *argv[])
{
    
    Rectangle *rect = [[Rectangle alloc] init];
    
    [rect setHeight:2:5];
    [rect setWidth:4:6];
    [rect area];
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
    

}
