//
//  ViewController.m
//  iCloud Test
//
//  Created by jackie on 2017/12/14.
//  Copyright © 2017年 jackie. All rights reserved.
//

#import "ViewController.h"
#import "iCloud.h"

@interface ViewController ()

@end


//NSData *file = [NSData dataWithContentsOfFile:...];
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //[[iCloud sharedCloud] init];
    [[iCloud sharedCloud] setDelegate:self];
    [[iCloud sharedCloud] setVerboseLogging:YES];
    
    //iCloud.tw.test.iCloud.iCloud-Test
    [[iCloud sharedCloud] setupiCloudDocumentSyncWithUbiquityContainer:@"iCloud.tw.test.iCloud.iCloud-Test"];
    
    BOOL cloudIsAvailable = [[iCloud sharedCloud] checkCloudAvailability];
    if (cloudIsAvailable) {
        NSLog(@"YES");
        [[iCloud sharedCloud] updateFiles];
        
        //Write Local File
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *path=[paths objectAtIndex:0];
        NSString *filename=[path stringByAppendingPathComponent:@"paymentAssistant.plist"];
//        NSMutableDictionary *dnPlistData=[NSMutableDictionary new];
//        [dnPlistData setValue:@"5678" forKey:@"t1"];
//        [dnPlistData writeToFile:filename  atomically:YES];
        //NSLog(@"dnPlistData=%@",dnPlistData);
        NSLog(@"filename=%@", filename);
        
        NSURL *urlContainer = [[iCloud sharedCloud] ubiquitousContainerURL];
        //NSLog(@"urlContainer=%@", urlContainer.absoluteString);
        
        NSURL *documentsDirectoryURL = [[iCloud sharedCloud] ubiquitousDocumentsDirectoryURL];
        //NSLog(@"documentsDirectoryURL=%@", documentsDirectoryURL.path);
        
        
        //Write to File
//        NSMutableDictionary *wTestDict=[NSMutableDictionary new];
//        [wTestDict setValue:@"asasa" forKey:@"w1"];
//        [wTestDict setValue:@"asasa" forKey:@"w2"];
//        NSString *wf1=[documentsDirectoryURL.path stringByAppendingPathComponent:@"w_test.txt"];
//        [wTestDict writeToFile:wf1 atomically:YES];
//        NSLog(@"wf1=%@", wf1);
        
        
        //NSString Write to File
//        NSError *error = nil;
//        [@"12345678" writeToFile:[documentsDirectoryURL.path stringByAppendingPathComponent:@"myfile.txt"]
//                   atomically:YES encoding:NSUTF8StringEncoding error:&error];
//        if(error != nil) {
//            NSLog(@"NSString Write to File Error: %@", error);
//        }
        
        //Write iCloud File
//        [[iCloud sharedCloud] saveAndCloseDocumentWithName:@"w1.txt" withContent:[@"88888" dataUsingEncoding:NSUTF8StringEncoding] completion:^(UIDocument *cloudDocument, NSData *documentData, NSError *error) {
//            if (error == nil) {
//                NSLog(@"saveAndCloseDocumentWithName OK!");
//            }
//            else {
//                NSLog(@"%@", error);
//            }
//        }];
        
        
        
        //取回
//        [[iCloud sharedCloud] retrieveCloudDocumentWithName:@"test1.txt" completion:^(UIDocument *cloudDocument, NSData *documentData, NSError *error) {
//            if (!error) {
//                NSString *fileName = [cloudDocument.fileURL lastPathComponent];
//                NSData *fileData = documentData;
//                NSString* newStr = [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
//                [fileData writeToFile:[NSString stringWithFormat:@"%@/a8.txt", path] atomically:YES];
//                //NSLog(@"retrieveCloudDocumentWithName=%@,%@", fileName,newStr);
//                NSLog(@"111:%@", [NSString stringWithFormat:@"%@/a1.txt", path]);
//            }
//        }];
        
        //remove
//        [[iCloud sharedCloud] deleteDocumentWithName:@"test1.txt" completion:^(NSError *error) {
//            NSLog(@"deleteDocumentWithName:%@", error);
//        }];
        
//        BOOL fileExists = [[iCloud sharedCloud] doesFileExistInCloud:@"w7"];
//        if (fileExists == YES) {
//            NSLog(@"File Exists in iCloud");
//        }
//        else {
//            NSLog(@"No File Exists in iCloud");
//        }
        
        //iCloud file list
//        NSLog(@"listCloudFiles=%@", [[iCloud sharedCloud] listCloudFiles]);
        
        //[[iCloud sharedCloud] updateFiles];
        
        //[self loadFileList:nil];
    }
    else {
        NSLog(@"NO");
    }
    
}

