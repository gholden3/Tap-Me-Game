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

- (AVAudioPlayer*)setupAudioPlayerWithFile:(NSString*)file type:(NSString*)type
{
    NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSError *error;
    AVAudioPlayer *audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
    if(!audioPlayer){
        NSLog(@"%@",[error description]);
    }
    return audioPlayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_tile.png"]];
    scoreLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_score.png"]];
    timerLabel.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"field_time.png"]];
    buttonBeep = [self setupAudioPlayerWithFile:@"ButtonTap" type:@"wav"];
    secondBeep = [self setupAudioPlayerWithFile:@"SecondBeep" type:@"wav"];
    backgroundMusic = [self setupAudioPlayerWithFile:@"HallOfTheMountainKing" type:@"mp3"];
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
    [secondBeep play];
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
    [backgroundMusic setVolume:0.3];
    [backgroundMusic play];
}

- (IBAction)buttonPressed {
    count++;
    scoreLabel.text = [NSString stringWithFormat:@"Score\n%li", count];
    [buttonBeep play];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonINdex {
    [self setupGame];
}

@end
