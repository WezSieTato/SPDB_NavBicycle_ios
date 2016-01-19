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

@end
