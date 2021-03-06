//
//  UIView+OnionIndicator.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 03/07/15.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "UIView+OnionIndicator.h"
#import "OnionIndicatorView.h"
#import <MSAddition/UIView+MSAddition.h>

@implementation UIView (OnionIndicator)

- (OnionIndicatorView *)indicator{
    NSEnumerator *subviewsEnum = [self.ms_allSubViews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:[OnionIndicatorView class]]) {
            return (OnionIndicatorView *)subview;
        }
    }
    return nil;
}

- (OnionIndicatorView *)addIndicator{
    OnionIndicatorView *hud = [self indicator];
    if(hud)
        return hud;
    
    hud = [OnionIndicatorView indicator];
    [self ms_addSubviewWithFitToParentConstraints:hud];
    
    return hud;
}

- (BOOL)removeIndicator{
    OnionIndicatorView *hud = [self indicator];
    BOOL removed = NO;
    if (hud != nil) {
        [hud removeFromSuperview];
        removed = YES;
    }
    return removed;
}

@end
