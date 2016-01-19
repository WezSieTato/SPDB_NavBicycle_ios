//
//  UIView+Additions.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 19.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

- (void)addSubviewWithFitToParentConstraints:(UIView *)subview;
- (NSArray*)allSubViews;
@end
