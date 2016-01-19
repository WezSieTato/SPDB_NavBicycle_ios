//
//  OpenRouteServiceQueryCreator.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 14.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "OpenRouteServiceQueryCreator.h"
#import <MapKit/MapKit.h>

@implementation OpenRouteServiceQueryCreator

//http://openls.geog.uni-heidelberg.de/route?
// &start=9.256506,49.240011
// &end=8.72083,49.7606
// &via=7.0920891,50.7295968 7.1044487,50.7247613 7.1049637,50.7298142
// &lang=de
// &distunit=KM
// &routepref=Bicycle
// &weighting=Shortest
// &avoidAreas=
// &useTMC=false
// &noMotorways=false
// &noTollways=false
// &noUnpavedroads=false
// &noSteps=false
// &noFerries=false
// &instructions=false
+ (NSURL *)urlWithLocations:(NSArray<NSValue *> *)locations
           routePreferences:(OpenRouteServiceRoutePreferences)preferences {
    NSURLComponents *components = [NSURLComponents componentsWithString:@"http://openls.geog.uni-heidelberg.de/route"];
    NSMutableArray *queryItems = [[NSMutableArray alloc] init];

    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"start" value:[self stringFromCoordinateValue:locations.firstObject]]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"end" value:[self stringFromCoordinateValue:locations.lastObject]]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"via" value:[self stringFromCoordinateValues:locations]]];

    NSString *routePrefValue;

    switch (preferences) {
        case OpenRouteServiceRoutePreferencesBicycle:
            routePrefValue = @"Bicycle";
            break;

        case OpenRouteServiceRoutePreferencesPedestrian:
            routePrefValue = @"Pedestrian";

        default:
            break;
    }
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"routepref" value:routePrefValue]];

    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"distunit" value:@"KM"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"weighting" value:@"Shortest"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"avoidAreas" value:@""]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"useTMC" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"noMotorways" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"noTollways" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"noUnpavedroads" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"noSteps" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"noFerries" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"instructions" value:@"false"]];
    [queryItems addObject:[NSURLQueryItem queryItemWithName:@"lang" value:@"de"]];

    components.queryItems = [queryItems copy];
    NSLog(@"%@", [components.URL path]);

    return components.URL;
}

+ (NSString*)stringFromCoordinate:(CLLocationCoordinate2D)coordinate {
    return [NSString stringWithFormat:@"%f,%f", coordinate.longitude, coordinate.latitude];
}

+ (NSString*)stringFromCoordinateValue:(NSValue *)coordinate {
    return [self stringFromCoordinate:coordinate.MKCoordinateValue];
}

+ (NSString*)stringFromCoordinateValues:(NSArray <NSValue *> *)coordinates {

    if(coordinates.count <= 2) {
        return @"";
    }

    NSMutableArray <NSString *> *descriptions = [NSMutableArray new];

    NSUInteger lastIndex = coordinates.count - 1;
    [coordinates enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(idx != 0 && idx != lastIndex ) {
            [descriptions addObject:[self stringFromCoordinateValue:obj]];
        }
    }];

    return [descriptions componentsJoinedByString:@" "];
}

@end
