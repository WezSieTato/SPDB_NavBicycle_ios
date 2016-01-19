//
//  SPDBRoute.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBRoute.h"
#import "SPDBPoint.h"
#import "NSArray+SPDBModel.h"

@implementation SPDBRoute

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        _start = [[SPDBPoint alloc] initWithDictionary:dictionary[@"start"]];
        _end = [[SPDBPoint alloc] initWithDictionary:dictionary[@"end"]];
        NSDictionary *inDictionary = dictionary[@"routePoints"];
        _stations = [NSArray arrayModelFromArrayDictionary:inDictionary[@"verturiloStations"]
                                                 withClass:[SPDBStation class]];
        _costs = inDictionary[@"costs"];
    }
    return self;
}


@end
