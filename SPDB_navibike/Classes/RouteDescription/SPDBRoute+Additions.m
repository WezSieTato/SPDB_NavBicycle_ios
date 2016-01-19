//
//  SPDBRoute+Additions.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBRoute+Additions.h"

@implementation SPDBRoute (Additions)

- (NSNumber *)totalCosts {
    double costs = 0;
    for (NSNumber *cost in self.costs) {
        costs += [cost doubleValue];
    }
    return @(costs);
}

@end
