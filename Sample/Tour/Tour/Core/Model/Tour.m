//
//  Tour.m
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "Tour.h"

@implementation Tour
@synthesize latitude;
@synthesize longitude;

- (id)initWithLatitude:(CLLocationDegrees)alatitude longitude:(CLLocationDegrees)alongitude {
    self = [super init];
    if (self){
        _title  = nil;
        _subtitle = nil;
        latitude = alatitude;
        longitude = alongitude;
    }
    return self;
}

- (id)initWithTitle:(NSString*)title subTitle:(NSString*)subTitle latitude:(CLLocationDegrees)alatitude longitude:(CLLocationDegrees)alongitude {
    self = [self initWithLatitude:alatitude longitude:alongitude];
    if (self){
        _title  = title;
        _subtitle = subTitle;
    }
    return self;
}


@end
