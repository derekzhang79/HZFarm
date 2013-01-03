//
//  HelloWorldLayer.m
//  Sheds
//
//  Created by Any on 12-3-28.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import "ShedsLayer.h"
#import "ShedsModel.h"
#import "AddPoultrys.h"
#import "MenuLogoOP.h"
#import "ChickView.h"
#import "SiLiaoChi.h"
#import "ShedsTerrain.h"
#import "WarningDialog.h"
#import "PoultryModel.h"
#import "EggModel.h"
#import "EggView.h"
#import "Factory.h"
#import "FactoryAnim.h"
#import "DAPlayerService.h"
#import "StateDialog.h"

#import "WorldLayer.h"
#import "Firstlayermenu.h"
#import "WareHouseLayer.h"


@implementation ShedsLayer

@synthesize _model;
@synthesize _delegate;
@synthesize _poultryViews;
@synthesize _shiCao;
@synthesize _shuiCao;
@synthesize _poultryStateSprites;
@synthesize _fences;
@synthesize _eggViews;
@synthesize _products;

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	ShedsLayer *layer = [ShedsLayer node];
	[scene addChild: layer];
	return scene;
}


-(id) initWithModel:(ShedsModel *)model delegate:(id)aDelegate
{
	if( (self=[super init])) {
        
        self._model = model;
        self._model._delegate = self;
        self._delegate = aDelegate;
        
        //CGSize size = [[CCDirector sharedDirector] winSize];
        
        //初始化背景
        _bg = [CCSprite spriteWithFile:@"底图.png"];
        _bg.position = CGPointZero;
        _bg.anchorPoint = CGPointZero;
        [self addChild:_bg z:0];
        
        //----------------------------------------------下面一段是屏幕上方的标题栏----------------------------------------------------------
        
        //经验logo
        CCSprite *scoreLogo = [CCSprite spriteWithFile:@"star.png"];
        scoreLogo.position = ccp(165, 710);
        scoreLogo.anchorPoint = ccp(0.5, 0.5);
        [self addChild:scoreLogo z:3];
        
        
        //经验等级
        shedsLevel = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", [DAPlayerService sharePlayerService].playerEntity.nLevel] charMapFile:@"experience_numeral.png" itemWidth:28 itemHeight:33 startCharMap:'0'];
        shedsLevel.position = ccp(162, 710);
        shedsLevel.anchorPoint = ccp(0.5, 0.5);
        [self addChild:shedsLevel z:4];
        
        //经验条
        CCSprite *score1 = [CCSprite spriteWithFile:@"experience_1.png"];
        score1.position = ccp(260, 710);
        score1.anchorPoint = ccp(0.5, 0.5);
        [self addChild:score1 z:2];
        
        score = [CCSprite spriteWithFile:@"experience_0.png"];
        score.position = ccp(260, 710);
        score.anchorPoint = ccp(0.5, 0.5);
        score.scaleX = 0;
        [self addChild:score z:2];
        
        
        
        //金币logo
        CCSprite *coinsLogo = [CCSprite spriteWithFile:@"gold.png"];
        coinsLogo.position = ccp(440, 710);
        coinsLogo.anchorPoint = ccp(0.5, 0.5);
        [self addChild:coinsLogo z:3];
        
        //金币文本框
        CCSprite *coins = [CCSprite spriteWithFile:@"numBar.png"];
        coins.position = ccp(540, 710);
        coins.anchorPoint = ccp(0.5, 0.5);
        [self addChild:coins z:2];
        
        //金币数量
        coinLabel = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", self._model._money] charMapFile:@"gold_number.png" itemWidth:17 itemHeight:19 startCharMap:'0'];
        coinLabel.position = ccp(600, 710);
        coinLabel.anchorPoint = ccp(1, 0.5);
        [self addChild:coinLabel z:3];
        
        //养鸡数量
        CCSprite *chicken = [CCSprite spriteWithFile:@"chickens.png"];
        chicken.position = ccp(815, 710);
        chicken.anchorPoint = ccp(0.5, 0.5);
        [self addChild:chicken z:2];
        
        chickNum = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", [self._model._poultryModels count]] charMapFile:@"housenumbuer.png" itemWidth:23 itemHeight:26 startCharMap:'0'];
        chickNum.position = ccp(830, 710);
        chickNum.anchorPoint = ccp(1, 0.5);
        [self addChild:chickNum z:3];
        
        CCSprite *segment = [CCSprite spriteWithFile:@"chickens_numbuer1.png"];
        segment.position = ccp(835, 710);
        segment.anchorPoint = ccp(0, 0.5);
        [self addChild:segment z:3];
        
        maxChickNum = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", self._model._maxPoultryNum] charMapFile:@"housenumbuer.png" itemWidth:23 itemHeight:26 startCharMap:'0'];
        maxChickNum.position = ccp(855, 710);
        maxChickNum.anchorPoint = ccp(0, 0.5);
        [self addChild:maxChickNum z:3];
        
        //购买金币
        CCMenuItemImage *addCoins = [CCMenuItemImage itemFromNormalImage:@"plus_button_0.png" selectedImage:@"plus_button_1.png" target:self selector:@selector(buyCoins:)];
        
        
        //初始化上部界面
        CCMenu *menu_up = [CCMenu menuWithItems:addCoins, nil]; 
        menu_up.position = ccp(630, 710);
        [menu_up alignItemsHorizontallyWithPadding:210];
        [self addChild:menu_up z:3];
        
        //----------------------------------------------下面一段是解锁状态栏----------------------------------------------------------
        
        self._poultryStateSprites = [[NSMutableDictionary alloc] initWithCapacity:8];
        for (int i=1; i<=8; i++) {
            NSString *picName = [NSString stringWithFormat:@"chickensbutton_%d_0.png", i];
            CCSprite *sp = [CCSprite spriteWithFile:picName];
            //            sp.position = ccp(60+(i-1)*(sp.contentSize.width+2), 50);
            sp.anchorPoint = ccp(0.5, 0.5);
            BOOL isUnLocked = [[self._model._unlockedStates objectForKey:[NSString stringWithFormat: @"poultry%d", i]] boolValue];
            if (isUnLocked == NO) {
                sp.color = ccc3(128, 128, 128);
            }
            [self._poultryStateSprites setObject:sp forKey:[NSString stringWithFormat: @"poultry%d", i]];
            [self addChild:sp z:3];
        }
        CCSprite *sp1 = [self._poultryStateSprites objectForKey:@"poultry1"];
        sp1.position = ccp(60,50);
        CCSprite *sp2 = [self._poultryStateSprites objectForKey:@"poultry2"];
        sp2.position = ccp(135,50);
        CCSprite *sp3 = [self._poultryStateSprites objectForKey:@"poultry3"];
        sp3.position = ccp(210,50);
        CCSprite *sp4 = [self._poultryStateSprites objectForKey:@"poultry4"];
        sp4.position = ccp(285,50);
        CCSprite *sp5 = [self._poultryStateSprites objectForKey:@"poultry5"];
        sp5.position = ccp(360,50);
        CCSprite *sp6 = [self._poultryStateSprites objectForKey:@"poultry6"];
        sp6.position = ccp(435,50);
        CCSprite *sp7 = [self._poultryStateSprites objectForKey:@"poultry7"];
        sp7.position = ccp(510,50);
        CCSprite *sp8 = [self._poultryStateSprites objectForKey:@"poultry8"];
        sp8.position = ccp(585,50);
        
        //----------------------------------------------下面一段是放养的鸡----------------------------------------------------------
        
        self._poultryViews = [[NSMutableArray alloc] initWithCapacity:20];
        for (PoultryModel *element in self._model._poultryModels) {
            ChickView *sp = [[ChickView alloc] initWithModel:element];
            sp._viewServer = self;
            sp.anchorPoint = ccp(0.5, 0.5);
            [self._poultryViews addObject:sp];
            [self addChild:sp z:2];
            [sp release];
        }
        
        //----------------------------------------------下面一段是鸡舍中现有的蛋----------------------------------------------------------
        self._eggViews = [[NSMutableArray alloc] initWithCapacity:10];
        for (EggModel *element in self._model._eggs) {
            [self addEgg:element];
        }
        
        //----------------------------------------------下面一段是产品----------------------------------------------------------        
        self._products = [[NSMutableArray alloc] initWithCapacity:10];
        
        //----------------------------------------------下面一段是食槽和水槽----------------------------------------------------------
        
        //食槽
        self._shiCao = [[SiLiaoChi alloc] initWithType:shiCao delegate:self._model];
        [self addChild:_shiCao z:50];
        //水槽
        self._shuiCao = [[SiLiaoChi alloc] initWithType:shuiCao delegate:self._model];
        [self addChild:_shuiCao z:90];
        
        //----------------------------------------------下面一段是栅栏----------------------------------------------------------
        self._fences = [[NSMutableArray alloc] initWithCapacity:6];
        
        for (int i=1; i<=self._model._level; i++) {
            if (i<=6) {
                CCSprite *sp = [[CCSprite alloc]initWithFile:@"围拦.png"];
                ShedsTerrain *terrain = [ShedsTerrain getShedsTerrain];
                NSMutableDictionary *dic = [terrain._layArea objectForKey:[NSString stringWithFormat:@"lay%d", i]] ;
                NSInteger x = [[dic objectForKey:@"x"] intValue];
                NSInteger y = [[dic objectForKey:@"y"] intValue];
                sp.position = ccp(x, y);
                sp.anchorPoint = ccp(0.5, 0.5);
                if (i>=4) {
                    sp.flipX = YES;
                }
                [self._fences addObject:sp];
                [self addChild:sp z:1];
                
            }
            
        }
        
        //----------------------------------------------华丽丽的分割线----------------------------------------------------------
        //加工厂
        factory = [CCMenuItemImage itemFromNormalImage:@"process_0.png" selectedImage:@"process_1.png" target:self selector:@selector(goToFactory:)];
        //仓库
        storeHouse = [CCMenuItemImage itemFromNormalImage:@"warehouse_button_0.png" selectedImage:@"warehouse_button_1.png" target:self selector:@selector(goToStorehouse:)];
        //返回
        CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goBack:)];
        //初始化右下部界面
        CCMenu *menu_right = [CCMenu menuWithItems:factory, storeHouse, back, nil]; 
        menu_right.position = ccp(840, 60);
        [menu_right alignItemsHorizontallyWithPadding:1];
        [self addChild:menu_right z:2];
        
        if (self._model._factoryLevel==0) {
            factory.isEnabled = NO;
            factory.color = ccc3(128, 128, 128);
        }
        
        self.isTouchEnabled = YES;
        
    }
	return self;
}


