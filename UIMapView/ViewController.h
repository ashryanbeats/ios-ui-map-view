//
//  ViewController.h
//  UIMapView
//
//  Created by Ash Ryan Arnwine on 1/17/16.
//  Copyright © 2016 Adobe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate> {
    
    CLLocationManager *locationManager;
    
}

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)changeMap:(id)sender;
- (IBAction)locateUser:(id)sender;
- (IBAction)getRoute:(id)sender;

@end

