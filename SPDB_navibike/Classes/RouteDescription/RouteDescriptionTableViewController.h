//
//  RouteDescriptionTableViewController.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPDBRoute.h"

@interface RouteDescriptionTableViewController : UITableViewController

@property (nonatomic, nonnull, strong) SPDBRoute *route;

@end
