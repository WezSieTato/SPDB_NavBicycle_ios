//
//  SPDBPoint.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBModel.h"
#import <CoreLocation/CoreLocation.h>

@interface SPDBPoint : NSObject <SPDBModel>

@property (nonatomic, readonly, assign) CLLocationCoordinate2D coordinate;

@end
