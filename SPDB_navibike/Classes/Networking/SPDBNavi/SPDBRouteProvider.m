//
//  SPDBRouteProvider.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBRouteProvider.h"
#import "SPDBQueryCreator.h"

@implementation SPDBRouteProvider

-(void)getRouteWithStartLocation:(CLLocationCoordinate2D)start
                  andEndLocation:(CLLocationCoordinate2D)end
           withCompletionHandler:(SPDBRouteProviderCompletionHandler)handler {
    NSURL *url = [SPDBQueryCreator urlWithStartLocation:start
                                         andEndLocation:end];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                               if (connectionError == nil) {
                                   NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                              options:kNilOptions
                                                                                                error:nil];
                                   
                                   SPDBRoute *objResponse = [[SPDBRoute alloc] initWithDictionary:dictionary];
                                   handler(objResponse, connectionError);
                               } else {
                                   handler(nil, connectionError);
                               }

                           }];
    
}

@end
