//
//  ColorPolyline.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface ColorPolyline : MKPolyline

@property (nonatomic, nullable, strong) UIColor *color;

@end
