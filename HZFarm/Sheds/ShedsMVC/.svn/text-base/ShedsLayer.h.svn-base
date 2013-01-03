//
//  HelloWorldLayer.h
//  Sheds
//
//  Created by Any on 12-3-28.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

#import "cocos2d.h"
#import "ShedsDelegate.h"
#import "ShedsViewServer.h"
#import "WarningDialogDelegate.h"
#import "FactoryAnimDelegate.h"
#import "StateDialogDelegate.h"
#import "Product.h"

@class ShedsModel;
@class ChickView;
@class SiLiaoChi;
@class EggModel;

@interface ShedsLayer : CCLayer<ShedsViewServer, WarningDialogDelegate, FactoryAnimDelegate, StateDialogDelegate>
{
    CCSprite *_bg;//背景图片
    ShedsModel *_model;
    id<ShedsViewDelegate> _delegate;
    
    CCLabelTTF *scoreLabel;     // 分数
    CCLabelTTF *coinLabel;      // 金钱数
    CCLabelTTF *chickNum;
    CCLabelTTF *maxChickNum;
    CCLabelTTF *shedsLevel;
    CCMenuItemImage *factory;
    CCMenuItemImage *storeHouse;
    
    SiLiaoChi *_shiCao;
    SiLiaoChi *_shuiCao;
    CCSprite *score;
    
    NSMutableDictionary *_poultryStateSprites; //解锁状态栏精灵
    NSMutableArray *_poultryViews;
    NSMutableArray *_fences;
    NSMutableArray *_eggViews;
    NSMutableArray *_products;
}

@property (nonatomic, retain)ShedsModel *_model;
@property (nonatomic, retain)id<ShedsViewDelegate> _delegate;
@property (nonatomic, retain)NSMutableArray *_poultryViews;
@property (nonatomic, retain)NSMutableArray *_eggViews;
@property (nonatomic, retain)NSMutableArray *_products;

@property (nonatomic, retain)SiLiaoChi *_shiCao;
@property (nonatomic, retain)SiLiaoChi *_shuiCao;

@property (nonatomic, retain)NSMutableDictionary *_poultryStateSprites; //解锁状态栏精灵

@property (nonatomic, retain)NSMutableArray *_fences;

- (id)initWithModel:(ShedsModel *)model delegate:(id)aDelegate;

- (void)ReadyToAddPoultry:(CGPoint)touchPos;

+(CCScene *) scene;

@end
