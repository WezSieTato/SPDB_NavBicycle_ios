//
//  MKPolylineView+ColorPolyline.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <MapKit/MapKit.h>

@class ColorPolyline;

@interface MKPolylineView (ColorPolyline)

-(instancetype)initWithColorPolyline:(ColorPolyline *)polyline;

@end
