//
//  Product.h
//  MapTest
//
//  Created by Any on 12-4-28.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "ShedsViewServer.h"

@interface Product : CCSprite {
    id<ShedsViewServer> _shedsViewServer;
    NSString *_name;
}

@property(nonatomic, retain)NSString *_name;
@property(nonatomic, assign)id<ShedsViewServer> _shedsViewServer;


@end
