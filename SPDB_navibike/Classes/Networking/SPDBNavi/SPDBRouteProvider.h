//
//  SPDBRouteProvider.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBRoute.h"

typedef void (^SPDBRouteProviderCompletionHandler)(SPDBRoute *route, NSError* error);

@interface SPDBRouteProvider : NSObject

- (void)getRouteWithStartLocation:(CLLocationCoordinate2D)start
                   andEndLocation:(CLLocationCoordinate2D)end
            withCompletionHandler:(SPDBRouteProviderCompletionHandler)handler;

@end
