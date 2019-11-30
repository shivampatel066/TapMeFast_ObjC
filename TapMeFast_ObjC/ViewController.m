//
//  ViewController.m
//  TapMeFast_ObjC
//
//  Created by Shivam Patel on 30/11/19.
//  Copyright © 2019 Shivam Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timeLabel.text = [NSString stringWithFormat:@"%i",timerInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
    scoreInt = 0;
    timerInt = 10;
    gameMode = 0;
    
}

//If gameMode = 1 // Game is Running
//If gameMode = 0 // Game is Stopped
- (IBAction)startGame:(id)sender {
    
    if (timerInt == 10) {
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTimer) userInfo:nil repeats:true];
        
    }
    
    if (gameMode == 1) {
        scoreInt += 1;
        self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
    } else {
        timerInt = 10;
        scoreInt = 0;
        self.timeLabel.text = [NSString stringWithFormat:@"%i",timerInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"%i",scoreInt];
        
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    }
    
}

-(void)startTimer {
    
    timerInt -= 1;
    gameMode = 1;
    [self.startButton setTitle:@"Tap" forState:UIControlStateNormal];
    self.startButton.alpha = 1.0;
    self.startButton.enabled = YES;
    self.timeLabel.text = [NSString stringWithFormat:@"%i",timerInt];
    
    
    if (timerInt == 0) {
        [timer invalidate];
        
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        timer = [NSTimer scheduledTimerWithTimeInterval: 3.0 target:self selector:@selector(restart) userInfo:nil repeats:true];
        
    }
}

-(void)restart {
   
    [timer invalidate];
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    gameMode = 0;
}
@end
