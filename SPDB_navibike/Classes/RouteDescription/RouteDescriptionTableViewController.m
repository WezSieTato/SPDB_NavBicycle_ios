//
//  RouteDescriptionTableViewController.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 18.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "RouteDescriptionTableViewController.h"
#import "StationTableViewCell.h"
#import "DistanceTableViewCell.h"
#import "SumTableViewCell.h"
#import "SPDBRoute+Additions.h"
#import "OpenRouteServiceRouteProvider.h"
#import "MapViewController.h"
#import "NetworkingMacros.h"
#import "UIViewController+HUD.h"

@interface RouteDescriptionTableViewController ()

@property (strong, nonatomic) OpenRouteServiceRouteProvider *routeProvider;

@property (strong, nonnull) ColorPolyline *startPolyline;
@property (strong, nonnull) ColorPolyline *bicyclePolyline;
@property (strong, nonnull) ColorPolyline *endPolyline;

@end

@implementation RouteDescriptionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Twoja trasa";

    self.routeProvider = [OpenRouteServiceRouteProvider new];
    
    NSArray* toolbarItems = [NSArray arrayWithObjects:
                             [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil],
                             [[UIBarButtonItem alloc] initWithTitle:@"Pokaż mape"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(showMapButtonTapped:)],
                             [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil],
                             nil];
    self.toolbarItems = toolbarItems;
    self.navigationController.toolbarHidden = NO;
    self.tableView.tableFooterView = [UIView new];
}

#pragma mark - UI events

- (void)showMapButtonTapped:(id)sender {
    [self.routeProvider resetCounter];
    [self showProgressHUD];

    __weak typeof(self) wSelf = self;

    if(self.route.costs.count) {
    [self.routeProvider getRouteWithLocations:[self startCoordinates]
                             routePreferences:OpenRouteServiceRoutePreferencesPedestrian
                        withCompletionHandler:^(NSArray<NSValue *> *route, OpenRouteServiceRoutePreferences preferences, NSError *error) {
                            if (error == nil) {
                                wSelf.startPolyline = [wSelf polylineWithCoordinates:route routePreferences:preferences];
                                [wSelf checkIsFetchingCompleted];
                            } else {
                                [wSelf showError:error];
                            }
                            
                        }];
    
    [self.routeProvider getRouteWithLocations:[self bicycleCoordinates]
                             routePreferences:OpenRouteServiceRoutePreferencesBicycle
                        withCompletionHandler:^(NSArray<NSValue *> *route, OpenRouteServiceRoutePreferences preferences, NSError *error) {
                            if (error == nil) {
                                wSelf.bicyclePolyline = [wSelf polylineWithCoordinates:route routePreferences:preferences];
                                [wSelf checkIsFetchingCompleted];
                            } else {
                                [wSelf showError:error];
                            }
                        }];
    
    [self.routeProvider getRouteWithLocations:[self endCoordinates]
                             routePreferences:OpenRouteServiceRoutePreferencesPedestrian
                        withCompletionHandler:^(NSArray<NSValue *> *route, OpenRouteServiceRoutePreferences preferences, NSError *error) {
                            if (error == nil) {
                                wSelf.endPolyline = [wSelf polylineWithCoordinates:route routePreferences:preferences];
                                [wSelf checkIsFetchingCompleted];
                            } else {
                                [wSelf showError:error];
                            }
                        }];
    } else {
        [self.routeProvider getRouteWithLocations:[self onlyPedestrianCoordinates]
                                 routePreferences:OpenRouteServiceRoutePreferencesPedestrian
                            withCompletionHandler:^(NSArray<NSValue *> *route, OpenRouteServiceRoutePreferences preferences, NSError *error) {
                                if (error == nil) {
                                    ColorPolyline *polyline = [wSelf polylineWithCoordinates:route routePreferences:preferences];
                                    [wSelf showMapWithPolyline:@[polyline]];
                                } else {
                                    [wSelf showError:error];
                                }
                            }];
    }
}

- (NSArray <NSValue *> *)onlyPedestrianCoordinates {
    return @[
             [NSValue valueWithMKCoordinate:self.route.start.coordinate],
             [NSValue valueWithMKCoordinate:self.route.end.coordinate]
             ];
}

- (NSArray <NSValue *> *)startCoordinates {
    return @[
             [NSValue valueWithMKCoordinate:self.route.start.coordinate],
             [NSValue valueWithMKCoordinate:self.route.stations.firstObject.coordinate]
             ];
}

- (NSArray <NSValue *> *)endCoordinates {
    return @[
             [NSValue valueWithMKCoordinate:self.route.stations.lastObject.coordinate],
             [NSValue valueWithMKCoordinate:self.route.end.coordinate]
             ];
}

- (NSArray <NSValue *> *)bicycleCoordinates {
    NSMutableArray <NSValue *>* coordinates = [NSMutableArray new];
    
    for (SPDBStation *station in self.route.stations) {
        [coordinates addObject:[NSValue valueWithMKCoordinate:station.coordinate]];
    }
    return [coordinates copy];
}

- (ColorPolyline *)polylineWithCoordinates: (NSArray <NSValue *> *)coordinateValues routePreferences:(OpenRouteServiceRoutePreferences)preferences {
    NSUInteger count = coordinateValues.count;
    CLLocationCoordinate2D coordinates[count];
    
    for (NSUInteger i = 0; i < count; ++i) {
        coordinates[i] = coordinateValues[i].MKCoordinateValue;
    }
    
    ColorPolyline *polyline = [ColorPolyline polylineWithCoordinates:coordinates count:count];
    UIColor *color = preferences == OpenRouteServiceRoutePreferencesBicycle ? [UIColor blueColor] : [UIColor redColor];
    polyline.color = color;
    return polyline;
    
}

- (void)checkIsFetchingCompleted {
    if (self.routeProvider.finishedTasks == 3) {
        [self showMapWithPolyline: @[self.startPolyline, self.bicyclePolyline, self.endPolyline]];
    }
}

- (void)showMapWithPolyline:(NSArray <ColorPolyline *> *)polylines {
    [self removeProgressHUD];
    MapViewController *viewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    viewController.colorPolylines = polylines;
    viewController.stations = self.route.stations;
    viewController.start = self.route.start;
    viewController.end = self.route.end;
    viewController.startName = self.startName;
    viewController.endName = self.endName;
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return section == 0 ? self.route.stations.count + self.route.costs.count : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 1) {
        //Sum
        SumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SumTableViewCell" forIndexPath:indexPath];
        [cell configureWithCost:self.route.totalCosts];
        return cell;
    } else {
        NSUInteger row = indexPath.row;
        NSUInteger inRow = row / 2;
        if (row % 2) {
            //Cost;
            DistanceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DistanceTableViewCell" forIndexPath:indexPath];
            [cell configureWithCost:self.route.costs[inRow]];
            return cell;
        } else {
            //Station
            StationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StationTableViewCell" forIndexPath:indexPath];
            [cell configureWithStation:self.route.stations[inRow]];
            return cell;
        }
    }

}

@end
