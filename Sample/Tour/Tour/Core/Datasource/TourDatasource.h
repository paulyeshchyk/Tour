//
//  TourDatasource.h
//  Tour
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tour.h"

@interface TourDatasource : NSObject
+(TourDatasource*) sharedInstance;
+(TourDatasource*) fakeSharedInstance;

- (NSArray*)tours;
- (NSUInteger) numberOfTours;
- (Tour*) tourAtIndex:(NSUInteger)tourAtIndex;
@end
