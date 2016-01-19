//
//  SelectPlaceViewTests.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 19.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import "SelectPlaceView.h"

@interface SelectPlaceViewTests : FBSnapshotTestCase

@end

@implementation SelectPlaceViewTests

- (UIView *)view {
    SelectPlaceView* view = [SelectPlaceView new];
    view.frame = CGRectMake(0, 0, 200, 50);
    return view;
}
- (void)testView {
    FBSnapshotVerifyView([self view], nil);
}

@end
