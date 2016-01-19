//
//  MapViewController.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 17.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "MapViewController.h"
#import "StationAnnotation.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Mapa";
    self.mapView.delegate = self;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    MKMapRect rect = self.colorPolylines.firstObject.boundingMapRect;
    for (ColorPolyline *polyline in self.colorPolylines) {
        [self.mapView addOverlay: polyline];
        rect = MKMapRectUnion(rect, polyline.boundingMapRect);
    }
    
    for (SPDBStation *station in self.stations) {
        StationAnnotation *annotation = [StationAnnotation annotationWithStation:station];
        [self.mapView addAnnotation:annotation];
    }
    
    self.mapView.visibleMapRect = rect;
    self.navigationController.toolbarHidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navigationController.toolbarHidden = NO;
}

#pragma mark - MKMapViewDelegate

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {

    if([overlay isKindOfClass:[ColorPolyline class]]) {
        return [[MKPolylineView alloc] initWithPolyline:(ColorPolyline *)overlay];
    }

    return nil;
}

@end
