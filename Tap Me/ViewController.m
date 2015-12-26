//
//  ViewController.m
//  Tap Me
//
//  Created by Gina M Holden on 12/25/15.
//  Copyright (c) 2015 Gina Holden. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupGame];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (void)subtractTime{
    seconds--;
    timerLabel.text = [NSString stringWithFormat:@"Time: %li",seconds];
    if(seconds==0){
        [timer invalidate];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Time is up!"
                                                        message:[NSString stringWithFormat:@"You scored %li points", count]
                                                       delegate:self
                                              cancelButtonTitle:@"PlayAgain"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)setupGame {
    seconds=30;
    count=0;
    timerLabel.text = [NSString stringWithFormat:@"Time:%li",seconds];
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li", count];
    //NSTimer object. will send you a message every second.
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f
                                             target:self
                                           selector:@selector(subtractTime)
                                           userInfo:nil
                                            repeats:YES];
}

- (IBAction)buttonPressed {
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li", count];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonINdex {
    [self setupGame];
}

@end
