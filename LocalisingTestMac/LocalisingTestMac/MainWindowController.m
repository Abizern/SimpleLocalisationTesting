//
//  MainWindowController.m
//  LocalisingTestMac
//
//  Created by Abizer Nasir on 18/03/2012.
//

static NSString* const kWindowText = @"kWindowText";
static NSString* const kImageFile = @"kImageFile";
static NSString* const kLabelText = @"kLabelText";
static NSString* const kInitialButtonText = @"kInitialButtonText";
static NSString* const kAlternateButtonText = @"kAlternateButtonText";

#import "MainWindowController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainWindowController ()

@property (assign, nonatomic) BOOL imageShowing;
@property (strong, nonatomic) CALayer *imageLayer;
@property (strong, nonatomic) CATextLayer *textLayer;
@property (assign, nonatomic) CGPoint initialTextLayerPosition;
@property (assign, nonatomic) CGPoint displayTextLayerPosition;
@property (assign, nonatomic) CGPoint initialImageLayerPosition;
@property (assign, nonatomic) CGPoint displayImageLayerPosition;

- (void)setupTextLayer;
- (void)setupImageLayer;
- (void)updateButtonText;

@end

@implementation MainWindowController
@synthesize button = _button;
@synthesize imageShowing = _imageShowing;
@synthesize imageLayer = _imageLayer;
@synthesize textLayer = _textLayer;
@synthesize initialTextLayerPosition = _initialTextLayerPosition;
@synthesize displayTextLayerPosition = _displayTextLayerPosition;
@synthesize initialImageLayerPosition = _initialImageLayerPosition;
@synthesize displayImageLayerPosition = _displayImageLayerPosition;


- (void)windowDidLoad {
    [super windowDidLoad];

    [[self.window contentView] setWantsLayer:YES];

    self.imageShowing = NO;

    self.initialTextLayerPosition = CGPointMake(463.0f, 470.0f);
    self.displayTextLayerPosition = CGPointMake(160.0f, 168.0f);

    self.initialImageLayerPosition = CGPointMake(-160.0f, 580.0f);
    self.displayImageLayerPosition = CGPointMake(160.0f, 340.0f);

    [self setupTextLayer];
    [self setupImageLayer];
    [self updateButtonText];

}

#pragma mark - IBAction methods

- (IBAction)buttonClicked:(id)sender {
    if (self.imageShowing) {
        self.imageShowing = NO;
        self.textLayer.position = self.initialTextLayerPosition;
        self.imageLayer.position = self.initialImageLayerPosition;
    } else {
        self.imageShowing = YES;
        self.textLayer.position = self.displayTextLayerPosition;
        self.imageLayer.position = self.displayImageLayerPosition;
    }
    [self updateButtonText];
}

#pragma mark - Private helper methods

- (void)setupTextLayer {
    CATextLayer *theLayer = [CATextLayer layer];
    theLayer.font = (__bridge CFTypeRef)[NSFont systemFontOfSize:0.0f];
    theLayer.fontSize = 13.0f;

    theLayer.bounds = CGRectMake(0.0f, 0.0f, 286.0f, 20.0f);
    theLayer.alignmentMode = kCAAlignmentCenter;

    CGColorRef textColour = CGColorCreateGenericRGB(0.0f, 0.0f, 0.0f, 1.0f);
    theLayer.foregroundColor = textColour;
    CGColorRelease(textColour);


    theLayer.string = NSLocalizedString(kLabelText, nil);

    theLayer.position = self.initialTextLayerPosition;

    self.textLayer = theLayer;

    [[[[self window] contentView] layer] addSublayer:self.textLayer];
}

- (void)setupImageLayer {
    CALayer *theLayer = [CALayer layer];
    theLayer.bounds = CGRectMake(0.0f, 0.0f, 320.0f, 240.0f);
    theLayer.position = self.initialImageLayerPosition;

    NSString *imageFileName = NSLocalizedString(kImageFile, nil);
    theLayer.contents = [NSImage imageNamed:imageFileName];
    theLayer.contentsGravity = kCAGravityTop;


    self.imageLayer = theLayer;

    [[[self.window contentView] layer] addSublayer:self.imageLayer];

}

- (void)updateButtonText {
    if (self.imageShowing) {
        self.button.title = NSLocalizedString(kAlternateButtonText, nil);
    } else {
        self.button.title = NSLocalizedString(kInitialButtonText, nil);
    }
}

@end
