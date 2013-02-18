//
//  ViewController.m
//  Rectangle
//
//  Created by Clarice on 19/01/13.
//  Copyright (c) 2013 Omkar Nisal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize showLabel;
@synthesize myText1;
@synthesize switcher;
@synthesize mySegmentedControl;
@synthesize myProgBar;
@synthesize mySlider;
@synthesize myWebView;
@synthesize myMapView;

@synthesize clockLabel;
@synthesize databaseDate;
- (IBAction)timer:(id)sender {
//    [self showClock];
    [self countDownFrom:0];
}

- (void)countDownFrom:(int)cnt
{
    maxCount = cnt;
    count = 6;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(doCount)
                                           userInfo:nil
                                            repeats:YES];
}

- (void)doCount
{
    count--;
    clockLabel.text = [NSString stringWithFormat:@"Count: %i", count];
    if (count <= maxCount)
    {
        [timer invalidate];
    
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Time Up-la re!" message:@"Time over!" delegate:nil cancelButtonTitle:@" Wah! " otherButtonTitles:nil, nil];
        [al show];
    }
}



- (void) showClock {
    NSTimeInterval remainingSec = [databaseDate timeIntervalSinceNow];

         if (!timer)
            {
        
        
                [timer invalidate];
                timer = nil;
                // getting time from database
                self.databaseDate = [NSDate dateWithTimeIntervalSinceNow:6.0];
                remainingSec = [databaseDate timeIntervalSinceNow];
                
               
                timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target: self
                                               selector:@selector(showClock)
                                               userInfo:nil
                                                repeats:NO];
                
            }
         else
            {
            if (remainingSec <= 0) {
                    [self endTimer];
                
               [timer invalidate];
                }
            }
    
    
    
    NSInteger hours = remainingSec / 3600;
    NSInteger remainder = ((NSInteger)remainingSec)% 3600;
    NSInteger minutes = remainder / 60;
    NSInteger seconds = remainder % 60;
    
    clockLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
}


-(void) endTimer
{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@" timer ended" message:@"thanks for using this timer!" delegate:nil cancelButtonTitle:@"Cool" otherButtonTitles:nil, nil];
    [al show];

}
- (IBAction)doSS:(id)sender {
   NSLog(@" %i",mySegmentedControl.selectedSegmentIndex);
    if(mySegmentedControl.selectedSegmentIndex==0) myText1.text = @" xero ";
    else if(mySegmentedControl.selectedSegmentIndex==1) myText1.text = @" vunn ";
    else myText1.text = @" tututu";
}

- (IBAction)sliderChanged:(id)sender {
   myProgBar.progressTintColor = [UIColor blackColor];
    double d = ((arc4random() % 10000001) * 0.0000001 );
    myProgBar.progress =  d;//mySlider.value; //
    int ff = mySlider.value * 100 ;
    NSString *sl = [[NSString alloc] initWithFormat:@"random=%f slider=%i ", d,ff]  ;
    myText1.text = sl;
}
- (IBAction)hideMap:(id)sender {
    
    if(myMapView.isHidden)
    {
        
        
        /*MKCoordinateRegion region;
        MKCoordinateSpan span;
        
        span.latitudeDelta=0.2;
        span.longitudeDelta=0.2;
        
        CLLocationCoordinate2D location;
        location.latitude = 39.144057;
        location.longitude = -84.505484;
        
        region.span=span;
        region.center=location;
        
        [myMapView setRegion:region animated:TRUE];
        [myMapView regionThatFits:region];
        */
        
        myMapView.mapType = MKMapTypeHybrid;
        MKCoordinateRegion newRegion;
        newRegion.center.latitude = 35.710838;
        newRegion.center.longitude = -105.908203;
        newRegion.span.latitudeDelta = 0.009217;
        newRegion.span.longitudeDelta = 0.019097;
        
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = 35.710838;
        coordinate.longitude = -105.908203;
        
        MKPointAnnotation *annotation =  [[MKPointAnnotation alloc]init];
        [annotation setCoordinate:coordinate];

        [annotation setSubtitle:@"Jai Gurudev!"];
        [annotation setTitle:@" Omkar Nisal"];
        //        [self.myMapView removeAnnotation:self.myMapView.annotations];
        
         myMapView.hidden = NO;
        
        [self.myMapView addAnnotation:annotation];
        [self.myMapView setRegion:newRegion];
       //http://www.highoncoding.com/Articles/804_Introduction_to_MapKit_Framework_for_iPhone_Development.aspx
        
        
    }
    else
    {
        myMapView.hidden =YES;
    }
}



- (IBAction)hideWebView:(id)sender {
    if(myWebView.isHidden)
    {
        
        NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"test.html"];
        NSURL *url = [NSURL fileURLWithPath:path isDirectory:NO];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        myWebView.backgroundColor = [UIColor blackColor];
        [myWebView loadRequest:req ];
        myWebView.hidden = NO;
        
        
        
    }
    else
    {
        myWebView.hidden =YES;
        
    }
}

- (IBAction)hideLabelSwitch:(id)sender {
    if(showLabel.isHidden)
    {
    showLabel.hidden = NO;
    }
    else
    {
    showLabel.hidden =YES;
    }
    NSLog(@" label hidden now = %c",showLabel.isHidden);
}

- (IBAction)showAppUsage:(id)sender {
    
      int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"runForTimes"];
    
    NSMutableString *t = [NSMutableString stringWithFormat:@"%@,app used %i times.",myText1.text,i];

    [myText1 resignFirstResponder];
    showLabel.text =   t;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    int i = [[NSUserDefaults standardUserDefaults] integerForKey:@"runForTimes"];
    
    if(i%10==0)
        {
        NSMutableString *t = [NSMutableString stringWithFormat:@"This app was used for %i  times.",i];
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:t message:@"Glad to know that you are enjoying it. Please do send us your feedback about what you liked and how we can make it better. Kindly do share it with your dear ones. " delegate:nil cancelButtonTitle:@"Nice!" otherButtonTitles:nil, nil];
    
        [al show];
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
