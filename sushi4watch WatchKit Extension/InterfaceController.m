//
//  InterfaceController.m
//  sushi4watch WatchKit Extension
//
//  Created by Amon on 2016/11/25.
//  Copyright © 2016年 Amon Keishima. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController()

@property (strong, nonatomic) IBOutlet WKInterfaceImage *sushiImage;
@property (strong, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;

@property (nonatomic) int num;

@end

@implementation InterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    
    WKCrownSequencer *sequencer = self.crownSequencer;
    [sequencer focus];
    sequencer.delegate = self;
    
    [_sushiImage setImageNamed:@"sushi_1"];
    [_messageLabel setText:@"寿司を廻せ！！！！"];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void) crownDidRotate:(WKCrownSequencer *)crownSequencer rotationalDelta:(double)rotationalDelta {
    
    if (rotationalDelta > 0) _num++;
    if (rotationalDelta < 0) _num--;
    if (_num == 45) _num = 1;
    if (_num == 0) _num = 44;
    
    NSString *name = [NSString stringWithFormat:@"sushi_%d", _num];
    [_sushiImage setImageNamed:name];
    [_messageLabel setText:@"おすしぐるぐる"];
}

- (void) crownDidBecomeIdle:(WKCrownSequencer *)crownSequencer {
    [_messageLabel setText:@"( `o´)ﾍｲﾗｯｼｬｲ"];
}
@end