- (void)ReadyToAddPoultry:(CGPoint)touchPos {
    NSEnumerator *enumeratorKey = [_poultryStateSprites keyEnumerator];
    
    for (NSString *keyName in enumeratorKey) {
        CCSprite *sp = [_poultryStateSprites objectForKey:keyName];
        
        if (CGRectContainsPoint(sp.boundingBox, touchPos)) {
            MenuLogoOP *op = [MenuLogoOP getSharedMenuLogoOp];
            [op setSpriteSelected:sp];
            [self._delegate ReadyToAddPoultry:keyName position:touchPos];
            return;
        }
    }
}

- (void)showStates:(CGPoint)touchPos {
    for (ChickView *element in self._poultryViews) {
        if (CGRectContainsPoint(element.boundingBox, touchPos)) { 
            StateDialog *stateDlg = [[StateDialog alloc] initWithPoutry:element._model henHouseId:self._model._shedsId delegate:self father:element];
            stateDlg.position = ccp(0, element.contentSize.height);
            stateDlg.anchorPoint = ccp(0,0);
            [element addChild:stateDlg z:100 tag:200];
            [stateDlg release];
            return;
        }
    }
}

- (BOOL)showStandards:(CGPoint)touchPos {
    NSEnumerator *enumeratorKey = [_poultryStateSprites keyEnumerator];
    
    for (NSString *keyName in enumeratorKey) {
        CCSprite *sp = [_poultryStateSprites objectForKey:keyName];
        
        if (CGRectContainsPoint(sp.boundingBox, touchPos)) {
            NSCharacterSet* nonDigits = [[NSCharacterSet decimalDigitCharacterSet] invertedSet]; 
            int type = [[keyName stringByTrimmingCharactersInSet:nonDigits] intValue]; 
            StateDialog *stateDlg = [[StateDialog alloc] initWithType:type delegate:self father:sp];
            stateDlg.position = ccp(0, sp.contentSize.height);
            stateDlg.anchorPoint = ccp(0,0);
            [sp addChild:stateDlg z:100 tag:200];
            [stateDlg release];
            return YES;
        }
    }
    return NO;
}

