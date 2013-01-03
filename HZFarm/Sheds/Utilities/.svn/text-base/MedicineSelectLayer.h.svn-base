//
//  MedicineSelectLayer.h
//  Sheds
//
//  Created by baijing on 4/15/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MedicineSelectDelegate.h"

typedef enum{
    red = 4,
    blue,
    green
}MedicineKind;

@interface MedicineSelectLayer : CCLayer {
    id<MedicineSelectDelegate> _delegate;
    
    NSMutableArray *_frames;
    
    NSInteger _currSelect;
    MedicineKind _needSelect;
}
@property (nonatomic, assign)id<MedicineSelectDelegate> _delegate;
@property (nonatomic, retain)NSMutableArray *_frames;
@property (nonatomic)NSInteger _currSelect;
@property (nonatomic)MedicineKind _needSelect;


- (id)initWithNeed:(NSInteger)need delegate:(id)delegate;

@end
