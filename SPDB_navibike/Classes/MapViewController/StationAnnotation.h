//
//  StationAnnotation.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 19.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "SPDBStation.h"

@interface StationAnnotation : NSObject <MKAnnotation>

@property (nonatomic, nonnull, strong) SPDBStation *station;

- (nonnull instancetype)initWithStation:(nonnull SPDBStation *)station;

+ (nonnull instancetype)annotationWithStation:(nonnull SPDBStation *)station;

@end
