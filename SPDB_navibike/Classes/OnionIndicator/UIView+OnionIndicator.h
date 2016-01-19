//
//  UIView+OnionIndicator.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 03/07/15.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OnionIndicatorView;

@interface UIView (OnionIndicator)

- (OnionIndicatorView *)indicator;
- (OnionIndicatorView *)addIndicator;
- (BOOL)removeIndicator;

@end
