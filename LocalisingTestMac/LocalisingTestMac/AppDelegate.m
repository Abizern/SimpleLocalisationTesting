//
//  AppDelegate.m
//  LocalisingTestMac
//
//  Created by Abizer Nasir on 18/03/2012.
//

#import "AppDelegate.h"
#import "MainWindowController.h"

@interface AppDelegate ()

@property (strong, nonatomic) MainWindowController *mainWindowController;

@end

@implementation AppDelegate
@synthesize mainWindowController = _mainWindowController;

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    self.mainWindowController = [[MainWindowController alloc] initWithWindowNibName:@"MainWindowController"];
    [self.mainWindowController showWindow:self];
}

@end
