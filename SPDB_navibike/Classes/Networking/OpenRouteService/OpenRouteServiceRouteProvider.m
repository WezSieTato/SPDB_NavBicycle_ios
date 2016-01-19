//
//  OpenRouteServiceRouteProvider.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 17.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "OpenRouteServiceRouteProvider.h"
#import "OpenRouteServiceQueryCreator.h"
#import "OpenRouteServiceResponseParser.h"

@interface OpenRouteServiceRouteProvider ()

@property (nonatomic, readwrite, assign) NSUInteger finishedTasks;

@end

@implementation OpenRouteServiceRouteProvider

- (void)getRouteWithLocations:(NSArray <NSValue *> *)locations
             routePreferences:(OpenRouteServiceRoutePreferences)preferences
        withCompletionHandler:(OpenRouteServiceRouteProviderCompletionHandler)handler {

    NSURL *url = [OpenRouteServiceQueryCreator urlWithLocations:locations
                                               routePreferences:preferences];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
                               
                               ++self.finishedTasks;
                               if (connectionError) {
                                   handler(nil, preferences, connectionError);
                               } else {
                                   NSArray <NSValue *> *coordinates = [OpenRouteServiceResponseParser coordinatesFromResponse:data];
                                   handler(coordinates, preferences, connectionError);
                               }
                           }];
    
}

- (void)resetCounter {
    self.finishedTasks = 0;
}


@end
