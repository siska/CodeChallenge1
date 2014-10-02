//
//  ViewController.m
//  CodeChallenge1
//
//  Created by S on 10/2/14.
//  Copyright (c) 2014 Ryan Siska. All rights reserved.
//

#import "ViewController.h"
#import "WebViewController.h"

//didn't resign keyboard - ran out of time/didn't initially know how to do it
//didn't change back button title - time/didn't know exactly how to do it
//couldn't get prepareForSegue to work completely and it breaks the transition from ViewController to WebViewController - remove that section of code to check the following page - I think the issue was with the last line of code

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *valueOneText;
@property (weak, nonatomic) IBOutlet UITextField *valueTwoText;
@property (weak, nonatomic) IBOutlet UINavigationItem *navBarItems;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *webBarButton;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    self.valueOneText.keyboardType = UIKeyboardTypeNumberPad;
    self.valueTwoText.keyboardType = UIKeyboardTypeNumberPad;
    self.navBarItems.title = @"Answer";
    self.webBarButton.enabled = NO;
}

- (IBAction)onCalculateButtonPressed:(id)sender {

    int valueOneInt = self.valueOneText.text.intValue;
    int valueTwoInt = self.valueTwoText.text.intValue;
    int calculatedValue = (valueOneInt * valueTwoInt);

    self.navBarItems.title = [NSString stringWithFormat:@"%d", calculatedValue];

    if (calculatedValue % 5 == 0) {
        self.webBarButton.enabled = YES;
    } else {
        self.webBarButton.enabled = NO;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    WebViewController *webViewController = segue.destinationViewController;
    webViewController.nameForTitle = self.navBarItems.title;

}

@end
