//
//  NSArray+SPDBModel.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBModel.h"

@interface NSArray (SPDBModel)

+ (nonnull NSArray <id<SPDBModel>>*)arrayModelFromArrayDictionary:(NSArray <NSDictionary *>*)dictionariesArray
                                                        withClass:(Class)pClass;

@end
