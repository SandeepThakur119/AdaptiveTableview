//
//  ViewController.m
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import "ViewController.h"
#import "AutoresizeCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayOfContent=[[NSMutableArray alloc]initWithObjects:@"gadjadadahdaj adajdagjdad adahdgajda dadagdjada dadhgajdad adahgdajda dadghajdgajdahdad adadjagdjagdajdhgajdhgajdhajdhadj adahdajhdgada dadhad",@"gadjadadahdaj adajdagjdad adahdgajda dadagdjada dadhgajdad adahgdajda dadghajdgajdahdad adadjagdjagdajdhgajdhgajdhajdhadj adahdajhdgada dadhad",@"gadjadadahdaj adajdagjdad adahdgajda dadagdjada dadhgajdad adahgdajda ",@"gadjadadahdaj adajdagjdad adahdgajda dadagdjada dadhgajdad adahgdajda dadghajdgajdahdad adadjagdjagdajdhgajdhgajdhajdhadj adahdajhdgada dadhadf fsfsf sfsf sfsff sf sf f f sf s fs f sf sf sf s f f fs fs f  f ",@"adadadad",@"ffsfffssf",nil];
    [adaptiveTableView registerClass:[AutoresizeCell class] forCellReuseIdentifier:@"adaptiveCell"];
    adaptiveTableView.estimatedRowHeight = 100;
    adaptiveTableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view, typically from a nib.
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"adaptiveCell";
    
    // Similar to UITableViewCell, but
    AutoresizeCell *cell = (AutoresizeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[AutoresizeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.labelForDetail.text = [arrayOfContent objectAtIndex:indexPath.row];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
