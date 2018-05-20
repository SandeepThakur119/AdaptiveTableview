//
//  AutoresizeCell.h
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModel.h"

@interface AutoresizeCell : UITableViewCell{
    
}
@property(nonatomic,strong) UIImageView *imageForRow;
@property(nonatomic,strong) UILabel *labelForTitle;
@property(nonatomic,strong) UILabel *labelForDetail;
- (void) updateDataInCell : (DataModel *) dataModel andIndexPath:(NSIndexPath *) indexPath andTableView:(UITableView*) tableView;

@end