- (void)getProducts:(CGPoint)touchPos
{
    for (Product *element in self._products) {
        if (CGRectContainsPoint(element.boundingBox, touchPos)) {
            NSLog(@"getProduct");
            ccBezierConfig config;
            config.endPosition=ccp(850,60);
            config.controlPoint_1=ccp(516,416);
            config.controlPoint_2=ccp(600,200);
            
            CCAction *scale = [CCScaleTo actionWithDuration:1 scale:0.5];
            CCAction *bezier = [CCBezierTo actionWithDuration:0.7 bezier:config];
            CCAction *spawn = [CCSpawn actions:bezier,scale,nil];
            CCCallFuncN *func = [CCCallFuncN actionWithTarget:element selector:@selector(getProductData:)];
            CCAction *act = [CCSequence actions:spawn, func, nil];
            [element runAction:act];
            break;
        }
    }
}

- (void)getProductData:(Product*)product
{
    [[DAPlayerService sharePlayerService] AddProductItemToWareHouseByName:product._name ItemNum:1];
    [self removeChild:product cleanup:YES];
    [self._products removeObject:product];
}

- (void)getEggs:(CGPoint)touchPos
{
    for (EggView *element in self._eggViews) {
        if (CGRectContainsPoint(element._egg.boundingBox, touchPos)) {
            ccBezierConfig config;
            config.endPosition=ccp(800,-50);
            config.controlPoint_1=ccp(516,416);
            config.controlPoint_2=ccp(600,200);
//            config.endPosition=ccpSub(ccp(850,60), element._egg.position);
//            config.controlPoint_1=ccpSub(ccp(516,416), element._egg.position);
//            config.controlPoint_2=ccpSub(ccp(600,200), element._egg.position);
            CCAction *scale = [CCScaleTo actionWithDuration:1.5 scale:0.5];
            CCAction *bezier = [CCBezierTo actionWithDuration:1.5 bezier:config];
            CCAction *spawn = [CCSpawn actions:bezier,scale,nil];
            CCCallFuncN *func = [CCCallFuncN actionWithTarget:element selector:@selector(eggHarvest:)];
            CCAction *act = [CCSequence actions:spawn, func, nil];
            [element runAction:act];
            break;
        }
    }
}

