//
//  TourAnnotation.m
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TourAnnotation.h"

@interface TourAnnotation(){
    Tour* tour_;
}
@end

@implementation TourAnnotation


- (id)initWithTour:(Tour*)tour{
    self = [self init];
    if (self){
        tour_ = tour;
    }
    return self;
}

- (CLLocationCoordinate2D)coordinate {
    return CLLocationCoordinate2DMake([tour_ latitude], [tour_ longitude]);
}

- (NSString*)title {
    return [tour_ title];
}

- (NSString*)subtitle {
    return [tour_ subtitle];
}


- (CLLocationDegrees)longitude {
    return [tour_ longitude];
}

- (CLLocationDegrees)latitude {
    return [tour_ latitude];
}

@end
