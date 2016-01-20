//
//  PointAnnotation.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 20.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "PointAnnotation.h"

@implementation PointAnnotation

- (instancetype)initWithPoint:(SPDBPoint *)point {
    self = [super init];
    if (self) {
        self.point = point;
    }

    return self;
}

+ (instancetype)annotationWithPoint:(SPDBPoint *)point {
    return [[self alloc] initWithPoint:point];
}

- (CLLocationCoordinate2D)coordinate {
    return self.point.coordinate;
}

@end