- (void)eggHarvestEnd:(EggView*)eggView
{
    Contents *m = [Contents getContents];
    [[DAPlayerService sharePlayerService] AddItemFromHenHouseByName:[m getEggNameByType:eggView._model._type] ItemNum:1];
    [self removeChild:eggView cleanup:YES];
    [self._poultryViews removeObject:eggView];
    [self._model._eggs removeObject:eggView._model];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [self convertTouchToNodeSpace:touch];
    [self ReadyToAddPoultry:location];
    if (![self showStandards:location]) {
        [self showStates:location];
    }
    [self getProducts:location];
    [self getEggs:location];
    
}

#pragma StateDialogDelegate mark
- (void)stateTimeOver:(id)father
{
    [father removeChildByTag:200 cleanup:YES];
}

#pragma WarningDialogDelegate mark
- (void)removeDialog
{
    [self removeChildByTag:100 cleanup:YES];
}

#pragma ShedsViewServer mark

- (void)addPoultry:(PoultryModel *)model
{
    chickNum.string = [NSString stringWithFormat:@"%d", [self._model._poultryModels count]];
    maxChickNum.string = [NSString stringWithFormat:@"%d", self._model._maxPoultryNum];
    coinLabel.string = [NSString stringWithFormat:@"%d", self._model._money];
    CCCallFuncN* call_iws1 = [CCCallFuncN actionWithTarget:self selector:@selector(CallScale:)];
    [coinLabel runAction:call_iws1];
    
    ChickView *sp = [[ChickView alloc] initWithModel:model];
    sp._viewServer = self;
    [self._poultryViews addObject:sp];
    [self addChild:sp z:1];
    [sp release];
}

