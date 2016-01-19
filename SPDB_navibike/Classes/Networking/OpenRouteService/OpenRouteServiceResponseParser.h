//
//  OpenRouteServiceResponseParser.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 16.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenRouteServiceResponseParser : NSObject

+ (NSArray <NSValue *> *)coordinatesFromResponse:(NSData *)response;

@end
