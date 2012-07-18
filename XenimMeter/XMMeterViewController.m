//
//  XMMeterViewController.m
//  XenimMeter
//
//  Created by Max Winde on 18.07.12.
//  Copyright (c) 2012 343max. All rights reserved.
//

#import "MeterView.h"

#import "XMMeterViewController.h"

@interface XMMeterViewController ()

- (void)updateListenerCount;

@property (strong) NSTimer *updateTimer;
@property (weak) MeterView *meterView;

@end

@implementation XMMeterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    MeterView *meterView = [[MeterView alloc] initWithFrame:CGRectInset(self.view.bounds, 20, 20)];
    [self.view addSubview:meterView];
    
    meterView.textLabel.text = @"Listeners";
    meterView.maxNumber = 1000.0;
    meterView.value = 0;
    
    for (NSInteger i = 1; i <= 4; i++) {
        double delayInSeconds = i / 3.0;;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            if (i == 4) {
                meterView.value = 0;
                [self updateListenerCount];
                self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:15.0
                                                                    target:self
                                                                  selector:@selector(updateListenerCount)
                                                                  userInfo:nil
                                                                   repeats:YES];
                
            } else {
                meterView.value = i * 200;
            }
        });
    }
    
    self.meterView = meterView;
}

- (void)updateListenerCount;
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://backend.streams.xenim.de/api/storage/mm"]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
                               
                               if (httpResponse.statusCode == 200) {
                                   NSString *body = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];                                   
                                   self.meterView.value = [body intValue];
                               }
                           }];
}

- (void)viewDidLayoutSubviews;
{
    [super viewDidLayoutSubviews];
    
    self.meterView.frame = CGRectInset(self.view.bounds, 20, 20);
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
