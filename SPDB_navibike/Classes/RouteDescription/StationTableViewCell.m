//
//  StationTableViewCell.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "StationTableViewCell.h"
#import "SPDBStation.h"

@implementation StationTableViewCell

- (void)configureWithStation:(SPDBStation *)station {
    self.detailTextLabel.text = station.name;
}

@end
