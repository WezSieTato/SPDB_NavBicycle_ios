//
//  StationAnnotation.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 19.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "StationAnnotation.h"

@implementation StationAnnotation

- (instancetype)initWithStation:(SPDBStation *)station {
    self = [super init];
    if (self) {
        self.station = station;
    }

    return self;
}

+ (instancetype)annotationWithStation:(SPDBStation *)station {
    return [[self alloc] initWithStation:station];
}

- (CLLocationCoordinate2D)coordinate {
    return self.station.coordinate;
}

- (NSString *)title {
    return @"Station";
}

- (NSString *)subtitle {
    return self.station.name;
}

@end
