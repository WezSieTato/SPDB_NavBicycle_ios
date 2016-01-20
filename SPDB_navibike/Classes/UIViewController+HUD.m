//
//  UIViewController+HUD.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 19.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "UIViewController+HUD.h"
#import <CSNotificationView/CSNotificationView.h>
#import "OnionIndicatorView.h"

@implementation UIViewController (HUD)

- (void)showErrorMessage:(NSString *)message {
    [self removeProgressHUD];
    [CSNotificationView showInViewController:self
                                       style:CSNotificationViewStyleError
                                     message:message];
}

- (void)showError:(NSError *)error {
    [self showErrorMessage:error.description];
}

- (void)showProgressHUD {
    [self.navigationController.view addIndicator];
}

- (void)removeProgressHUD {
    [self.navigationController.view removeIndicator];
}

@end
