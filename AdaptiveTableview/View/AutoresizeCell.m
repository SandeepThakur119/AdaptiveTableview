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
        self.imageForRow.backgroundColor = [UIColor redColor];
        self.labelForDetail.backgroundColor = [UIColor yellowColor];
        self.labelForTitle.backgroundColor= [UIColor purpleColor];
        [self.contentView addSubview:_imageForRow];
        [self.contentView addSubview:_labelForTitle];
        [self.contentView addSubview:_labelForDetail];
        self.labelForTitle.text = @"Title";
        self.labelForDetail.text= @"Details";
        //self.imageForRow.image = [UIImage imageNamed:@"screen.png"];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-15-[imageForRow(75)]|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"imageForRow":_imageForRow}]];
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

@end
