//
//  PointAnnotation.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 20.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "SPDBPoint.h"

@interface PointAnnotation : NSObject <MKAnnotation>

@property (nonatomic, nonnull, strong) SPDBPoint *point;
@property (nonatomic, nullable, copy) NSString *title;
@property (nonatomic, nullable, copy) NSString *subtitle;

- (nonnull instancetype)initWithPoint:(nonnull SPDBPoint *)point;

+ (nonnull instancetype)annotationWithPoint:(nonnull SPDBPoint *)point;

@end
