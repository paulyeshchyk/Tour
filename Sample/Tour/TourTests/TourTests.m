//
//  TourTests.m
//  TourTests
//
//  Created by Pavel Yeshchyk on 8/30/13.
//  Copyright (c) 2013 Pavel Yeshchyk. All rights reserved.
//

#import "TourTests.h"

#import <SenTestingKit/SenTestingKit.h>
#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>
#import "RootViewController.h"
#import "Tour.h"
@implementation TourTests

- (void)setUp {
    [super setUp];

    // Set-up code here.
}

- (void)tearDown {
    // Tear-down code here.

    [super tearDown];
}

- (void)testInitTour {
    Tour* tour = [[Tour alloc] initWithLatitude:43.12 longitude:12.43];
    assertThat(tour.title,is(nilValue()));
    assertThat(tour.subtitle,is(nilValue()));
    assertThatDouble(tour.latitude,equalToDouble(43.12));
    assertThatDouble(tour.longitude,equalToDouble(12.43));
}

- (void)testInitTourWithTitleAndSubtitle {
    Tour* tour = [[Tour alloc] initWithTitle:@"Title1" subTitle:@"SubTitle2" latitude:43.12 longitude:12.43];
    assertThat(tour.title,is(equalTo(@"Title1")));
    assertThat(tour.subtitle,is(equalTo(@"SubTitle2")));
    assertThatDouble(tour.latitude,equalToDouble(43.12));
    assertThatDouble(tour.longitude,equalToDouble(12.43));
}

@end
