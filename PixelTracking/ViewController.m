//
//  ViewController.m
//  PixelTracking
//
//  Created by Liem Vo  on 1/7/20.
//  Copyright © 2020 VNG. All rights reserved.
//

#import "ViewController.h"
#import <ZaloSDKCoreKit/ZaloSDKCoreKit.h>
#import <ZPTracker/ZPTracker.h>

@interface ViewController ()
@property (nonatomic, strong) ZPTracker *tracker;
@property (weak, nonatomic) IBOutlet UITextField *txtEventName;
@property (weak, nonatomic) IBOutlet UITextField *txtParam1;
@property (weak, nonatomic) IBOutlet UITextField *txtValue1;
@property (weak, nonatomic) IBOutlet UITextField *txtParam2;
@property (weak, nonatomic) IBOutlet UITextField *txtValue2;
@property (weak, nonatomic) IBOutlet UITextField *txtParam3;
@property (weak, nonatomic) IBOutlet UITextField *txtValue3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [ZDKLogManager setLogLevel:ZDKLogVerbose];
    self.tracker = [ZPTracker newInstanceWithPixelId:6486531153301779475L];
}

- (IBAction)didTouchSubmitButton:(id)sender {
    NSString *eventName = _txtEventName.text;
    if(eventName.length > 0) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        [self addParam:_txtParam1.text value:_txtValue1.text to:params];
        [self addParam:_txtParam2.text value:_txtValue2.text to:params];
        [self addParam:_txtParam3.text value:_txtValue3.text to:params];
        [self.tracker trackEventWithName:eventName params:params];
        
        [self clearInputs];
        [ZDKProgressHUD showSuccessWithStatus:@"Added event to queue!"];
    }
}

- (void) addParam:(NSString *) param value: (NSString *) value to: (NSMutableDictionary *) params {
    if(param.length > 0 && value.length > 0) {
        params[param] = value;
    }
}

- (void) clearInputs {
    _txtParam1.text = _txtValue1.text =
    _txtParam2.text = _txtValue2.text =
    _txtParam3.text = _txtValue3.text =
    _txtEventName.text =  @"";
}

@end
