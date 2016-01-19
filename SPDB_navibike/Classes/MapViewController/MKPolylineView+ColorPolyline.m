//
//  MKPolylineView+ColorPolyline.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "MKPolylineView+ColorPolyline.h"
#import "ColorPolyline.h"

@implementation MKPolylineView (ColorPolyline)

- (instancetype)initWithColorPolyline:(ColorPolyline *)polyline {
    self = [self initWithPolyline:polyline];
    if(self) {
        self.strokeColor = polyline.color;
        self.lineWidth = 4.0f;
    }

    return self;
}

@end
