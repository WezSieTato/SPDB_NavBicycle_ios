//
//  UIViewController+HUD.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 19.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HUD)

- (void)showErrorMessage:(NSString *)message;
- (void)showError:(NSError *)error;
- (void)showProgressHUD;
- (void)removeProgressHUD;
@end
