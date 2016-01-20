//
//  RouteAddressesViewController.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 13.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "RouteAddressesViewController.h"
#import "SelectPlaceView.h"
#import "SPDBRouteProvider.h"
#import "RouteDescriptionTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "UIViewController+HUD.h"

@interface RouteAddressesViewController ()

@property (weak, nonatomic) IBOutlet SelectPlaceView *fromPlaceView;
@property (weak, nonatomic) IBOutlet SelectPlaceView *toPlaceView;

@property (strong, nonatomic) CLLocationManager *locationManager;

@end

@implementation RouteAddressesViewController

-(void)viewDidLoad {
    [self.locationManager requestAlwaysAuthorization];
    [self.locationManager requestWhenInUseAuthorization];
    
    self.fromPlaceView.navigationController = self.navigationController;
    self.toPlaceView.navigationController = self.navigationController;
    
    self.fromPlaceView.placeholderText = @"From";
    self.toPlaceView.placeholderText = @"To";
    
    NSArray* toolbarItems = [NSArray arrayWithObjects:
                             [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil],
                             [[UIBarButtonItem alloc] initWithTitle:@"Wyznacz trase"
                                                              style:UIBarButtonItemStylePlain
                                                             target:self
                                                             action:@selector(computeRouteTapped:)],
                             [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                                                           target:nil
                                                                           action:nil],
                             nil];
    self.toolbarItems = toolbarItems;
    self.navigationController.toolbarHidden = NO;
}

- (IBAction)computeRouteTapped:(id)sender {
    NSLog(@"Compute route tapped");
    if(self.fromPlaceView.isValidCoordinate && self.toPlaceView.isValidCoordinate) {
        SPDBRouteProvider *provider = [SPDBRouteProvider new];
        [self showProgressHUD];
        [provider getRouteWithStartLocation:self.fromPlaceView.coordinate
                             andEndLocation:self.toPlaceView.coordinate
                      withCompletionHandler:^(SPDBRoute *route, NSError *error) {
                          if(error == nil) {
                              [self removeProgressHUD];
                              RouteDescriptionTableViewController *viewController =
                                      [self.storyboard instantiateViewControllerWithIdentifier:@"RouteDescriptionTableViewController"];
                              viewController.route = route;
                              viewController.startName = self.fromPlaceView.text;
                              viewController.endName = self.toPlaceView.text;

                              [self.navigationController pushViewController:viewController animated:YES];
                          } else {
                              [self showError:error];
                          }
                      }];

    } else {
        [self showErrorMessage:@"Musisz podać trase!"];
    }
}

@end
