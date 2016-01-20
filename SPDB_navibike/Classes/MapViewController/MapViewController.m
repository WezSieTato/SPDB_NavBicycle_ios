//
//  MapViewController.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 17.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "MapViewController.h"
#import "StationAnnotation.h"
#import "MKPolylineView+ColorPolyline.h"
#import "PointAnnotation.h"

@interface MapViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *startLabel;
@property (weak, nonatomic) IBOutlet UILabel *endLabel;
@property (weak, nonatomic) IBOutlet UIView *startView;
@property (weak, nonatomic) IBOutlet UIView *endView;

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

    rect = MKMapRectOffset(rect, 0.1f, 0.1f);
    
    for (SPDBStation *station in self.stations) {
        StationAnnotation *annotation = [StationAnnotation annotationWithStation:station];
        [self.mapView addAnnotation:annotation];
    }

    PointAnnotation *pointAnnotation = [PointAnnotation annotationWithPoint:self.start];
    pointAnnotation.title = @"Start";
    pointAnnotation.subtitle = self.startName;
    [self.mapView addAnnotation:pointAnnotation];

    pointAnnotation = [PointAnnotation annotationWithPoint:self.end];
    pointAnnotation.title = @"Koniec";
    pointAnnotation.subtitle = self.endName;
    [self.mapView addAnnotation:pointAnnotation];

    self.mapView.visibleMapRect = rect;
    self.navigationController.toolbarHidden = YES;

    self.startLabel.text = self.startName;
    self.endLabel.text = self.endName;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.toolbarHidden = NO;
}

#pragma mark - MKMapViewDelegate

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {

    if([overlay isKindOfClass:[ColorPolyline class]]) {
        return [[MKPolylineView alloc] initWithColorPolyline:(ColorPolyline *)overlay];
    }

    return nil;
}

@end
