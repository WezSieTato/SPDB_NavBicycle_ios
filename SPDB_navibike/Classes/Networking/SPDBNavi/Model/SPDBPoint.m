//
//  SPDBPoint.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBPoint.h"

@implementation SPDBPoint

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if(self) {
        _coordinate.latitude = [dictionary[@"lat"] doubleValue];
        _coordinate.longitude = [dictionary[@"lng"] doubleValue];
    }

    return self;
}

@end
