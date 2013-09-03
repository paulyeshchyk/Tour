//
//  MapViewController.m
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "MapViewController.h"
#import "TourAnnotation.h"

@interface MapViewController () <MKMapViewDelegate>{
    UIPopoverController* popoverViewController_;
    IBOutlet MKMapView* mapView_;
}

@end

@implementation MapViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Map";
    UISearchBar* searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0,0,200,32)];
//    [searchBar setShowsScopeBar:YES];
//    [searchBar setScopeButtonTitles:@[@"Opt1",@"Opt2"]];
    UIBarButtonItem* searchBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
    UIBarButtonItem* popoverButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(onPopoverButtonClick:)];
    
    [self.navigationItem setRightBarButtonItems:@[popoverButtonItem,searchBarButtonItem]];
    
    [self reloadMapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)reloadMapView {
    if ([self isViewLoaded]){
        [mapView_ removeAnnotations:mapView_.annotations];

        NSMutableArray* annotationsArray = [NSMutableArray new];
        NSUInteger annotationsCount = [self.delegate numberOfAnnotations];
        for(NSUInteger i = 0;i<annotationsCount;i++) {
            id<MKAnnotation> annotation = [self.delegate annotationAtIndex:i];
            [annotationsArray addObject:annotation];
        }
        [mapView_ addAnnotations:annotationsArray];
        
        
        [self testZoom];
    }

}

- (void)setDelegate:(id<MapViewControllerDelegateProtocol>)delegate {
    _delegate = delegate;
    [self reloadMapView];
}

#pragma mark -

- (void)onPopoverButtonClick:(id)sender {
    if (!popoverViewController_){
        popoverViewController_ = [[UIPopoverController alloc] initWithContentViewController:[[UIViewController alloc] init]];
    }
    [popoverViewController_ presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}


- (void)testZoom {
    double maxlatitude = [[mapView_.annotations valueForKeyPath:@"@max.latitude"] doubleValue];
    double minlatitude = [[mapView_.annotations valueForKeyPath:@"@min.latitude"] doubleValue];
    double maxlongitude = [[mapView_.annotations valueForKeyPath:@"@max.longitude"] doubleValue];
    double minlongitude = [[mapView_.annotations valueForKeyPath:@"@min.longitude"] doubleValue];

    CLLocationCoordinate2D  points[4];
    points[0] = CLLocationCoordinate2DMake(minlatitude-0.00001*minlatitude, minlongitude-0.00001*minlongitude);
    points[1] = CLLocationCoordinate2DMake(minlatitude-0.00001*minlatitude, maxlongitude+0.00001*maxlongitude);
    points[2] = CLLocationCoordinate2DMake(maxlatitude+0.00001*maxlatitude, maxlongitude+0.00001*maxlongitude);
    points[3] = CLLocationCoordinate2DMake(maxlatitude+0.00001*maxlatitude, minlongitude-0.00001*minlongitude);
    MKPolygon* polygon = [MKPolygon polygonWithCoordinates:points count:4];

    [mapView_ addOverlay:polygon];
    
    CLLocationCoordinate2D location = CLLocationCoordinate2DMake((maxlatitude+minlatitude)/2,(maxlongitude+minlongitude)/2);
    MKCoordinateSpan span = MKCoordinateSpanMake((maxlatitude-minlatitude), (maxlongitude-minlongitude));
    MKCoordinateRegion region = MKCoordinateRegionMake(location, span);
    [mapView_ setRegion:region];
}

#pragma mark - MKMapViewDelegate MKAnnotationView

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    if ([overlay isKindOfClass:[MKPolygon class]])
    {
        MKPolygonView* polygonView = [[MKPolygonView alloc] initWithPolygon:overlay];
        polygonView.fillColor = [[UIColor cyanColor] colorWithAlphaComponent:0.2];
        polygonView.strokeColor = [[UIColor blueColor] colorWithAlphaComponent:0.7];
        polygonView.lineWidth = 3;
        
        return polygonView;
    }
    
    return nil;
}
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
    static NSString* const kAnnotationIdentifier =@"TourAnnotationViewId";
    MKAnnotationView* result = [mapView_ dequeueReusableAnnotationViewWithIdentifier:kAnnotationIdentifier];
    if (!result ){
        result = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:kAnnotationIdentifier];
    } else {
        result.annotation = annotation;
    }
    result.draggable = YES;
    result.canShowCallout = YES;
    return result;
}

@end
