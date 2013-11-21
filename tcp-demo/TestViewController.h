//
//  TestViewController.h
//  tcp-demo
//
//  Created by coolgo on 13-11-21.
//  Copyright (c) 2013年 coolgo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_hostName;

@property (weak, nonatomic) IBOutlet UITextField *txtPort;
- (IBAction)action_send:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lab_connectStatus;
- (IBAction)action_conntect:(id)sender;

@end