- (void)setFood:(NSInteger)food
{
    [self._shiCao setNum:food];
}

- (void)setWater:(NSInteger)water
{
    [self._shuiCao setNum:water];
}

- (void)showWarning:(NSString *)tip
{
    if ([self getChildByTag:100] == nil) {
        WarningDialog *dialog = [[WarningDialog alloc] initWithTip:tip];
        dialog._delegate = self;
        [self addChild:dialog z:100 tag:100];
        [dialog release];
    }
    
}

- (NSMutableArray*)getFences
{
    return self._fences;
}

- (void)bubbleSort:(NSMutableArray *)views
{
    if (!views || [views count]==0) {
        return;
    }
    for (int i=0; i<[views count]; i++) {
        for (int j=0; j<[views count]-i-1; j++) {
            ChickView* chick1 = ((ChickView*)[views objectAtIndex:j]);
            ChickView* chick2 = ((ChickView*)[views objectAtIndex:j+1]);
            if (chick1._model._pos.y > chick2._model._pos.y) {
                [views exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
}

- (void)dealZBuffer:(NSMutableArray *)views
{
    NSMutableArray *upList = [NSMutableArray arrayWithCapacity:5];
    NSMutableArray *midList = [NSMutableArray arrayWithCapacity:5];
    NSMutableArray *downList = [NSMutableArray arrayWithCapacity:5];
    for (ChickView *element in views) {
        CGFloat y1 = element._model._pos.y;
        CGFloat y2 = [self._shiCao getRect].origin.y+[self._shiCao getRect].size.height;
        CGFloat y3 = [self._shuiCao getRect].origin.y+[self._shuiCao getRect].size.height;
        if (element._model._pos.y > y2) {
            [upList addObject:element];
        }
        else if ((element._model._pos.y > y3)) {
            [midList addObject:element];
        }
        else {
            [downList addObject:element];
        }
    }
    [self bubbleSort:upList];
    [self bubbleSort:midList];
    [self bubbleSort:downList];
    if ([upList count]!=0) {
        for (int i=0; i<[upList count]; i++) {
            ChickView* chick = (ChickView*)[upList objectAtIndex:i];
            [self reorderChild:chick z:30-i]; 
        }
    }
    if ([midList count]!=0) {
        for (int i=0; i<[midList count]; i++) {
            ChickView* chick = (ChickView*)[midList objectAtIndex:i];
            [self reorderChild:chick z:70-i];
        }
    }
    if ([downList count]!=0) {
        for (int i=0; i<[downList count]; i++) {
            ChickView* chick = (ChickView*)[downList objectAtIndex:i];
            [self reorderChild:chick z:90-i];
        }
    }
    
}

- (void)upGrade:(NSInteger)destGrade
{
    maxChickNum.string = [NSString stringWithFormat:@"%d", self._model._maxPoultryNum];
}

- (void)harvest:(ChickView*)chick
{
    ccBezierConfig config;
    config.endPosition=ccp(850,60);
    config.controlPoint_1=ccp(516,416);
    config.controlPoint_2=ccp(600,200);
    
    CCAction *scale = [CCScaleTo actionWithDuration:1.5 scale:0.3];
    CCAction *bezier = [CCBezierTo actionWithDuration:1.5 bezier:config];
    CCAction *spawn = [CCSpawn actions:bezier,scale,nil];
    CCCallFuncN *func = [CCCallFuncN actionWithTarget:chick selector:@selector(dataHarvest:)];
    CCAction *act = [CCSequence actions:spawn, func, nil];
    [chick runAction:act];
    
}

- (void)harvestEnd:(ChickView*)chick
{
    [[DAPlayerService sharePlayerService] GetPoultryFromHenHouse:self._model._shedsId TableID:chick._model._poultryId];
    [self removeChild:chick cleanup:YES];
    [self._poultryViews removeObject:chick];
    [self._model._poultryModels removeObject:chick._model];
}


- (void)colliTest
{
    for (ChickView *element in self._poultryViews) {
        [element dealCollision:self._fences];
    }
    [self dealZBuffer:self._poultryViews];
}

- (void)addEgg:(EggModel *)egg
{
    EggView *sp = [[EggView alloc] initWithEggModel:egg];
    [self._eggViews addObject:sp];
    [self addChild:sp];
    sp._delegate = self;
    [sp release];
}

#pragma @selector mark 
- (void) buyCoins: (id) sender{
    NSLog(@"buyCoins******************");
}

- (void) buyDiamond: (id) sender{
    NSLog(@"buyDiamond******************");
}

- (void) goToFactory: (id) sender{
    NSLog(@"goToFactory******************");
    
    if ([self._eggViews count] == 0) {
        return;
    }
    for (EggView *element in self._eggViews) {
        ccBezierConfig config;
        config.endPosition=ccpSub(ccp(730,60), element._egg.position);
        config.controlPoint_1=ccpSub(ccp(516,416), element._egg.position);
        config.controlPoint_2=ccpSub(ccp(600,200), element._egg.position);
        CCAction *processCall = [CCCallFunc actionWithTarget:self selector:@selector(processCall:)];
        CCAction *act = [CCSequence actions:[CCBezierTo actionWithDuration:2 bezier:config], processCall, nil];
        [element runAction:act];
    }
}

- (void) goToStorehouse: (id) sender{
    NSLog(@"goToStorehouse******************");
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WareHouseLayer *wareHouseLayer = [WareHouseLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:wareHouseLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
}

- (void) goBack: (id) sender{
    NSLog(@"goBack******************");
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
}

- (void)processCall:(id)sender
{
    factory.visible = NO;
    FactoryAnim *anim = [[FactoryAnim alloc] initWithTimeLong:5 delegate:self];
    [self addChild:anim z:2 tag:105];
    [anim release];
    
}

#pragma mark CCCallFuncN
-(void) CallScale :(id)sender
{
    CCAction *scaleBigger = [CCScaleTo actionWithDuration:0.12 scale:1.5];
    CCAction *scaleSmaller = [CCScaleTo actionWithDuration:0.12 scale:1];
    CCAction *act = [CCSequence actions: scaleBigger, scaleSmaller,nil];
    [sender runAction:act];
}

#pragma mark FactoryAnimDelegate
- (void)processEnd
{
    factory.visible = YES;
    [self removeChildByTag:105 cleanup:YES];//factoryanim
    Contents *m = [Contents getContents];
    NSInteger getExp = 0;
    for (EggModel *element in self._model._eggs) {
        getExp += element._exp;
        [[DAPlayerService sharePlayerService] AddItemFromHenHouseByName:[m getEggNameByType:element._type] ItemNum:1];
    }
    CGFloat exp = [DAPlayerService sharePlayerService].playerEntity.nExp;
    NSInteger level = [DAPlayerService sharePlayerService].playerEntity.nLevel;
    score.scaleX = exp/((level/2+1)*(level/2+1)*(level/2+1)*(level/2+1)+200);
//    for (int i=1; i<=getExp; i++) {
//        
//    }
    NSMutableArray *productsNames = [Factory process:self._model._eggs];
    for (int i=0; i<[productsNames count]; i++) {
        Product *sp = [[Product alloc] initWithFile:[NSString stringWithFormat:@"%@.png",[productsNames objectAtIndex:i]]];
        sp.position = ccp(730,60);
        sp._name = [productsNames objectAtIndex:i];
        sp._shedsViewServer = self;
        [self._products addObject:sp];
        [self addChild:sp z:1 tag:50];
        [sp release];
    }
    for (Product *element in self._products) {
        CCAction *act1 = [CCMoveTo actionWithDuration:0.3 position:ccpAdd(element.position, ccp(RANDOM(-100, 100), 100))];
        CCAction *act2 = [CCMoveBy actionWithDuration:0.1 position:ccp(0,-10)];
        [element runAction:[CCSequence actions:act1,act2, nil]];
    }
    
    for (EggView *element in self._eggViews) {
        [self removeChild:element cleanup:YES];
    }
    [self._eggViews removeAllObjects];
    [self._model._eggs removeAllObjects];
}

- (void) dealloc
{
    self._products = nil;
    self._eggViews = nil;
    self._fences = nil;
    self._poultryViews = nil;
    self._poultryStateSprites = nil;
    self._shiCao = nil;
    self._shuiCao = nil;
	[super dealloc];
}




@end
