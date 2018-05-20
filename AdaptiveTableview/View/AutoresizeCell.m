//
//  AutoresizeCell.m
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import "AutoresizeCell.h"

@implementation AutoresizeCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageForRow = [[UIImageView alloc]init];
        self.labelForTitle = [UILabel new];
        self.labelForDetail= [UILabel new];
        self.labelForTitle.lineBreakMode = NSLineBreakByWordWrapping;
        self.labelForDetail.lineBreakMode = NSLineBreakByWordWrapping;
        self.labelForTitle.numberOfLines = 0;
        self.labelForDetail.numberOfLines = 0;
        self.labelForTitle.translatesAutoresizingMaskIntoConstraints = NO;
        self.labelForDetail.translatesAutoresizingMaskIntoConstraints = NO;
        self.imageForRow.translatesAutoresizingMaskIntoConstraints = NO;
        self.labelForTitle.font =[UIFont boldSystemFontOfSize:13.0];
        self.labelForDetail.font = [UIFont systemFontOfSize:12.0];
        [self.contentView addSubview:_imageForRow];
        [self.contentView addSubview:_labelForTitle];
        [self.contentView addSubview:_labelForDetail];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[imageForRow(75)]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"imageForRow":_imageForRow}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelForTitle]-10-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"labelForTitle":_labelForTitle}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[labelForDetail]-10-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"labelForDetail":_labelForDetail}]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-5-[imageForRow(75)]-5-[labelForTitle]-5-[labelForDetail]-5-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"imageForRow":_imageForRow, @"labelForTitle":_labelForTitle,@"labelForDetail":_labelForDetail}]];
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void) updateDataInCell : (DataModel *) dataModel andIndexPath:(NSIndexPath *) indexPath andTableView:(UITableView*) tableView{
    static UIImage * placeHolder;
    placeHolder = [UIImage imageNamed:@"image-placeholder.jpg"];
    self.labelForTitle.text = dataModel.titleOfRow;
    self.labelForDetail.text = dataModel.detailedDescription;
    self.imageForRow.image = placeHolder;
    NSString *imageUrl = dataModel.imageURL;
    
    BOOL bNeedsToFetch = [self.imageForRow.image isEqual:placeHolder];
    
    if (bNeedsToFetch && imageUrl && ![imageUrl isEqualToString:@""])
    {
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageUrl]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
                                  {
                                      if (!error && data)
                                      {
                                          UIImage *image = [UIImage imageWithData:data];
                                          //request succeeded, overwrite cellImage
                                          if (image)
                                          {
                                              dispatch_async(dispatch_get_main_queue(),
                                                             ^{
                                                                 AutoresizeCell *cell = (id)[tableView cellForRowAtIndexPath:indexPath];
                                                                 if (cell)
                                                                     cell.imageForRow.image = image;
                                                             });
                                          }
                                      }
                                      else
                                      {
                                          NSLog(@"Failed to load the image from URL: %@", imageUrl);
                                      }
                                  }];
        
    }

}

@end
