//
//  NSURLComponents+Addition.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 16.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "NSURLComponents+Addition.h"

@implementation NSURLComponents (Addition)

- (NSString *)queryValueWithName:(NSString *)name {
    for(NSURLQueryItem *item in self.queryItems) {
        if ([item.name isEqualToString:name]) {
            return item.value;
        }
    }

    return nil;
}

@end
