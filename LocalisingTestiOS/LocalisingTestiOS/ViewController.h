//
//  ViewController.h
//  LocalisingTestiOS
//
//  Created by Abizer Nasir on 17/03/2012.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)buttonClicked:(id)sender;

@end
