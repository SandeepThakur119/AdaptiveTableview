//
//  NSMutableDictionary+StripNulls.h
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (StripNulls)
- (NSDictionary *)dictionaryByReplacingNullsWithBlanks;
@end

@interface NSDictionary (StripNulls)
- (NSDictionary *)dictionaryByReplacingNullsWithBlanks;
@end
