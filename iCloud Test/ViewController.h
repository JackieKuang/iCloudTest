//
//  ViewController.h
//  iCloud Test
//
//  Created by jackie on 2017/12/14.
//  Copyright © 2017年 jackie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *createTextField;
@property (weak, nonatomic) IBOutlet UITextField *deleteTextField;
- (IBAction)createAction:(id)sender;
- (IBAction)deleteAction:(id)sender;
- (IBAction)loadFileList:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *c1TextField;
- (IBAction)copyToLacal:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *c2TextField;
- (IBAction)copyToiCloud:(id)sender;



@end

