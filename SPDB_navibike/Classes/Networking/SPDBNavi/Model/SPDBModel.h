//
//  SPDBModel.h
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SPDBModel <NSObject>

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
