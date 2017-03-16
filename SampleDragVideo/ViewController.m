//
//  ViewController.m
//  SampleDragVideo
//
//  Created by quanght2 on 8/30/16.
//  Copyright © 2016 VngCorp. All rights reserved.
//

#import "ViewController.h"
#import "VideoView.h"
#import "SecondViewController.h"

#import "AppDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

{
    UITableView *mTableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    mTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    mTableView.delegate = self;
    mTableView.dataSource = self;
    
    [self.view addSubview:mTableView];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    

    
}

#pragma mark -- 
#pragma mark -- UITableViewDelegate



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 110;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"commentsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    NSString *textLabelTitle = [NSString stringWithFormat:@"Video %ld", (long)indexPath.row];
    cell.textLabel.text = textLabelTitle;
    
    return cell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row %2 == 1) {
        
        SecondViewController *second = [[SecondViewController alloc]initWithNibName:@"SecondViewController" bundle:nil];
        [self presentViewController:second animated:YES completion:NULL];
        
    } else {
        
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        UIWindow *window = delegate.window;
        UIView *view =   [window viewWithTag:1000];
        if (view) {
            VideoView *videoView = (VideoView*)view;
            [videoView expandVideoView];
            [videoView playVideo];
            
        } else {
            
            VideoView *videoView = [[VideoView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            videoView.tag = 1000;
            [window addSubview:videoView];
            [videoView minimizeVideoView:NO];
            [videoView expandVideoView];

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                [videoView playVideo];
            });
  
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
