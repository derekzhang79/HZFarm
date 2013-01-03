//
//  Factory.h
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EggModel;

@interface Factory : NSObject

+ (NSMutableArray *)process:(NSMutableArray *)materials;

+ (NSString*)processOne:(EggModel*)meterial;

@end
