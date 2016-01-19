//
//  OpenRouteServiceQueryCreatorTests.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 16.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURLComponents+Addition.h"
#import "OpenRouteServiceQueryCreator.h"
#import "NetworkingMacros.h"

@interface OpenRouteServiceQueryCreatorTests : XCTestCase

@end

@implementation OpenRouteServiceQueryCreatorTests

-(void)testRouteParametersWith2Points {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject: NSValueWithCoordinate(9.256506, 49.240011)];
    [array addObject:NSValueWithCoordinate(8.72083, 49.7606)];

    NSURL *url = [OpenRouteServiceQueryCreator urlWithLocations:array
                                               routePreferences:OpenRouteServiceRoutePreferencesBicycle];

    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];

    XCTAssertEqualObjects([components queryValueWithName:@"start"], @"49.240011,9.256506");
    XCTAssertEqualObjects([components queryValueWithName:@"end"], @"49.760600,8.720830");
}

-(void)testRouteParametersWith4Points {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject: NSValueWithCoordinate(9.256506, 49.240011)];
    [array addObject:NSValueWithCoordinate(8.72083, 50.7606)];
    [array addObject:NSValueWithCoordinate(7.72083, 51.7606)];
    [array addObject:NSValueWithCoordinate(6.72083, 52.7606)];

    NSURL *url = [OpenRouteServiceQueryCreator urlWithLocations:array
                                               routePreferences:OpenRouteServiceRoutePreferencesBicycle];

    XCTAssertEqualObjects(url.description,@"http://openls.geog.uni-heidelberg.de/route?start=49.240011,9.256506&via=50.760600,8.720830&via=51.760600,7.720830&end=52.760600,6.720830&routepref=Bicycle&distunit=KM&weighting=Shortest&avoidAreas=&useTMC=false&noMotorways=false&noTollways=false&noUnpavedroads=false&noSteps=false&noFerries=false&instructions=false&lang=de");
}

@end
