//
//  NSDictionary+Deepcopy.h
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>

// Header
@protocol MutableDeepCopying <NSObject>
-(id) mutableDeepCopy;
@end
@interface NSDictionary (MutableDeepCopy) <MutableDeepCopying>
@end
@interface NSArray (MutableDeepCopy) <MutableDeepCopying>
@end
