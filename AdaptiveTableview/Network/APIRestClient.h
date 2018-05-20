//
//  APIRestClient.h
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol NetworkOpeationCompleted <NSObject>
@required
-(void)parsingCompleted:(NSMutableArray *)arrayForResult andTheTitle:(NSString *)title;
@end
@interface APIRestClient : NSObject
{
    NSMutableData *receivedData;
    NSURLConnection *connection;
    NSStringEncoding encoding;
    NSMutableArray *arrayForResult;
    id<NetworkOpeationCompleted>delegate;
}
@property(nonatomic,weak)id<NetworkOpeationCompleted>delegate;
- (id)initWithURL:(NSURL *)url;
-(void)callWebService:(NSURL *)url;
@end
