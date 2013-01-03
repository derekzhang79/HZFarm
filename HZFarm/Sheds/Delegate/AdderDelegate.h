//
//  AdderDelegate.h
//  Sheds
//
//  Created by Any on 12-4-1.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AdderDelegate <NSObject>

- (void)addPoultry:(NSInteger)type position:(CGPoint)pos;

@end