- (void)iCloudFilesDidChange:(NSMutableArray *)files withNewFileNames:(NSMutableArray *)fileNames {
    
//    for(int i=0; i<files.count; i++) {
//        NSString *filename = [[files objectAtIndex:i] valueForAttribute:NSMetadataItemDisplayNameKey];
//        NSString *filesize = [[files objectAtIndex:i] valueForAttribute:NSMetadataItemFSSizeKey];
//        NSString *filedate = [[files objectAtIndex:i] valueForAttribute:NSMetadataItemFSCreationDateKey];
//        NSLog(@"filename=%@", filename);
//        NSLog(@"filesize=%@", filesize);
//        NSLog(@"filedate=%@", filedate);
//    }
    
    //NSLog(@"iCloudFilesDidChange:%@,%@", fileNames, files);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)createAction:(id)sender {
    //NSString Write to File
    NSURL *documentsDirectoryURL = [[iCloud sharedCloud] ubiquitousDocumentsDirectoryURL];
    
    NSError *error = nil;
    [@"12345678" writeToFile:[documentsDirectoryURL.path stringByAppendingPathComponent:_createTextField.text]
                       atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if(error != nil) {
        NSLog(@"createAction Error: %@", error);
    }
}

- (IBAction)deleteAction:(id)sender {
    NSError *error = nil;
    
    NSURL *documentsDirectoryURL = [[iCloud sharedCloud] ubiquitousDocumentsDirectoryURL];
    
    [[NSFileManager defaultManager] removeItemAtPath:[documentsDirectoryURL.path stringByAppendingPathComponent:_deleteTextField.text] error:&error];
    if(error != nil) {
        NSLog(@"deleteAction Error: %@", error);
    }
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

- (IBAction)copyToLacal:(id)sender {
    //iCloud Path
    NSURL *documentsDirectoryURL = [[iCloud sharedCloud] ubiquitousDocumentsDirectoryURL];
    NSString *iCloudFilePath = [documentsDirectoryURL.path stringByAppendingPathComponent:_c1TextField.text];
    
    //Local Path
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *localFilePath = [path stringByAppendingPathComponent:_c1TextField.text];
    
    NSURL *iCloudFileURL = [NSURL fileURLWithPath:iCloudFilePath];
    NSURL *localFileURL = [NSURL fileURLWithPath:localFilePath];
    //NSLog(@"iCloudFileURL=%@",iCloudFileURL);
    //NSLog(@"localFileURL=%@",localFileURL);
    
    NSError *error = nil;
    [[NSFileManager defaultManager] copyItemAtURL:iCloudFileURL toURL:localFileURL error:&error];
    if(error != nil) {
        NSLog(@"copyToLacal Error: %@", error);
    }
}
- (IBAction)copyToiCloud:(id)sender {
    //iCloud Path
    NSURL *documentsDirectoryURL = [[iCloud sharedCloud] ubiquitousDocumentsDirectoryURL];
    NSString *iCloudFilePath = [documentsDirectoryURL.path stringByAppendingPathComponent:_c2TextField.text];
    
    //Local Path
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *localFilePath = [path stringByAppendingPathComponent:_c2TextField.text];
    
    NSURL *iCloudFileURL = [NSURL fileURLWithPath:iCloudFilePath];
    NSURL *localFileURL = [NSURL fileURLWithPath:localFilePath];
    //NSLog(@"iCloudFileURL=%@",iCloudFileURL);
    //NSLog(@"localFileURL=%@",localFileURL);
    
    NSError *error = nil;
    [[NSFileManager defaultManager] copyItemAtURL:localFileURL toURL:iCloudFileURL error:&error];
    if(error != nil) {
        NSLog(@"copyToiCloud Error: %@", error);
    }
}
@end
