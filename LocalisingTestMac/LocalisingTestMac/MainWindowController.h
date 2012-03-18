//
//  MainWindowController.h
//  LocalisingTestMac
//
//  Created by Abizer Nasir on 18/03/2012.
//  Copyright (c) 2012 Jungle Candy Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainWindowController : NSWindowController

@property (weak) IBOutlet NSButton *button;

- (IBAction)buttonClicked:(id)sender;

@end
