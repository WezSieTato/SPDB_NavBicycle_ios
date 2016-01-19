//
//  OpenRouteServiceRouteProvider.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 17.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSInteger, OpenRouteServiceRoutePreferences) {
    OpenRouteServiceRoutePreferencesBicycle,
    OpenRouteServiceRoutePreferencesPedestrian
};

typedef void (^OpenRouteServiceRouteProviderCompletionHandler)(NSArray <NSValue *> * route, OpenRouteServiceRoutePreferences preferences, NSError* error);

@interface OpenRouteServiceRouteProvider : NSObject

- (void)getRouteWithLocations:(NSArray <NSValue *> *)locations
         routePreferences:(OpenRouteServiceRoutePreferences)preferences
        withCompletionHandler:(OpenRouteServiceRouteProviderCompletionHandler)handler;

@property (nonatomic, readonly, assign) NSUInteger finishedTasks;

- (void)resetCounter;

@end
