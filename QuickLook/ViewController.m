//
//  ViewController.m
//  QuickLook
//
//  Created by PPAM on 2/4/17.
//  Copyright © 2017 Sample. All rights reserved.
//

#import "ViewController.h"
#import <QuickLook/QuickLook.h>

@interface ViewController ()<QLPreviewControllerDelegate,QLPreviewControllerDataSource>

@end

@implementation ViewController{
    NSString *path;
    NSArray *fileNamesArray;
    NSInteger btnTag;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    fileNamesArray=[[NSArray alloc] initWithObjects:@"sample.pdf",@"sample.pptx",@"sample.doc",@"sample.rtf",@"sample.jpeg",@"sample.csv", nil];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)initiateQuickLoookController{
    QLPreviewController *previewController=[[QLPreviewController alloc]init];
    previewController.delegate=self;
    previewController.dataSource=self;
    [self presentViewController:previewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(id)sender {
    btnTag = 0;
    switch ([sender tag]) {
        case 0:
            path = [[NSBundle mainBundle] pathForResource:@"sample"
                                                   ofType:@"pdf"];
            break;
        case 1:
            path = [[NSBundle mainBundle] pathForResource:@"sample"
                                                   ofType:@"rtf"];
            break;
        case 2:
            path = [[NSBundle mainBundle] pathForResource:@"sample"
                                                   ofType:@"pptx"];
            break;
        case 3:
            path = [[NSBundle mainBundle] pathForResource:@"sample"
                                                   ofType:@"jpeg"];
            break;
        case 4:
            path = [[NSBundle mainBundle] pathForResource:@"sample"
                                                   ofType:@"doc"];
            break;
        case 5:
            path = [[NSBundle mainBundle] pathForResource:@"sample"
                                                   ofType:@"csv"];
            break;
        case 6:
            btnTag = 6;
            break;
            
        default:
            break;
    }
   
 [self initiateQuickLoookController];
}


#pragma mark - DataSource Methods

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    if (btnTag == 6) {
        return [fileNamesArray count];
    }
    return 1;
}

- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    
    
     if(btnTag==6)
     {
     NSString *allPath=[[NSBundle mainBundle] pathForResource:[fileNamesArray objectAtIndex:index] ofType:nil];
     return [NSURL fileURLWithPath:allPath];
     }

     
   
     return [NSURL fileURLWithPath:path];
    
}


#pragma mark - delegate methods


- (BOOL)previewController:(QLPreviewController *)controller shouldOpenURL:(NSURL *)url forPreviewItem:(id <QLPreviewItem>)item
{
    return YES;
}







@end
