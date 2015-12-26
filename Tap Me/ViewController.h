//
//  ViewController.h
//  Tap Me
//
//  Created by Gina M Holden on 12/25/15.
//  Copyright (c) 2015 Gina Holden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate> {
    IBOutlet UILabel *scoreLabel;
    IBOutlet UILabel *timerLabel;
    
    NSInteger count; //number of taps
    NSInteger seconds; //seconds remaining
    NSTimer *timer;
}
- (IBAction)buttonPressed;
@end
