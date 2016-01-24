//
//  SelectPlaceView.m
//  SPDB_navibike
//
//  Created by Marcin Stepnowski on 14.01.2016.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "SelectPlaceView.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CSNotificationView/CSNotificationView.h>
#import <MSAddition/UIView+MSAddition.h>

@interface SelectPlaceView () <GMSAutocompleteViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeholderLabel;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UIButton *smallButton;

@property (strong, nonatomic) GMSPlacesClient *client;
@property (nonatomic, strong) GMSPlace *place;
@property (strong, nonatomic) GMSAutocompleteViewController *autocompleteViewController;

@end

@implementation SelectPlaceView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    UIView *view =  [[[NSBundle mainBundle] loadNibNamed:@"SelectPlaceView"
                                                   owner:self
                                                 options:nil] objectAtIndex:0];
    [self ms_addSubviewWithFitToParentConstraints:view];
    
    self.client = [[GMSPlacesClient alloc] init];}

-(void)awakeFromNib {
    [super awakeFromNib];
    self.placeholderText = self.addressLabel.text;
    [self setSearchActive:NO];
    
    self.layer.cornerRadius = 5.0f;
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = self.placeholderLabel.textColor.CGColor;
    self.clipsToBounds = YES;
}

#pragma mark - Properties

- (CLLocationCoordinate2D)coordinate {
    return self.place.coordinate;
}

- (BOOL)isValidPlace:(GMSPlace *)place {
    return [place.formattedAddress containsString:@"Warszawa"];
}

-(void)setPlace:(GMSPlace *)place {
    _place = place;
    self.addressLabel.text = place.name;
    self.addressLabel.hidden = NO;
    self.placeholderLabel.hidden = YES;
}

-(void)setPlaceholderText:(NSString *)placeholderText {
    self.placeholderLabel.text = placeholderText;
}

-(NSString *)placeholderText {
    return self.placeholderLabel.text;
}

-(BOOL)isValidCoordinate {
    return self.place;
}

-(NSString *)text {
    return self.addressLabel.text;
}

#pragma mark - UI Events

- (IBAction)bigButtonTapped:(id)sender {
    GMSAutocompleteViewController *acController = [[GMSAutocompleteViewController alloc] init];
    acController.delegate = self;
    GMSAutocompleteFilter *filter = [[GMSAutocompleteFilter alloc] init];
    filter.type = kGMSPlacesAutocompleteTypeFilterAddress;
    filter.country = @"PL";
    acController.autocompleteFilter = filter;
    acController.autocompleteBounds = [[GMSCoordinateBounds alloc] initWithCoordinate:CLLocationCoordinate2DMake(52.281389, 21.097092)
                                                                           coordinate:CLLocationCoordinate2DMake(52.172902, 20.944608)];
    self.autocompleteViewController = acController;
    [self.navigationController pushViewController:acController animated:YES];
}

- (IBAction)smallButtonTapped:(id)sender {
    [self setSearchActive:YES];
    
    [self.client currentPlaceWithCallback:^(GMSPlaceLikelihoodList *likelihoodList, NSError *error) {
        [self setSearchActive:NO];

        if (error != nil) {
            NSLog(@"Current Place error %@", [error localizedDescription]);
            return;
        }
        
        for (GMSPlaceLikelihood *likelihood in likelihoodList.likelihoods) {
            GMSPlace* place = likelihood.place;
            if ([self isValidPlace:place]) {
                self.place = place;
                break;
            }
        }
        [self showPlaceError];
    }];
}

- (void)setSearchActive:(BOOL)active {
    self.smallButton.hidden = active;
    self.indicator.hidden = !active;
}

#pragma mark - GMSAutocompleteViewControllerDelegate

- (void)viewController:(GMSAutocompleteViewController *)viewController didAutocompleteWithPlace:(GMSPlace *)place {
    // Do something with the selected place.
    NSLog(@"Place name %@", place.name);
    NSLog(@"Place address %@", place.formattedAddress);
    NSLog(@"Place attributions %@", place.attributions.string);
    
    if([self isValidPlace:place]) {
        self.place = place;
    } else {
        [self showPlaceError];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewController:(GMSAutocompleteViewController *)viewController didAutocompleteWithError:(NSError *)error {
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"Error: %@", [error description]);
}

- (void)viewController:(GMSAutocompleteViewController *)viewController didFailAutocompleteWithError:(NSError *)error {
    NSLog(@"Error: %@", [error description]);
}

- (void)wasCancelled:(GMSAutocompleteViewController *)viewController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showPlaceError {
    [CSNotificationView showInViewController:self.autocompleteViewController
                                       style:CSNotificationViewStyleError
                                     message:@"Wybrane miejsce jest poza Warszawą!"];
}

@end
