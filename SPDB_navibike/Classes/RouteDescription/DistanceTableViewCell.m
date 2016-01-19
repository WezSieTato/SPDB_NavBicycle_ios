//
//  DistanceTableViewCell.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "DistanceTableViewCell.h"

@implementation DistanceTableViewCell

- (void)configureWithCost:(NSNumber *)cost {
    self.detailTextLabel.text = [NSString stringWithFormat:@"%.2f zł", [cost floatValue]];
}

@end
