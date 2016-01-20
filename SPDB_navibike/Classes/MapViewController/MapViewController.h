//
//  MapViewController.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 17.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "ColorPolyline.h"
#import "SPDBStation.h"

@interface MapViewController : UIViewController

@property (nonatomic, nonnull, strong) NSArray <ColorPolyline *> *colorPolylines;
@property (nonatomic, nonnull, strong) NSArray <SPDBStation *> *stations;
@property (nonatomic, nonnull, strong) SPDBPoint *start;
@property (nonatomic, nonnull, strong) SPDBPoint *end;
@property (nonatomic, nonnull, copy) NSString *startName;
@property (nonatomic, nonnull, copy) NSString *endName;

@end
