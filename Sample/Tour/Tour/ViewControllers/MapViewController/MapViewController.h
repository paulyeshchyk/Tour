//
//  MapViewController.h
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@protocol MapViewControllerDelegateProtocol
@required

- (NSUInteger)numberOfAnnotations;
- (id<MKAnnotation>)annotationAtIndex:(NSUInteger)index;
@end

@interface MapViewController : UIViewController
@property (nonatomic, weak)id<MapViewControllerDelegateProtocol> delegate;
- (void)reloadMapView;
@end
