//
//  ViewController.h
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIRestClient.h"
#import "APIRestClient.h"
@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,NetworkOpeationCompleted>{
    IBOutlet UITableView *adaptiveTableView;
    IBOutlet UIActivityIndicatorView *activityView;
    NSArray *arrayOfContent;
    APIRestClient *restClient;
}
-(IBAction)refreshUI:(id)sender;

@end

