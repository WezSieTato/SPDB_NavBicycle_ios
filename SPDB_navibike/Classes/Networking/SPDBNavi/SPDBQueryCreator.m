//
//  SPDBQueryCreator.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBQueryCreator.h"

@implementation SPDBQueryCreator

+ (NSURL *)urlWithStartLocation:(CLLocationCoordinate2D)start andEndLocation:(CLLocationCoordinate2D)end {
    NSURLComponents *components = [NSURLComponents componentsWithString:@"http://localhost:8080/route"];
    NSMutableArray *queryItems = [[NSMutableArray alloc] init];

    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"startLat"
                                                      value:[self latitudeStringFromCoordinate:start]]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"startLng"
                                                      value:[self longitudeStringFromCoordinate:start]]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"endLat"
                                                      value:[self latitudeStringFromCoordinate:end]]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"endLng"
                                                      value:[self longitudeStringFromCoordinate:end]]];


    components.queryItems = [queryItems copy];
    NSLog(@"%@", [components.URL path]);

    return components.URL;
}

+ (NSString *)latitudeStringFromCoordinate:(CLLocationCoordinate2D)coordinate {
    return [NSString stringWithFormat:@"%f", coordinate.latitude];
}

+ (NSString *)longitudeStringFromCoordinate:(CLLocationCoordinate2D)coordinate {
    return [NSString stringWithFormat:@"%f", coordinate.longitude];
}

@end
