//
//  SPDBQueryCreator.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface SPDBQueryCreator : NSObject

+ (NSURL *)urlWithStartLocation:(CLLocationCoordinate2D)start
                 andEndLocation:(CLLocationCoordinate2D)end;

@end
