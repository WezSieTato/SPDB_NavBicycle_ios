//
//  NetworkingMacros.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 16.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#ifndef NetworkingMacros_h
#define NetworkingMacros_h

#import <MapKit/MapKit.h>

#define NSValueWithCoordinate( latitude, longitude ) [NSValue valueWithMKCoordinate:CLLocationCoordinate2DMake(latitude, longitude)]

#endif /* NetworkingMacros_h */
