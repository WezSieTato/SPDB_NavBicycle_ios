//
//  StationTableViewCell.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SPDBStation;

@interface StationTableViewCell : UITableViewCell

- (void)configureWithStation:(SPDBStation *)station;

@end
