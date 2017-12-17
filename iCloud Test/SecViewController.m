//
//  SecViewController.m
//  iCloud Test
//
//  Created by jackie on 2017/12/15.
//  Copyright © 2017年 jackie. All rights reserved.
//

#import "SecViewController.h"
#import "iCloud.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadFileList:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loadFileList:(id)sender {
    NSMutableString * result = [[NSMutableString alloc] init];
    for (NSURL * obj in [[iCloud sharedCloud] listCloudFiles])
    {
        //        [result appendString:obj.path];
        //        [result appendString:@"\n\n"];
        
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        NSArray *array=[obj.path componentsSeparatedByString:@"/"];
        NSString *fileName = @"";
        if (array.count==0) {
            fileName = obj.path;
        }
        else {
            fileName = [array objectAtIndex:array.count-1];
        }
        
        NSDictionary *fileAttributes = [fileManager attributesOfItemAtPath:obj.path error:nil];
        //NSLog(@"fileAttributes=%@", fileAttributes);
        
        NSMutableDictionary *fileInfo = [NSMutableDictionary new];
        [fileInfo setObject:fileName forKey:@"fileName"];
        [fileInfo setObject:[fileAttributes objectForKey:@"NSFileModificationDate"] forKey:@"modificationDate"];
        //[fileInfo setObject:obj.path forKey:@"fileURL"];
        [result appendString:[fileInfo description]];
        [result appendString:@"\n\n"];
    }
    _textView.text = result;
}

@end
