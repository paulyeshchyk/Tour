//
//  Tour.h
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Tour : NSObject 
@property (nonatomic, strong)NSString* title;
@property (nonatomic, strong)NSString* subtitle;
@property (nonatomic, assign)CLLocationDegrees latitude;
@property (nonatomic, assign)CLLocationDegrees longitude;
- (id)initWithTitle:(NSString*)title subTitle:(NSString*)subTitle latitude:(CLLocationDegrees)latitude longitude:(CLLocationDegrees)longitude;
@end
