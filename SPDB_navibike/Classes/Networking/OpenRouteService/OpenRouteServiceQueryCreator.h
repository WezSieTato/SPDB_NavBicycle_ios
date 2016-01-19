//
//  OpenRouteServiceQueryCreator.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 14.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "OpenRouteServiceRouteProvider.h"

@interface OpenRouteServiceQueryCreator : NSObject

+ (NSURL *)urlWithLocations:(NSArray <NSValue *> *)locations
         routePreferences:(OpenRouteServiceRoutePreferences)preferences;

@end
