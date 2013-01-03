//
//  Product.m
//  MapTest
//
//  Created by Any on 12-4-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Product.h"


@implementation Product

@synthesize _name;
@synthesize _shedsViewServer;

- (void)getProductData:(id)sender
{
    [self._shedsViewServer getProductData:self];
}

@end
