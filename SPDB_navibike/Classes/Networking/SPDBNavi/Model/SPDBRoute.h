//
//  SPDBRoute.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SPDBStation.h"

@interface SPDBRoute : NSObject <SPDBModel>

@property (nonatomic, nonnull, strong) SPDBPoint *start;
@property (nonatomic, nonnull, strong) SPDBPoint *end;

@property (nonatomic, nonnull, strong) NSArray <SPDBStation *> *stations;
@property (nonatomic, nonnull, strong) NSArray <NSNumber *> *costs;

@end
