//
//  ViewController.m
//  afnceshi
//
//  Created by chaojie on 2017/5/31.
//  Copyright © 2017年 chaojie. All rights reserved.
//

#import "ViewController.h"

#define ImageURL  @"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1496209345&di=8be7af4dc635a9b83ea2fb07cbd1f6a4&src=http://p1.qhimg.com/t014b4c74bf8515ce9e.jpg"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.title = @"this is a html";
    

    
}

- (IBAction)btnClick:(id)sender {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:ImageURL]];
    
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
        
        NSLog(@"++++++%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        
        
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        
        NSString *fullPath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:response.suggestedFilename];
        
        NSLog(@"-----%@\n%@",targetPath,fullPath);
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
        });
        
        
        return [NSURL fileURLWithPath:fullPath];
        
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        NSLog(@"!!!!!!!%@",filePath);
        
    }];
    
    [downloadTask resume];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
