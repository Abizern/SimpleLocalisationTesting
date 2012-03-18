//
//  ViewController.m
//  LocalisingTestiOS
//
//  Created by Abizer Nasir on 17/03/2012.
//

static NSString* const kImageFile = @"kImageFile";
static NSString* const kLabelText = @"kLabelText";
static NSString* const kInitialButtonText = @"kInitialButtonText";
static NSString* const kAlternateButtonText = @"kAlternateButtonText";

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@property (assign, nonatomic) BOOL imageShowing;
@property (strong, nonatomic) CALayer *imageLayer;
@property (assign, nonatomic) CGPoint initialImageLayerPosition;
@property (assign, nonatomic) CGPoint displayImageLayerPosition;

- (void)setupImageLayer;
- (void)updateLabelText;
- (void)updateButtonText;

@end

@implementation ViewController
@synthesize label = _label;
@synthesize button = _button;
@synthesize imageShowing = _imageShowing;
@synthesize imageLayer = _imageLayer;
@synthesize initialImageLayerPosition = _initialImageLayerPosition;
@synthesize displayImageLayerPosition = _displayImageLayerPosition;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageShowing = NO;

    self.initialImageLayerPosition = CGPointMake(160.0f, -120.0f);
    self.displayImageLayerPosition = CGPointMake(160.0f, 120.0f);

    [self updateLabelText];
    [self updateButtonText];

    [self setupImageLayer];
}

- (void)viewDidUnload {
    self.label = nil;
    self.imageLayer = nil;

    [self setButton:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return interfaceOrientation == UIInterfaceOrientationPortrait;
}

#pragma mark - IBActions

- (IBAction)buttonClicked:(id)sender {
    if (self.imageShowing) {
        self.imageShowing = NO;

        self.imageLayer.position = self.initialImageLayerPosition;

        [self updateLabelText];
        [self updateButtonText];
    } else {
        self.imageShowing = YES;

        self.imageLayer.position = self.displayImageLayerPosition;

        [self updateLabelText];
        [self updateButtonText];
    }
}

#pragma mark -  private helper methods

- (void)setupImageLayer {
    CALayer *theLayer = [CALayer layer];

    theLayer.bounds = CGRectMake(0.0f, 0.0f, 320.0f, 240.0f);
    theLayer.position = self.initialImageLayerPosition;

    theLayer.contentsGravity = kCAGravityCenter;
    theLayer.contentsScale = [[UIScreen mainScreen] scale];
    NSString *imageFileName = NSLocalizedString(kImageFile, @"The name of the image file");
    theLayer.contents = (id)[UIImage imageNamed:imageFileName].CGImage;

    self.imageLayer = theLayer;
    [self.view.layer addSublayer:self.imageLayer];
}

- (void)updateLabelText {
    NSString *text = nil;
    if (self.imageShowing) {
        text = NSLocalizedString(kLabelText, @"Shut up and eat");
    } else {
        text = @"";
    }
    self.label.text = text;
}

- (void)updateButtonText {
    NSString *text = nil;

    if (self.imageShowing) {
        text = NSLocalizedString(kAlternateButtonText, @"Alternate button text 'Ok'");
    } else {
        text = NSLocalizedString(kInitialButtonText, @"Initial button text 'What should I do'");
    }

    [self.button setTitle:text forState:UIControlStateNormal];
}

@end
