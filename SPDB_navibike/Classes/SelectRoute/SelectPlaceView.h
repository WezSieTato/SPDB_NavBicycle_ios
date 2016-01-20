//
//  SelectPlaceView.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 14.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SelectPlaceView : UIView

@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, copy) NSString *placeholderText;
@property (nonatomic, readonly) NSString *text;

@property (nonatomic, readonly, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, readonly) BOOL isValidCoordinate;

@end
