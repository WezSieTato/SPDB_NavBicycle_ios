//
//  OpenRouteServiceParser.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 16.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "OpenRouteServiceResponseParser.h"

#import <XMLDictionary/XMLDictionary.h>
#import <MSAddition/NSString+MSAddition.h>
#import "NetworkingMacros.h"

@implementation OpenRouteServiceResponseParser

+ (NSArray<NSValue *> *)coordinatesFromResponse:(NSData *)response {
    NSMutableArray <NSValue *> * points = [NSMutableArray new];
    NSDictionary *dictionary = [NSDictionary dictionaryWithXMLData:response];
    NSArray <NSString *> *stringPoints = dictionary[@"xls:Response"][@"xls:DetermineRouteResponse"][@"xls:RouteGeometry"][@"gml:LineString"][@"gml:pos"];

    for (NSString * strPoint in stringPoints) {
        NSArray <NSString *> *coordinates = strPoint.ms_wordsArray;
        [points addObject:NSValueWithCoordinate(coordinates[1].floatValue, coordinates[0].floatValue)];
    }

    return [points copy];
}

@end
