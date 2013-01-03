//
//  DAMagicInHenHouse.h
//  MapTest
//
//  Created by liwensheng on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DAMagicInHenHouse : NSObject
{
    NSString* tID;
    NSString *magicID;
    NSString *henHouseID;
   // NSString *magicCategory;//影响类别 相同不能叠加影响，不相同可以叠加
   // int  nMagicLevel;
}
@property(nonatomic,retain) NSString* tID;
@property(nonatomic,retain) NSString *magicID;
@property(nonatomic,retain) NSString *henHouseID;
//@property(nonatomic,retain) NSString *magicCategory;//影响类别 相同不能叠加影响，不相同可以叠加
//@property   int  nMagicLevel;
@end
