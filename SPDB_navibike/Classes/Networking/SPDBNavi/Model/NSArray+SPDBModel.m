//
//  NSArray+SPDBModel.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "NSArray+SPDBModel.h"
#import "SPDBModel.h"

@implementation NSArray (SPDBModel)

+ (NSArray <SPDBModel> *)arrayModelFromArrayDictionary:(NSArray <NSDictionary *> *)dictionariesArray
                                             withClass:(Class)pClass {
    
    NSMutableArray <id<SPDBModel>> *mutableArray = [NSMutableArray new];
    for (NSDictionary *dictionary in dictionariesArray) {
        [mutableArray addObject:[[pClass alloc] initWithDictionary:dictionary]];
    }
    return [mutableArray copy];
}


@end
