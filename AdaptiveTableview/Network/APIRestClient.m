//
//  APIRestClient.m
//  AdaptiveTableview
//
//  Created by Sandeep Thakur on 20/05/18.
//  Copyright © 2018 Sandeep. All rights reserved.
//

#import "APIRestClient.h"
#import "NSMutableDictionary+StripNulls.h"
#import "DataModel.h"

@implementation APIRestClient
- (id)initWithURL:(NSURL *)url
{
    if (self = [super init])
    {
        [self callWebService:url];
        arrayForResult=[[NSMutableArray alloc]init];
    }
    
    return self;
}

-(void)callWebService:(NSURL *)url{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
}
-(void)getArrayFromJson:(NSDictionary *)dictionary{
    if (arrayForResult.count>0) {
        [arrayForResult removeAllObjects];
    }
    NSArray *totalResults = [dictionary valueForKey:@"rows"];
    for (int i = 0; i< totalResults.count; i++) {
        DataModel *datamodel = [[DataModel alloc]init];
        datamodel.titleOfRow = [[totalResults objectAtIndex:i]valueForKey:@"title"];
        datamodel.detailedDescription = [[totalResults objectAtIndex:i]valueForKey:@"description"];
        datamodel.imageURL = [[totalResults objectAtIndex:i]valueForKey:@"imageHref"];
        [arrayForResult addObject:datamodel];
    }
    [self.delegate parsingCompleted:arrayForResult andTheTitle:[dictionary valueForKey:@"title"]];
}

#pragma mark NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
     receivedData = nil;
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!receivedData)
    {
        // no store yet, make one
        receivedData = [[NSMutableData alloc] initWithData:data];
    }
    else
    {
        // append to previous chunks
        [receivedData appendData:data];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSString *jsonString = [[NSString alloc] initWithData:receivedData encoding:encoding];
    NSError *error;
    NSData *convertedData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *convertedDictionary = [NSJSONSerialization JSONObjectWithData:convertedData options:NSJSONReadingMutableContainers error:&error];
    if (convertedDictionary) {
        [self getArrayFromJson:[convertedDictionary dictionaryByReplacingNullsWithBlanks]];
    }
    
    NSLog(@"%@", convertedDictionary);
}
- (BOOL)connection:(NSURLConnection *)connection
canAuthenticateAgainstProtectionSpace:(NSURLProtectionSpace *)protectionSpace
{
    return [protectionSpace.authenticationMethod
            isEqualToString:NSURLAuthenticationMethodServerTrust];
}

- (void)connection:(NSURLConnection *)connection
didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([challenge.protectionSpace.authenticationMethod
         isEqualToString:NSURLAuthenticationMethodServerTrust])
    {
        // Trust this domain
        if ([challenge.protectionSpace.host isEqualToString:@"https://dl.dropboxusercontent.com"])
        {
            NSURLCredential *credential =
            [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
            [challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
        }
    }
    
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

// and error occured
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"Error retrieving data, %@", [error localizedDescription]);
}

@end
