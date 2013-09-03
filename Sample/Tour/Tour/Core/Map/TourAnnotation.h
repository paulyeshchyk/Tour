//
//  TourAnnotation.h
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Tour.h"

@interface TourAnnotation : NSObject <MKAnnotation>
- (id)initWithTour:(Tour*)tour;
- (CLLocationDegrees)longitude;
- (CLLocationDegrees)latitude;
@end
