//
//  ViewController.h
//  Rectangle
//
//  Created by Clarice on 19/01/13.
//  Copyright (c) 2013 Omkar Nisal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController <MKMapViewDelegate>
{
    IBOutlet UILabel *clockLabel;
    NSDate *databaseDate;
    NSTimer *timer;
    int count;
    int maxCount;
}

- (void)countDownFrom:(int)cnt;
@property(nonatomic, retain) IBOutlet UILabel *clockLabel;
@property(nonatomic, retain) NSDate *databaseDate;

@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UISwitch *toggleMap;
@property (weak, nonatomic) IBOutlet UILabel *showLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mySegmentedControl;

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;


@property (weak, nonatomic) IBOutlet UITextField *myText1;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (weak, nonatomic) IBOutlet UISwitch *switcher;
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;
 
@property (weak, nonatomic) IBOutlet UIProgressView *myProgBar;



@end
