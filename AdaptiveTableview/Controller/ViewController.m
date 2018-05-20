//
//  ViewController.m
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import "ViewController.h"
#import "AutoresizeCell.h"
#import "DataModel.h"
#define URLString @"https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"

@interface ViewController ()

@end

@implementation ViewController
@synthesize adaptiveTableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    adaptiveTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, adaptiveTableView.bounds.size.width, 0.01f)];
    arrayOfContent=[[NSArray alloc]init];
    [adaptiveTableView registerClass:[AutoresizeCell class] forCellReuseIdentifier:@"adaptiveCell"];
    adaptiveTableView.estimatedRowHeight = 100;
    adaptiveTableView.rowHeight = UITableViewAutomaticDimension;
    restClient = [[APIRestClient alloc]initWithURL:[NSURL URLWithString:URLString]];
    restClient.delegate = self;
    [self startActivityIndicator];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrayOfContent.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"adaptiveCell";
    
    // Similar to UITableViewCell, but
    AutoresizeCell *cell = (AutoresizeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[AutoresizeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    DataModel *model = [arrayOfContent objectAtIndex:indexPath.row];
    if (model) {
        [cell updateDataInCell:model andIndexPath:indexPath andTableView:tableView];
    }
    
    return cell;
}
-(IBAction)refreshUI:(id)sender{
    [restClient callWebService:[NSURL URLWithString:URLString]];
    [self startActivityIndicator];
}
- (void) startActivityIndicator
{
    if (![activityView isAnimating])
    {
        [activityView startAnimating];
        activityView.hidden = NO;
    }
}

- (void) stopActivityIndicator
{
    if ([activityView isAnimating])
    {
        [activityView stopAnimating];
        activityView.hidden = YES;
    }
}

-(void)parsingCompleted:(NSMutableArray *)arrayForResult andTheTitle:(NSString *)title{
    arrayOfContent = [NSArray arrayWithArray:arrayForResult];
    self.title = title;
    [adaptiveTableView reloadData];
    [self stopActivityIndicator];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
