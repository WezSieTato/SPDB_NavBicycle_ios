//
//  OpenRouteServiceResponseParserTests.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 16.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OpenRouteServiceResponseParser.h"
#import <MapKit/MapKit.h>
#define CLCOORDINATE_EPSILON 0.000005f
#define CLCOORDINATES_EQUAL2( coord1, coord2 ) (fabs(coord1.latitude - coord2.latitude) < CLCOORDINATE_EPSILON && fabs(coord1.longitude - coord2.longitude) < CLCOORDINATE_EPSILON)

@interface OpenRouteServiceResponseParserTests : XCTestCase

@end

@implementation OpenRouteServiceResponseParserTests

- (void)testParseXML {
    NSBundle *bundle = [NSBundle bundleForClass:self.class];
    NSURL *imgPath = [bundle URLForResource:@"routeResponse" withExtension:@"xml"];
    NSString *stringPath = [imgPath absoluteString]; //this is correct

    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:stringPath]];
    NSArray <NSValue *> *points = [OpenRouteServiceResponseParser coordinatesFromResponse:data];

    XCTAssertEqual(points.count, 4);

    CLLocationCoordinate2D resultingCoordinate = points[0].MKCoordinateValue;
    CLLocationCoordinate2D expectedCoordinate = CLLocationCoordinate2DMake(49.2400527, 9.2564840);
    XCTAssertTrue(CLCOORDINATES_EQUAL2(resultingCoordinate, expectedCoordinate));

    resultingCoordinate = points[0].MKCoordinateValue;
    expectedCoordinate = CLLocationCoordinate2DMake(49.2400527, 9.2564840);
    XCTAssertTrue(CLCOORDINATES_EQUAL2(resultingCoordinate, expectedCoordinate));

    resultingCoordinate = points[1].MKCoordinateValue;
    expectedCoordinate = CLLocationCoordinate2DMake(49.2400214, 9.2563449);
    XCTAssertTrue(CLCOORDINATES_EQUAL2(resultingCoordinate, expectedCoordinate));

    resultingCoordinate = points[2].MKCoordinateValue;
    expectedCoordinate = CLLocationCoordinate2DMake(49.2399189, 9.2559342);
    XCTAssertTrue(CLCOORDINATES_EQUAL2(resultingCoordinate, expectedCoordinate));

    resultingCoordinate = points[3].MKCoordinateValue;
    expectedCoordinate = CLLocationCoordinate2DMake(49.2397226, 9.2559204);
    XCTAssertTrue(CLCOORDINATES_EQUAL2(resultingCoordinate, expectedCoordinate));

}

@end
