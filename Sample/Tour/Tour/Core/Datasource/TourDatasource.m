//
//  TourDatasource.m
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TourDatasource.h"
@interface TourDatasource(){
    NSMutableArray* fakeTours_;
}
@end

@implementation TourDatasource
+(TourDatasource*) sharedInstance {
    
    static dispatch_once_t pred;
    static TourDatasource *instance_ = nil;
    
    dispatch_once(&pred, ^{ instance_ = [[self alloc] init]; });
    return instance_;
}

+(TourDatasource*) fakeSharedInstance {
    
    static dispatch_once_t pred;
    static TourDatasource *instance_ = nil;
    
    dispatch_once(&pred, ^{ instance_ = [[self alloc] initWithFakeData]; });
    return instance_;
}

double rando(double x){
    int modu = arc4random() % 100;
    double result =x+modu/10000.0f;
    return result;

}

- (id)initWithFakeData {
    self = [super init];
    if (self){
        double lat = 53.6683597;
        double lon = 23.8299957;
        fakeTours_ = [NSMutableArray new];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title1" subTitle:@"Subtitle1" latitude:rando(lat) longitude:rando(lon)]];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title2" subTitle:@"Subtitle2" latitude:rando(lat) longitude:rando(lon)]];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title3" subTitle:@"Subtitle3" latitude:rando(lat) longitude:rando(lon)]];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title4" subTitle:@"Subtitle4" latitude:rando(lat) longitude:rando(lon)]];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title5" subTitle:@"Subtitle5" latitude:rando(lat) longitude:rando(lon)]];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title6" subTitle:@"Subtitle6" latitude:rando(lat) longitude:rando(lon)]];
        [fakeTours_ addObject:[[Tour alloc] initWithTitle:@"Title7" subTitle:@"Subtitle7" latitude:rando(lat) longitude:rando(lon)]];
    }
    return self;
}

- (NSArray*)tours {
    return fakeTours_;
}

- (NSUInteger) numberOfTours {
    return [fakeTours_ count];
}

- (Tour*) tourAtIndex:(NSUInteger)tourAtIndex {
    return [fakeTours_ objectAtIndex:tourAtIndex];
}

@end
