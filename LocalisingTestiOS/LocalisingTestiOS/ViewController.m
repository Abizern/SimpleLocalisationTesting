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
@property (strong, nonatomic) CATextLayer *textLayer;
@property (assign, nonatomic) CGPoint initialImageLayerPosition;
@property (assign, nonatomic) CGPoint displayImageLayerPosition;
@property (assign, nonatomic) CGPoint initialLabelLayerPosition;
@property (assign, nonatomic) CGPoint displayLabelLayerPosition;

- (void)setupImageLayer;
- (void)setupTextLayer;
- (void)updateButtonText;

@end

@implementation ViewController
@synthesize label = _label;
@synthesize button = _button;
@synthesize imageShowing = _imageShowing;
@synthesize imageLayer = _imageLayer;
@synthesize textLayer = _textLayer;
@synthesize initialImageLayerPosition = _initialImageLayerPosition;
@synthesize displayImageLayerPosition = _displayImageLayerPosition;
@synthesize initialLabelLayerPosition = _initialLabelLayerPosition;
@synthesize displayLabelLayerPosition = _displayLabelLayerPosition;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageShowing = NO;

    self.initialLabelLayerPosition = CGPointMake(160.0f, -11.0f);
    self.displayLabelLayerPosition = CGPointMake(160.0f, 296.0f);

    self.initialImageLayerPosition = CGPointMake(160.0f, -120.0f);
    self.displayImageLayerPosition = CGPointMake(160.0f, 120.0f);

    [self updateButtonText];

    [self setupTextLayer]; // Do this first so the text is under the image.
    [self setupImageLayer];
}

- (void)viewDidUnload {
    self.label = nil;
    self.imageLayer = nil;
    self.textLayer = nil;

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

        self.textLayer.position = self.initialLabelLayerPosition;
        self.imageLayer.position = self.initialImageLayerPosition;

        [self updateButtonText];
    } else {
        self.imageShowing = YES;

        self.textLayer.position = self.displayLabelLayerPosition;
        self.imageLayer.position = self.displayImageLayerPosition;

        [self updateButtonText];
    }
}

#pragma mark -  private helper methods

- (void)setupImageLayer {
    CALayer *theLayer = [CALayer layer];

    theLayer.bounds = CGRectMake(0.0f, 0.0f, 320.0f, 240.0f);
    theLayer.position = self.initialImageLayerPosition;

    theLayer.contentsGravity = kCAGravityBottom;
    theLayer.contentsScale = [[UIScreen mainScreen] scale];
    NSString *imageFileName = NSLocalizedString(kImageFile, @"The name of the image file");
    theLayer.contents = (id)[UIImage imageNamed:imageFileName].CGImage;

    self.imageLayer = theLayer;
    [self.view.layer addSublayer:self.imageLayer];
}

- (void)setupTextLayer {
    CATextLayer *theLayer = [CATextLayer layer];

    theLayer.bounds = CGRectMake(0.0f, 0.0f, 280.0f, 22.0f);
    theLayer.contentsScale = [[UIScreen mainScreen] scale];

    theLayer.string = NSLocalizedString(kLabelText, @"Shut up and eat");
    theLayer.alignmentMode = kCAAlignmentCenter;

    theLayer.fontSize = 17.0f;
    theLayer.foregroundColor = [UIColor blackColor].CGColor;

    theLayer.position = self.initialLabelLayerPosition;
    self.textLayer = theLayer;

    [self.view.layer addSublayer:self.textLayer];

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
