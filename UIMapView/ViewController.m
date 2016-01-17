//
//  ViewController.m
//  UIMapView
//
//  Created by Ash Ryan Arnwine on 1/17/16.
//  Copyright © 2016 Adobe. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.mapView.delegate = self;
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    
    // Add region and zoom
    MKCoordinateRegion region = {{0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = 40.7828647;
    region.center.longitude = -73.96535510000001;
    region.span.latitudeDelta = 0.18f;
    region.span.longitudeDelta = 0.18f;
    [self.mapView setRegion:region animated:YES];
    
    // Add annotation
    MapPin *annotation = [[MapPin alloc] init];
    annotation.title = @"Central Park";
    annotation.subtitle = @"New York City";
    annotation.coordinate = region.center;
    [self.mapView addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeMap:(id)sender {
    
    switch (self.segmentedControl.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            break;
        
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            break;
            
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
    
}

- (IBAction)locateUser:(id)sender {
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    [locationManager startUpdatingLocation];
    
    self.mapView.showsUserLocation = YES;
    
}

- (IBAction)getRoute:(id)sender {
    
    NSString *urlString = @"http://maps.apple.com/maps?daddr=40.7828647,-73.96535510000001";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString]];
    
}
@end
