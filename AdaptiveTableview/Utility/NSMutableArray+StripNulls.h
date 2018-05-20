//
//  NSMutableArray+StripNulls.h
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (StripNulls)
- (NSArray *)arrayByReplacingNullsWithBlanks  ;
@end

@interface NSArray (StripNulls)
- (NSArray *)arrayByReplacingNullsWithBlanks  ;
@end
