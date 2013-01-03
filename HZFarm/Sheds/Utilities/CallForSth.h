//
//  CallForSth.h
//  Sheds
//
//  Created by Any on 12-4-11.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "CallForSthDelegate.h"
#import "MedicineSelectDelegate.h"

typedef enum{
    harvest = 0,
    lay = 1,
    food = 2,
    water = 3,
    medicineRed = 4,
    medicineBlue = 5,
    medicineGreen = 6
}NeedType;

@interface CallForSth : CCNode<MedicineSelectDelegate> {
    id<CallForSthDelegate> _delegate;
    CCSprite *_bubbleSp;
    CCSprite *_contentSp;
    NeedType _type;
}

@property (nonatomic, assign)id<CallForSthDelegate> _delegate;
@property (nonatomic, retain)CCSprite *_bubbleSp;
@property (nonatomic, retain)CCSprite *_contentSp;
@property (nonatomic)NeedType _type;

- (id)initWithType:(NeedType)type delegate:(id)delegate;

- (void)onTouched;

@end
