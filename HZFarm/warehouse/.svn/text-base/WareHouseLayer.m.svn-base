//
//  HelloWorldLayer.m
//  WareHouse
//
//  Created by hzbc on 4/6/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "WareHouseLayer.h"
#import "WorldLayer.h"
#import "Firstlayermenu.h"
#import "DAShopService.h"
#import "DAItemVehicle.h"
#import "DAItemService.h"
#import "DAPlayerService.h"
#import "DAItemPoultryEntity.h"
#import "DAWareHouseService.h"
#import "DAItemTypeRelService.h"

@implementation WareHouseLayer
@synthesize state, itemName;

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		//CGSize winSize = [CCDirector sharedDirector].winSize;
        isTransport = YES;
        
        allButtons = [[NSMutableArray alloc] init];
        itemsArray = [[NSMutableArray alloc] init];
        sellItems = [[NSMutableArray alloc] init];
        
        DAWareHouseService *warehouseService = [DAWareHouseService shareWareHouseService];
        
        //背景 
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGB565];
        background = [CCSprite spriteWithFile:@"warehouse_123.png"];
        background.anchorPoint = ccp(0, 0);
        [self addChild:background z:1];
        
        [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_Default];
        selectSprites = [[NSMutableArray alloc] init];
        
        //运送按钮
        transportation = [CCMenuItemImage itemFromNormalImage:@"Transportation_0.png" selectedImage:@"Transportation_1.png" target:self selector:@selector(transport)];
        [transportation setScale:0.95f];
        //[transportation setIsEnabled:NO];
        
        //卸载按钮
        CCMenuItemImage *unload = [CCMenuItemImage itemFromNormalImage:@"unload_0.png" selectedImage:@"unload_1.png" target:self selector:@selector(unload)];
        [unload setScale:0.95f];
        
        //返回按钮
        CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" target:self selector:@selector(goToMap)];
        [back setScale:0.95f];
        
        //右下角的三个按钮布局
        CCMenu *menu_rightBottom = [CCMenu menuWithItems:transportation, unload, back, nil];
        menu_rightBottom.position = ccp(798, 65);
        [menu_rightBottom alignItemsHorizontallyWithPadding:1.0f];
        [self addChild:menu_rightBottom z:99];
        
        //交通工具tricycle小图标
        CCSprite *spriteTricycleSmall = [CCSprite spriteWithFile:@"tricycle_0.png"];
        spriteTricycleSmall.position = ccp(671, 638);
        [spriteTricycleSmall setScale:0.23f];
        [self addChild:spriteTricycleSmall z:99];
        [selectSprites addObject:spriteTricycleSmall];
        
        //交通工具Tractor小图标
        CCSprite *spriteTractorSmall = [CCSprite spriteWithFile:@"tractor_0灰.png"];
        spriteTractorSmall.position = ccp(713, 638);
        //[spriteTractorSmall setScale:0.23f];
        [self addChild:spriteTractorSmall z:99];
        [selectSprites addObject:spriteTractorSmall];
        tractorFlag = NO;
        
        //交通工具SmallWagon小图标
        CCSprite *spriteSmallWagonSmall = [CCSprite spriteWithFile:@"S wagon_0灰.png"];
        spriteSmallWagonSmall.position = ccp(756, 638);
        [spriteSmallWagonSmall setScale:0.9f];
        [self addChild:spriteSmallWagonSmall z:99];
        [selectSprites addObject:spriteSmallWagonSmall];
        smallWagonFlag = NO;
        
        //交通工具BigWagon小图标
        CCSprite *spriteBigWagonSmall = [CCSprite spriteWithFile:@"B wagon_0灰.png"];
        spriteBigWagonSmall.position = ccp(797, 638);
        [spriteBigWagonSmall setScale:0.9f];
        [self addChild:spriteBigWagonSmall z:99];
        [selectSprites addObject:spriteBigWagonSmall];
        bigWagonFlag = NO;
        
        //交通工具ContainerCar小图标
        CCSprite *spriteContainerCarSmall = [CCSprite spriteWithFile:@"container car_0灰.png"];
        spriteContainerCarSmall.position = ccp(839, 638);
        [spriteContainerCarSmall setScale:0.9f];
        [self addChild:spriteContainerCarSmall z:99];
        [selectSprites addObject:spriteContainerCarSmall];
        containerCarFlag = NO;
        
        //交通工具Helicopter小图标
        CCSprite *spriteHelicopterSmall = [CCSprite spriteWithFile:@"helicopter_0灰.png"];
        spriteHelicopterSmall.position = ccp(881, 638);
        [spriteHelicopterSmall setScale:0.9f];
        [self addChild:spriteHelicopterSmall z:99];
        [selectSprites addObject:spriteHelicopterSmall];
        helicopterFlag = NO;
        
        if ([warehouseService FindVehicleItem:@"农用车"]) {
            [spriteTractorSmall setTexture:[[CCTextureCache sharedTextureCache] addImage:@"tractor_0.png"]];
            tractorFlag = YES;
        }
        if([warehouseService FindVehicleItem:@"卡车"]){
            [spriteSmallWagonSmall setTexture:[[CCTextureCache sharedTextureCache] addImage:@"S wagon_0.png"]];
            smallWagonFlag = YES;
        }
        if([warehouseService FindVehicleItem:@"货车"]){
            [spriteBigWagonSmall setTexture:[[CCTextureCache sharedTextureCache] addImage:@"B wagon_0.png"]];
            bigWagonFlag = YES;
        }
        if([warehouseService FindVehicleItem:@"集装箱"]){
            [spriteContainerCarSmall setTexture:[[CCTextureCache sharedTextureCache] addImage:@"container car_0.png"]];
            containerCarFlag = YES;
        }
        if([warehouseService FindVehicleItem:@"直升机"]){
            [spriteHelicopterSmall setTexture:[[CCTextureCache sharedTextureCache] addImage:@"helicopter_0.png"]];
            helicopterFlag = YES;
        }
        
        
        //交通工具方格
        for (int i = 0; i < 6; i++) {
            CCSprite *spriteGrid = [CCSprite spriteWithFile:@"grid.png"];
            spriteGrid.position = ccp(671 + (i * 42), 638);
            [self addChild:spriteGrid z:50];
        }
        
        [self creatTricycle];
        [self refreshWareHouse];
        
    }
    
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    
	return self;
}

-(void) refreshWareHouse
{
    DAWareHouseService *warehouseService = [DAWareHouseService shareWareHouseService];
    
    int poultryCount = [DAWareHouseService shareWareHouseService].wareHouseData.ItemPoultry.count;
    int eggCount = [DAWareHouseService shareWareHouseService].wareHouseData.ItemEggs.count;
    int productCount = [DAWareHouseService shareWareHouseService].wareHouseData.ItemProducts.count;
    int count = poultryCount + eggCount+ productCount;
    
    CCSprite *spriteRow = [CCSprite spriteWithFile:@"warehouserow.png"];
    
    if (count < 9 || count == 9) {
        if (poultryCount != 0) {
            for (int i = 0; i < poultryCount; i++) {
                DAItemInWareHouse *item1 = [warehouseService.wareHouseData.ItemPoultry objectAtIndex:i];
                [itemsArray addObject:item1];
                DAItemPoultryEntity *item2 = [[DAItemService shareService] GetPoultryItemByName:item1.sysName];
                
                CCSprite *spriteX = [CCSprite spriteWithFile:@"quantity number X.png"];
                spriteX.position = ccpAdd(ccp(205, 535), ccp(0, -(i * 54)));
                [spriteX setScale:0.8f];
                [self addChild:spriteX z:99];
                
                CCSprite *spriteBigPoultry = [CCSprite spriteWithFile:item2.imagePath];
                spriteBigPoultry.anchorPoint = ccp(0.5, 0.5);
                spriteBigPoultry.position = ccpAdd(ccp(120,535), ccp(0, -i * 54));
                [spriteBigPoultry setScale:0.48f];
                [self addChild:spriteBigPoultry z:99];
                
                CCLabelAtlas *labelNumBigPoultry = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item1.iNum] charMapFile:@"quantity number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelNumBigPoultry.anchorPoint = ccp(0.5, 0.5);
                labelNumBigPoultry.position =ccpAdd(ccp(245, 535), ccp(0, -i * 54));
                [self addChild:labelNumBigPoultry z:99];
                
                
                CCLabelAtlas *labelPriBigPoultry = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item2.SellPrice] charMapFile:@"price number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelPriBigPoultry.anchorPoint = ccp(0.5, 0.5);
                labelPriBigPoultry.position = ccpAdd(ccp(340, 535), ccp(0, -i * 54));
                [self addChild:labelPriBigPoultry z:99];
                
                CCMenuItemImage *menuAll = [CCMenuItemImage itemFromNormalImage:@"all_0.png" selectedImage:@"all_1.png" target:self selector:@selector(clickAllButto:)];
                [allButtons addObject:menuAll];
                
                CCMenu *menu_Right = [CCMenu menuWithItems:menuAll, nil];
                menu_Right.position = ccpAdd(ccp(465, 535), ccp(0, -(i * 54)));
                [self addChild:menu_Right z:99];
            }
        }
        
        if (eggCount != 0) {
            for (int i = 0; i < eggCount; i++) {
                DAItemInWareHouse *item1 = [warehouseService.wareHouseData.ItemEggs objectAtIndex:i];
                [itemsArray addObject:item1];
                DAItemEggs *item2 = [[DAItemService shareService] GetGeneralItemByName:item1.sysName GeneralItemType:GeneralItem_Eggs];
                
                CCSprite *spriteX = [CCSprite spriteWithFile:@"quantity number X.png"];
                spriteX.position = ccpAdd(ccp(205, 535), ccp(0, -((i + poultryCount) * 54)));
                [spriteX setScale:0.8f];
                [self addChild:spriteX z:99];
                
                CCSprite *spriteEgg = [CCSprite spriteWithFile:item2.imagePath];
                spriteEgg.anchorPoint = ccp(0.5, 0.5);
                spriteEgg.position = ccpAdd(ccp(120,535), ccp(0, -(i + poultryCount) * 54));
                [self addChild:spriteEgg z:99];
                
                CCLabelAtlas *labelNumEgg = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item1.iNum] charMapFile:@"quantity number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelNumEgg.anchorPoint = ccp(0.5, 0.5);
                labelNumEgg.position =ccpAdd(ccp(245, 535), ccp(0, -(i + poultryCount) * 54));
                [self addChild:labelNumEgg z:99];
                
                
                CCLabelAtlas *labelPriEgg = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item2.nSellPrice] charMapFile:@"price number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelPriEgg.anchorPoint = ccp(0.5, 0.5);
                labelPriEgg.position = ccpAdd(ccp(340, 535), ccp(0, -(i + poultryCount) * 54));
                [self addChild:labelPriEgg z:99];
                
                CCMenuItemImage *menuAll = [CCMenuItemImage itemFromNormalImage:@"all_0.png" selectedImage:@"all_1.png" target:self selector:@selector(clickAllButton:)];
                [allButtons addObject:menuAll];
                
                CCMenu *menu_Right = [CCMenu menuWithItems:menuAll, nil];
                menu_Right.position = ccpAdd(ccp(465, 535), ccp(0, -((i + poultryCount) * 54)));
                [self addChild:menu_Right z:99];
            }
        }
        
        if (productCount != 0) {
            for (int i = 0; i < productCount; i++) {
                DAItemInWareHouse *item1 = [warehouseService.wareHouseData.ItemProducts objectAtIndex:i];
                [itemsArray addObject:item1];
                DAItemProducts *item2 = [[DAItemService shareService] GetGeneralItemByName:item1.sysName GeneralItemType:GeneralItem_Products];
                
                CCSprite *spriteX = [CCSprite spriteWithFile:@"quantity number X.png"];
                spriteX.position = ccpAdd(ccp(205, 535), ccp(0, -((i + poultryCount + eggCount) * 54)));
                [spriteX setScale:0.8f];
                [self addChild:spriteX z:99];
                
                CCSprite *spriteProduct = [CCSprite spriteWithFile:item2.imagePath];
                spriteProduct.anchorPoint = ccp(0.5, 0.5);
                spriteProduct.position = ccpAdd(ccp(120,535), ccp(0, -(i + poultryCount + eggCount) * 54));
                [self addChild:spriteProduct z:99];
                
                CCLabelAtlas *labelNumProduct = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item1.iNum] charMapFile:@"quantity number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelNumProduct.anchorPoint = ccp(0.5, 0.5);
                labelNumProduct.position =ccpAdd(ccp(245, 535), ccp(0, -(i + poultryCount + eggCount) * 54));
                [self addChild:labelNumProduct z:99];
                
                
                CCLabelAtlas *labelPriProduct = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item2.nSellPrice] charMapFile:@"price number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelPriProduct.anchorPoint = ccp(0.5, 0.5);
                labelPriProduct.position = ccpAdd(ccp(340, 535), ccp(0, -(i + poultryCount + eggCount) * 54));
                [self addChild:labelPriProduct z:99];
                
                CCMenuItemImage *menuAll = [CCMenuItemImage itemFromNormalImage:@"all_0.png" selectedImage:@"all_1.png" target:self selector:@selector(clickAllButton:)];
                [allButtons addObject:menuAll];
                
                CCMenu *menu_Right = [CCMenu menuWithItems:menuAll, nil];
                menu_Right.position = ccpAdd(ccp(465, 535), ccp(0, -((i + poultryCount + eggCount) * 54)));
                [self addChild:menu_Right z:99];
            }
        }
    } else if(count > 9){
        CGSize viewSize = CGSizeMake(spriteRow.contentSize.width, (spriteRow.contentSize.height - 2) * 9);
        scrollView = [SWScrollView viewWithViewSize:viewSize];
        scrollView.anchorPoint = ccp(0.0f, 1.0f);
        scrollView.position = ccp(65, 95);
        scrollView.contentOffset = ccp(0, 0);
        CGSize viewContentSize = CGSizeMake(spriteRow.contentSize.width, (spriteRow.contentSize.height - 2) * count);
        scrollView.contentSize = viewContentSize;
        scrollView.direction = SWScrollViewDirectionVertical;
        scrollView.bounces = NO;
        [scrollView setContentOffset:ccp(0,-((spriteRow.contentSize.height - 2) * (count - 9))) animated:YES];
        
        if (poultryCount != 0) {
            for ( int i = 0; i < poultryCount; i++) {
                CCSprite *spriteEveryRow = [CCSprite spriteWithFile:@"warehouserow.png"];
                spriteEveryRow.anchorPoint = ccp(0.5f, 0.5f);
                
                DAItemInWareHouse *item1 = [warehouseService.wareHouseData.ItemPoultry objectAtIndex:i];
                [itemsArray addObject:item1];
                DAItemPoultryEntity *item2 = [[DAItemService shareService] GetPoultryItemByName:item1.sysName];
                
                CCSprite *spriteX = [CCSprite spriteWithFile:@"quantity number X.png"];
                spriteX.position = ccp(130, 28);
                [spriteX setScale:0.8f];
                [spriteEveryRow addChild:spriteX z:99];
                
                CCSprite *spriteBigPoultry = [CCSprite spriteWithFile:item2.imagePath];
                spriteBigPoultry.anchorPoint = ccp(0.5, 0.5);
                spriteBigPoultry.position = ccp(53,28);
                [spriteBigPoultry setScale:0.48f];
                [spriteEveryRow addChild:spriteBigPoultry z:99];
                
                CCLabelAtlas *labelNumBigPoultry = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item1.iNum] charMapFile:@"quantity number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelNumBigPoultry.anchorPoint = ccp(0.5, 0.5);
                labelNumBigPoultry.position = ccp(180, 28);
                [spriteEveryRow addChild:labelNumBigPoultry z:99];
                
                
                CCLabelAtlas *labelPriBigPoultry = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item2.SellPrice] charMapFile:@"price number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelPriBigPoultry.anchorPoint = ccp(0.5, 0.5);
                labelPriBigPoultry.position = ccp(275, 28);
                [spriteEveryRow addChild:labelPriBigPoultry z:99];
                
                CCMenuItemImage *menuAll = [CCMenuItemImage itemFromNormalImage:@"all_0.png" selectedImage:@"all_1.png" target:self selector:@selector(clickAllButton:)];
                [allButtons addObject:menuAll];
                
                CCMenu *menu_Right = [CCMenu menuWithItems:menuAll, nil];
                menu_Right.position = ccp(400, 28);
                [spriteEveryRow addChild:menu_Right z:99];
                
                spriteEveryRow.position = ccpAdd(ccp(0, ((spriteRow.contentSize.height - 2) * count) - (spriteRow.contentSize.height)), ccp(0, -(i * (spriteRow.contentSize.height-3))));
                
                [scrollView addChild:spriteEveryRow z:99];
                
            }
        }
        
        if (eggCount != 0) {
            for ( int i = 0; i < eggCount; i++) {
                CCSprite *spriteEveryRow = [CCSprite spriteWithFile:@"warehouserow.png"];
                spriteEveryRow.anchorPoint = ccp(0.5f, 0.5f);
                
                DAItemInWareHouse *item1 = [warehouseService.wareHouseData.ItemEggs objectAtIndex:i];
                [itemsArray addObject:item1];
                DAItemEggs *item2 = [[DAItemService shareService] GetGeneralItemByName:item1.sysName GeneralItemType:GeneralItem_Eggs];
                
                CCSprite *spriteX = [CCSprite spriteWithFile:@"quantity number X.png"];
                spriteX.position = ccp(130, 28);
                [spriteX setScale:0.8f];
                [spriteEveryRow addChild:spriteX z:99];
                
                CCSprite *spriteEgg = [CCSprite spriteWithFile:item2.imagePath];
                spriteEgg.anchorPoint = ccp(0.5, 0.5);
                spriteEgg.position = ccp(53,30);
                [spriteEveryRow addChild:spriteEgg z:99];
                
                CCLabelAtlas *labelNumEgg = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item1.iNum] charMapFile:@"quantity number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelNumEgg.anchorPoint = ccp(0.5, 0.5);
                labelNumEgg.position = ccp(180, 28);
                [spriteEveryRow addChild:labelNumEgg z:99];
                
                
                CCLabelAtlas *labelPriEgg = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item2.nSellPrice] charMapFile:@"price number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelPriEgg.anchorPoint = ccp(0.5, 0.5);
                labelPriEgg.position = ccp(275, 28);
                [spriteEveryRow addChild:labelPriEgg z:99];
                
                CCMenuItemImage *menuAll = [CCMenuItemImage itemFromNormalImage:@"all_0.png" selectedImage:@"all_1.png" target:self selector:@selector(clickAllButton:)];
                [allButtons addObject:menuAll];
                
                CCMenu *menu_Right = [CCMenu menuWithItems:menuAll, nil];
                menu_Right.position = ccp(400, 28);
                [spriteEveryRow addChild:menu_Right z:99];
                
                spriteEveryRow.position = ccpAdd(ccp(0, ((spriteRow.contentSize.height - 2) * count) - (spriteRow.contentSize.height)), ccp(0, -((i + poultryCount) * (spriteRow.contentSize.height-3))));
                
                [scrollView addChild:spriteEveryRow z:99];
                
            }
        }
        
        if (productCount != 0) {
            for ( int i = 0; i < productCount; i++) {
                CCSprite *spriteEveryRow = [CCSprite spriteWithFile:@"warehouserow.png"];
                spriteEveryRow.anchorPoint = ccp(0.5f, 0.5f);
                
                DAItemInWareHouse *item1 = [warehouseService.wareHouseData.ItemProducts objectAtIndex:i];
                [itemsArray addObject:item1];
                DAItemProducts *item2 = [[DAItemService shareService] GetGeneralItemByName:item1.sysName GeneralItemType:GeneralItem_Products];
                
                CCSprite *spriteX = [CCSprite spriteWithFile:@"quantity number X.png"];
                spriteX.position = ccp(130, 28);
                [spriteX setScale:0.8f];
                [spriteEveryRow addChild:spriteX z:99];
                
                CCSprite *spriteProduct = [CCSprite spriteWithFile:item2.imagePath];
                spriteProduct.anchorPoint = ccp(0.5, 0.5);
                spriteProduct.position = ccp(53,30);
                [spriteEveryRow addChild:spriteProduct z:99];
                
                CCLabelAtlas *labelNumProduct = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item1.iNum] charMapFile:@"quantity number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelNumProduct.anchorPoint = ccp(0.5, 0.5);
                labelNumProduct.position = ccp(180, 28);
                [spriteEveryRow addChild:labelNumProduct z:99];
                
                
                CCLabelAtlas *labelPriProduct = [CCLabelAtlas labelWithString:[NSString stringWithFormat:@"%d", item2.nSellPrice] charMapFile:@"price number123.png" itemWidth:22 itemHeight:25 startCharMap:'0'];
                labelPriProduct.anchorPoint = ccp(0.5, 0.5);
                labelPriProduct.position = ccp(275, 28);
                [spriteEveryRow addChild:labelPriProduct z:99];
                
                CCMenuItemImage *menuAll = [CCMenuItemImage itemFromNormalImage:@"all_0.png" selectedImage:@"all_1.png" target:self selector:@selector(clickAllButton:)];
                [allButtons addObject:menuAll];
                
                CCMenu *menu_Right = [CCMenu menuWithItems:menuAll, nil];
                menu_Right.position = ccp(400, 28);
                [spriteEveryRow addChild:menu_Right z:99];
                
                spriteEveryRow.position = ccpAdd(ccp(0, ((spriteRow.contentSize.height - 2) * count) - (spriteRow.contentSize.height)), ccp(0, -((i + poultryCount + eggCount) * (spriteRow.contentSize.height-3))));
                
                [scrollView addChild:spriteEveryRow z:99];
            }
        }
        
        [self addChild:scrollView z:99];
        
    }

}

-(void) clickAllButton:sender
{
    for (CCMenuItemImage *menuItem in allButtons) {
        int a = [DAWareHouseService shareWareHouseService].wareHouseData.ItemPoultry.count;
        int b = [DAWareHouseService shareWareHouseService].wareHouseData.ItemEggs.count;
        int c = [DAWareHouseService shareWareHouseService].wareHouseData.ItemProducts.count;
        int d = a + b + c;
        
        for (int i = 0;  i < d;  i++) {
            if (sender == [allButtons objectAtIndex:i]) {
                itemWare = [itemsArray objectAtIndex:i];          
                [sellItems addObject:itemWare];
            }
        }
    }
    
    //NSLog(@"name is:%@", itemWare.sysName);
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    [selectSprites release];
    selectSprites = nil;
    [allButtons release];
    allButtons = nil;
    [itemsArray release];
    itemsArray = nil;
    [sellItems release];
    sellItems = nil;
    
	[super dealloc];
}

#pragma arguments

-(void) selectSpriteForTouch:(CGPoint) touchLocation{
    CCSprite *newSprite = nil;
    
    for (CCSprite *sprite in selectSprites) {
        if (CGRectContainsPoint(sprite.boundingBox, touchLocation)) {
            
            if (sprite != selSprite) {
                if (sprite == [selectSprites objectAtIndex:0]) {
                    self.state = 0;
                    transportState = 0;
                }else if(sprite == [selectSprites objectAtIndex:1]){
                    self.state = 1;
                    transportState = 1;
                }else if(sprite == [selectSprites objectAtIndex:2]){
                    self.state = 2;
                    transportState = 2;
                }else if(sprite == [selectSprites objectAtIndex:3]){
                    self.state = 3;
                    transportState = 3;
                }else if(sprite == [selectSprites objectAtIndex:4]){
                    self.state = 4;
                    transportState = 4;
                }else if(sprite == [selectSprites objectAtIndex:5]){
                    self.state = 5;
                    transportState = 5;
                }else {
                    self.state = -1;
                }
                
                switch (self.state) {
                    case 0:
                        isTransport = YES;
                        [self creatTricycle];
                        transportation.isEnabled = isTransport;
                        selSprite = sprite;
                        break;
                    case 1:
                        if (tractorFlag) {
                            isTransport = YES;
                            [self creatTractor];
                            transportation.isEnabled = isTransport;
                            selSprite = sprite;
                            break;
                        }else{
                            break;
                        }
                    case 2:
                        if (smallWagonFlag) {
                            isTransport = YES;
                            [self creatSmallWagon];
                            transportation.isEnabled = isTransport;
                            selSprite = sprite;
                            break;
                        }else{
                            break;
                        }
                    case 3:
                        if (bigWagonFlag) {
                            isTransport = YES;
                            [self creatBigWagon];
                            transportation.isEnabled = isTransport;
                            selSprite = sprite;
                            break;
                        }else{
                            break;
                        }
                    case 4:
                        if (containerCarFlag) {
                            isTransport = YES;
                            [self creatContainerCar];
                            transportation.isEnabled = isTransport;
                            selSprite = sprite;
                            break;
                        }else{
                            break;
                        }
                    case 5:
                        if (helicopterFlag) {
                            isTransport = YES;
                            [self creatHelicopter];
                            transportation.isEnabled = isTransport;
                            selSprite = sprite;
                            break;
                        }else{
                            break;
                        }
                    case -1:
                        newSprite = [CCSprite spriteWithTexture:[sprite texture]]; 
                        newSprite.position = sprite.position;
                        [self addChild:newSprite z:98];
                        selSprite = newSprite;
                        break;
                }
            }
            
            break;
        }
    }
    
}

-(void) panForTranslation: (CGPoint) translation{
    if (selSprite != [selectSprites objectAtIndex:0] && selSprite != [selectSprites objectAtIndex:1]
        && selSprite != [selectSprites objectAtIndex:2] && selSprite != [selectSprites objectAtIndex:3]
        && selSprite != [selectSprites objectAtIndex:4] && selSprite != [selectSprites objectAtIndex:5]) {
        if (selSprite) {
            CGPoint newPos = ccpAdd(selSprite.position, translation);
            selSprite.position = newPos;
        } 
    }
}

-(void) vehicleGrid
{
    for (int i = 0; i < 20; i++) {
        [self removeChildByTag:134 cleanup:YES]; 
    }
    for (int i = 0; i < 2; i++) {
        CCSprite *spriteGoodGridColumn = [CCSprite spriteWithFile:@"grid.png"];
        spriteGoodGridColumn.position = ccpAdd(ccp(615, 425), ccp(0, (-i * 42)));
        [self addChild:spriteGoodGridColumn z:98 tag:134];
        for (int j = 1; j < 9; j++) {
            CCSprite *spriteGoodGridRow = [CCSprite spriteWithFile:@"grid.png"];
            spriteGoodGridRow.position = ccpAdd(spriteGoodGridColumn.position, ccp((j * 42), 0));
            [self addChild:spriteGoodGridRow z:98 tag:134];
        }
    }
    
    for (int i = 0; i < 2; i++) {
        CCSprite *spriteGoodGridRow = [CCSprite spriteWithFile:@"grid.png"];
        spriteGoodGridRow.position = ccpAdd(ccp(615, 341), ccp((i * 42), 0));
        [self addChild:spriteGoodGridRow z:98 tag:134];
    }
}

//-(void) goodToGird:(CGPoint) touchLocation{
//    if (selSprite) {
//        CGRect  girdRect = CGRectMake(590, 321, 375, 130);
//        CCSprite *newSpriteColumn = nil;
//        CCSprite *newSpriteRow = nil;
//        if (selSprite != [selectSprites objectAtIndex:0] && selSprite != [selectSprites objectAtIndex:1]
//            && selSprite != [selectSprites objectAtIndex:2] && selSprite != [selectSprites objectAtIndex:3]
//            && selSprite != [selectSprites objectAtIndex:4] && selSprite != [selectSprites objectAtIndex:5]) {
//            if (CGRectContainsPoint(girdRect, touchLocation)) {
//                for (int i = 0; i < 3; i++) {
//                    newSpriteColumn = [CCSprite spriteWithTexture:[selSprite texture]];
//                    newSpriteColumn.position = ccpAdd(ccp(615, 422), ccp(0, (-i * 42)));
//                    [newSpriteColumn setScale:0.52f];
//                    [self addChild:newSpriteColumn z:98 tag:11];
//                    for (int j = 1; j < 9; j++) {
//                        newSpriteRow = [CCSprite spriteWithTexture:[selSprite texture]];
//                        newSpriteRow.position = ccpAdd(newSpriteColumn.position, ccp((j * 42), 0));
//                        [newSpriteRow setScale:0.45f];
//                        [self addChild:newSpriteRow z:98 tag:11];
//                    }
//                }
//                
//                [self removeChild:selSprite cleanup:YES];
//                selSprite = nil;
//            } else {
//                [self removeChild:selSprite cleanup:YES];
//                selSprite = nil;            
//            }
//        }
//    }
//}

-(void) transport{
    if (transportState == 0) {
        DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"三轮车" GeneralItemType:GeneralItem_Vehicle];
        DAPlayerService *playService = [DAPlayerService sharePlayerService];
        if (playService.playerEntity.nMoney > vehicle.nNeedPrice) {
            isTransport = NO;
            
            [spriteTricycleAnimation runAction:[CCRotateTo actionWithDuration:0.1 angle:0]];
            CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.1 angle:-4.0];
            CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
            CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.1 angle:4.0];
            CCRotateTo *rotSeq = [CCSequence actions: rotLeft, rotCenter, rotRight, rotCenter, nil];
            [spriteTricycleAnimation runAction:[CCRepeatForever actionWithAction:rotSeq]];
            
            [spriteTricycleAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(930, 200)]];
            [NSTimer scheduledTimerWithTimeInterval:(5.0f + 1.5f) target:self selector:@selector(moveBackTricycle) userInfo:nil repeats:NO];
            transportation.isEnabled = isTransport;
        } else {
            womanWarn = [[WomanWarning alloc] init];
            [self addChild: womanWarn z:99];
            [womanWarn transportWarning];
        }
    }else if(transportState == 1){
        DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"农用车" GeneralItemType:GeneralItem_Vehicle];
        DAPlayerService *playService = [DAPlayerService sharePlayerService];
        if (playService.playerEntity.nMoney > vehicle.nNeedPrice) {
            isTransport = NO;
            
            [spriteTractorAnimation runAction:[CCRotateTo actionWithDuration:0.1 angle:0]];
            CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.1 angle:-4.0];
            CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
            CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.1 angle:4.0];
            CCRotateTo *rotSeq = [CCSequence actions: rotLeft, rotCenter, rotRight, rotCenter, nil];
            [spriteTractorAnimation runAction:[CCRepeatForever actionWithAction:rotSeq]];
            
            [spriteTractorAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(930, 200)]];
            
            [NSTimer scheduledTimerWithTimeInterval:(5.0f + 1.5f) target:self selector:@selector(moveBackTractor) userInfo:nil repeats:NO];
            transportation.isEnabled = isTransport;
        } else {
            womanWarn = [[WomanWarning alloc] init];
            [self addChild: womanWarn z:99];
            [womanWarn transportWarning];
        }
    }else if(transportState == 2){
        DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"货车" GeneralItemType:GeneralItem_Vehicle];
        
        DAPlayerService *playService = [DAPlayerService sharePlayerService];
        if (playService.playerEntity.nMoney > vehicle.nNeedPrice) {
            isTransport = NO;
            
            [spriteSmallWagonAnimation runAction:[CCRotateTo actionWithDuration:0.1 angle:0]];
            CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.1 angle:-4.0];
            CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
            CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.1 angle:4.0];
            CCRotateTo *rotSeq = [CCSequence actions: rotLeft, rotCenter, rotRight, rotCenter, nil];
            [spriteSmallWagonAnimation runAction:[CCRepeatForever actionWithAction:rotSeq]];
            
            [spriteSmallWagonAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(930, 200)]];
            [NSTimer scheduledTimerWithTimeInterval:(5.0f + 1.5f) target:self selector:@selector(moveBackSmallWagon) userInfo:nil repeats:NO];
            transportation.isEnabled = isTransport;
        } else {
            womanWarn = [[WomanWarning alloc] init];
            [self addChild: womanWarn z:99];
            [womanWarn transportWarning];
        }
    }else if(transportState == 3){
        DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"卡车" GeneralItemType:GeneralItem_Vehicle];
        DAPlayerService *playService = [DAPlayerService sharePlayerService];
        if (playService.playerEntity.nMoney > vehicle.nNeedPrice) {
            isTransport = NO;
            
            [spriteBigWagonAnimation runAction:[CCRotateTo actionWithDuration:0.1 angle:0]];
            CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.1 angle:-4.0];
            CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
            CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.1 angle:4.0];
            CCRotateTo *rotSeq = [CCSequence actions: rotLeft, rotCenter, rotRight, rotCenter, nil];
            [spriteBigWagonAnimation runAction:[CCRepeatForever actionWithAction:rotSeq]];
            
            [spriteBigWagonAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(930, 200)]];
            [NSTimer scheduledTimerWithTimeInterval:(5.0f + 1.5f) target:self selector:@selector(moveBackBigWagon) userInfo:nil repeats:NO];
            transportation.isEnabled = isTransport;
        } else {
            womanWarn = [[WomanWarning alloc] init];
            [self addChild: womanWarn z:99];
            [womanWarn transportWarning];
        }
    }else if(transportState == 4){
        DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"集装箱" GeneralItemType:GeneralItem_Vehicle];
        DAPlayerService *playService = [DAPlayerService sharePlayerService];
        if (playService.playerEntity.nMoney > vehicle.nNeedPrice) {
            isTransport = NO;
            
            [spriteContainerCarAnimation runAction:[CCRotateTo actionWithDuration:0.1 angle:0]];
            CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.1 angle:-4.0];
            CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
            CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.1 angle:4.0];
            CCRotateTo *rotSeq = [CCSequence actions: rotLeft, rotCenter, rotRight, rotCenter, nil];
            [spriteContainerCarAnimation runAction:[CCRepeatForever actionWithAction:rotSeq]];
            
            [spriteContainerCarAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(930, 200)]];
            [NSTimer scheduledTimerWithTimeInterval:(5.0f + 1.5f) target:self selector:@selector(moveBackContainer) userInfo:nil repeats:NO];
            transportation.isEnabled = isTransport;
        } else {
            womanWarn = [[WomanWarning alloc] init];
            [self addChild: womanWarn z:99];
            [womanWarn transportWarning];
        }
    }else if(transportState == 5){
        DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"直升机" GeneralItemType:GeneralItem_Vehicle];
        DAPlayerService *playService = [DAPlayerService sharePlayerService];
        if (playService.playerEntity.nMoney > vehicle.nNeedPrice) {
            isTransport = NO;
            
            [spriteHelicopterAnimation runAction:[CCRotateTo actionWithDuration:0.1 angle:0]];
            CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.1 angle:-4.0];
            CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
            CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.1 angle:4.0];
            CCRotateTo *rotSeq = [CCSequence actions: rotLeft, rotCenter, rotRight, rotCenter, nil];
            [spriteHelicopterAnimation runAction:[CCRepeatForever actionWithAction:rotSeq]];
            
            [spriteHelicopterAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(930, 200)]];
            [NSTimer scheduledTimerWithTimeInterval:(5.0f + 1.5f) target:self selector:@selector(moveBackHelicopter) userInfo:nil repeats:NO];
            transportation.isEnabled = isTransport;
        } else {
            womanWarn = [[WomanWarning alloc] init];
            [self addChild: womanWarn z:99];
            [womanWarn transportWarning];
        }
    }
}

-(void) moveBackTricycle{
    DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"三轮车" GeneralItemType:GeneralItem_Vehicle];
    DAPlayerService *warePlayService = [DAPlayerService sharePlayerService];
    [warePlayService SellItemInWare:sellItems Vehilce:vehicle.sysName];
    [sellItems release];
    sellItems = nil;
    sellItems = [[NSMutableArray alloc] init];
    //[self refreshWareHouse];
    
    [spriteTricycleAnimation setFlipX:YES];
    [spriteTricycleAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(638, 200)]];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(tricycleAniState) userInfo:nil repeats:NO];
    for (int i = 0; i < 27; i++) {
        [self removeChildByTag:11 cleanup:YES];
    }
    
}

-(void) moveBackTractor{
    DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"农用车" GeneralItemType:GeneralItem_Vehicle];
    DAPlayerService *warePlayService = [DAPlayerService sharePlayerService];
    [warePlayService SellItemInWare:sellItems Vehilce:vehicle.sysName];
    [sellItems release];
    sellItems = nil;
    sellItems = [[NSMutableArray alloc] init];
    //[self refreshWareHouse];
    
    [spriteTractorAnimation setFlipX:YES];
    [spriteTractorAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(638, 200)]];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(tractorAniState) userInfo:nil repeats:NO];
    for (int i = 0; i < 27; i++) {
        [self removeChildByTag:11 cleanup:YES];
    }
}

-(void) moveBackSmallWagon{
    DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"货车" GeneralItemType:GeneralItem_Vehicle];
    DAPlayerService *warePlayService = [DAPlayerService sharePlayerService];
    [warePlayService SellItemInWare:sellItems Vehilce:vehicle.sysName];
    [sellItems release];
    sellItems = nil;
    sellItems = [[NSMutableArray alloc] init];
    //[self refreshWareHouse];
    
    [spriteSmallWagonAnimation setFlipX:YES];
    [spriteSmallWagonAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(638, 200)]];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(samllWagonAniState) userInfo:nil repeats:NO];
    for (int i = 0; i < 27; i++) {
        [self removeChildByTag:11 cleanup:YES];
    }
    
}

-(void) moveBackBigWagon{
    DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"卡车" GeneralItemType:GeneralItem_Vehicle];
    DAPlayerService *warePlayService = [DAPlayerService sharePlayerService];
    [warePlayService SellItemInWare:sellItems Vehilce:vehicle.sysName];
    [sellItems release];
    sellItems = nil;
    sellItems = [[NSMutableArray alloc] init];
    //[self refreshWareHouse];
    
    [spriteBigWagonAnimation setFlipX:YES];
    [spriteBigWagonAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(638, 200)]];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(bigWagonAniState) userInfo:nil repeats:NO];
    for (int i = 0; i < 27; i++) {
        [self removeChildByTag:11 cleanup:YES];
    }
}

-(void) moveBackContainer{
    DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"集装箱" GeneralItemType:GeneralItem_Vehicle];
    DAPlayerService *warePlayService = [DAPlayerService sharePlayerService];
    [warePlayService SellItemInWare:sellItems Vehilce:vehicle.sysName];
    [sellItems release];
    sellItems = nil;
    sellItems = [[NSMutableArray alloc] init];
    //[self refreshWareHouse];
    
    [spriteContainerCarAnimation setFlipX:YES];
    [spriteContainerCarAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(638, 200)]];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(containerAniState) userInfo:nil repeats:NO];
    for (int i = 0; i < 27; i++) {
        [self removeChildByTag:11 cleanup:YES];
    }
}

-(void) moveBackHelicopter{
    DAItemVehicle *vehicle = [[DAItemService shareService] GetGeneralItemByName:@"直升机" GeneralItemType:GeneralItem_Vehicle];
    DAPlayerService *warePlayService = [DAPlayerService sharePlayerService];
    [warePlayService SellItemInWare:sellItems Vehilce:vehicle.sysName];
    [sellItems release];
    sellItems = nil;
    sellItems = [[NSMutableArray alloc] init];
    //[self refreshWareHouse];
    
    [spriteHelicopterAnimation setFlipX:YES];
    [spriteHelicopterAnimation runAction:[CCMoveTo actionWithDuration:5 position:ccp(638, 200)]];
    [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(helicopterAniState) userInfo:nil repeats:NO];
    for (int i = 0; i < 27; i++) {
        [self removeChildByTag:11 cleanup:YES];
    }
}

-(void) tractorAniState{
    [spriteTractorAnimation setFlipX:NO];
    [spriteTractorAnimation stopAllActions];
    CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
    CCRotateTo *rotSeq = [CCSequence actions: rotCenter, nil];
    [spriteTractorAnimation runAction:rotSeq];
    
    isTransport = YES;
    transportation.isEnabled = isTransport;
}

-(void) tricycleAniState{
    [spriteTricycleAnimation setFlipX:NO];
    [spriteTricycleAnimation stopAllActions];
    CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
    CCRotateTo *rotSeq = [CCSequence actions: rotCenter, nil];
    [spriteTricycleAnimation runAction:rotSeq];
    
    isTransport = YES;
    transportation.isEnabled = isTransport;
}

-(void) samllWagonAniState{
    [spriteSmallWagonAnimation setFlipX:NO];
    [spriteSmallWagonAnimation stopAllActions];
    CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
    CCRotateTo *rotSeq = [CCSequence actions: rotCenter, nil];
    [spriteSmallWagonAnimation runAction:rotSeq];
    
    isTransport = YES;
    transportation.isEnabled = isTransport;
}

-(void) bigWagonAniState{
    [spriteBigWagonAnimation setFlipX:NO];
    [spriteBigWagonAnimation stopAllActions];
    CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
    CCRotateTo *rotSeq = [CCSequence actions: rotCenter, nil];
    [spriteBigWagonAnimation runAction:rotSeq];

    
    isTransport = YES;
    transportation.isEnabled = isTransport;
}

-(void) containerAniState{
    [spriteContainerCarAnimation setFlipX:NO];
    [spriteContainerCarAnimation stopAllActions];
    CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
    CCRotateTo *rotSeq = [CCSequence actions: rotCenter, nil];
    [spriteContainerCarAnimation runAction:rotSeq];
    
    isTransport = YES;
    transportation.isEnabled = isTransport;
}

-(void) helicopterAniState{
    [spriteHelicopterAnimation setFlipX:NO];
    [spriteHelicopterAnimation stopAllActions];
    CCRotateTo *rotCenter = [CCRotateBy actionWithDuration:0.1 angle:0.0];
    CCRotateTo *rotSeq = [CCSequence actions: rotCenter, nil];
    [spriteHelicopterAnimation runAction:rotSeq];
    
    isTransport = YES;
    transportation.isEnabled = isTransport;
}


-(void) unload{
//    for (int i = 0; i < 27; i++) {
//        [self removeChildByTag:11 cleanup:YES];
//    }
    DAPlayerService *warePlayerService = [DAPlayerService sharePlayerService];
    
    [warePlayerService AddItemFromHenHouseByName:@"鸡蛋" ItemNum:1];
    [warePlayerService AddItemFromHenHouseByName:@"野鸡蛋" ItemNum:2];
    [warePlayerService AddItemFromHenHouseByName:@"火鸡蛋" ItemNum:3];
    [warePlayerService AddItemFromHenHouseByName:@"珍珠鸡蛋" ItemNum:4];
    [warePlayerService AddItemFromHenHouseByName:@"贵妃鸡蛋" ItemNum:5];
    [warePlayerService AddItemFromHenHouseByName:@"天鹅蛋" ItemNum:6];
    [warePlayerService AddItemFromHenHouseByName:@"鸵鸟蛋" ItemNum:7];
    [warePlayerService AddItemFromHenHouseByName:@"孔雀蛋" ItemNum:8];
    
    [warePlayerService AddProductItemToWareHouseByName:@"蛋挞" ItemNum:9];
    [warePlayerService AddProductItemToWareHouseByName:@"草莓蛋糕" ItemNum:10];
    [warePlayerService AddProductItemToWareHouseByName:@"鸡蛋面" ItemNum:11];
    
    DAWareHouseService *warehouseService = [DAWareHouseService shareWareHouseService];
    
    [warehouseService AddPoultryItemByName:@"成熟鸡" ItemNum:9];
    [warehouseService AddPoultryItemByName:@"成熟野鸡" ItemNum:9];
}

-(void) goToMap{
    
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
    
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WorldLayer *worldLayer = [WorldLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:worldLayer];
    
    Firstlayermenu *menuLayer = [Firstlayermenu node];
    [scene addChild:menuLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
}


-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLoaction = [self convertTouchToNodeSpace: touch];
    [self selectSpriteForTouch:touchLoaction];
    
    return TRUE;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
    CGPoint oldTouchLocation = [touch previousLocationInView:touch.view];
    oldTouchLocation = [[CCDirector sharedDirector] convertToGL:oldTouchLocation];
    oldTouchLocation = [self convertToNodeSpace:oldTouchLocation];
    
    CGPoint translation = ccpSub(touchLocation, oldTouchLocation);
    [self panForTranslation:translation];
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
//    [self goodToGird:touchLocation];
}


///////////////////////////////////////////////

-(void) creatTractor{
    [self removeTractor];
    [self removeTricycle];
    [self removeSmallWagon];
    [self removeBigWagon];
    [self removeContainerCar];
    [self removeHelicopter];
    
    [self vehicleGrid];
    
    if (spriteTractor != nil && spriteTractorAnimation != nil){
        [self displayTractor];
        if (!CGPointEqualToPoint(spriteTractorAnimation.position, ccp(638, 200)))
        {
            isTransport = NO;
        }
        return;
    }
    
    spriteTractor = [CCSprite spriteWithFile:@"tractor_0.png"];
    spriteTractor.position = ccp(785,540);
    [self addChild:spriteTractor z:99];
    
    spriteTractorAnimation = [CCSprite spriteWithFile:@"tractor_1.png"];
    spriteTractorAnimation.position = ccp(638, 200);
    [self addChild:spriteTractorAnimation z:99];
}

-(void) creatTricycle{
    [self removeTractor];
    [self removeTricycle];
    [self removeSmallWagon];
    [self removeBigWagon];
    [self removeContainerCar];
    [self removeHelicopter];
    
    [self vehicleGrid];
    
    if (spriteTricycle != nil && spriteTricycleAnimation != nil){
        [self displayTricycle];
        if (!CGPointEqualToPoint(spriteTricycleAnimation.position, ccp(638, 200)))
        {
            isTransport = NO;
        }
        return;
    }
    
    spriteTricycle = [CCSprite spriteWithFile:@"tricycle_0.png"];
    spriteTricycle.position = ccp(785,537);
    [self addChild:spriteTricycle z:99];
    
    spriteTricycleAnimation = [CCSprite spriteWithFile:@"tricycle_1.png"];
    spriteTricycleAnimation.position = ccp(638, 200);
    [self addChild:spriteTricycleAnimation z:99];
}

-(void) creatSmallWagon{
    [self removeTractor];
    [self removeTricycle];
    [self removeSmallWagon];
    [self removeBigWagon];
    [self removeContainerCar];
    [self removeHelicopter];
    
    [self vehicleGrid];
    
    if (spriteSmallWagon != nil && spriteSmallWagonAnimation != nil){
        [self displaySmallWagon];
        if (!CGPointEqualToPoint(spriteSmallWagonAnimation.position, ccp(638, 200)))
        {
            isTransport = NO;
        }
        return;
    }
    
    spriteSmallWagon = [CCSprite spriteWithFile:@"S wagon_0.png"];
    spriteSmallWagon.position = ccp(785,540);
    [self addChild:spriteSmallWagon z:99];
    
    spriteSmallWagonAnimation = [CCSprite spriteWithFile:@"S wagon_1.png"];
    spriteSmallWagonAnimation.position = ccp(638, 200);
    [self addChild:spriteSmallWagonAnimation z:99];
}

-(void) creatBigWagon{
    [self removeTractor];
    [self removeTricycle];
    [self removeSmallWagon];
    [self removeBigWagon];
    [self removeContainerCar];
    [self removeHelicopter];
    
    [self vehicleGrid];
    
    if (spriteBigWagon != nil && spriteBigWagonAnimation != nil){
        [self displayBigWagon];
        if (!CGPointEqualToPoint(spriteBigWagonAnimation.position, ccp(638, 200)))
        {
            isTransport = NO;
        }
        return;
    }
    
    spriteBigWagon = [CCSprite spriteWithFile:@"B wagon_0.png"];
    spriteBigWagon.position = ccp(785,537);
    [self addChild:spriteBigWagon z:99];
    
    spriteBigWagonAnimation = [CCSprite spriteWithFile:@"B wagon_1.png"];
    spriteBigWagonAnimation.position = ccp(638, 200);
    [self addChild:spriteBigWagonAnimation z:99];
}

-(void) creatContainerCar{
    [self removeTractor];
    [self removeTricycle];
    [self removeSmallWagon];
    [self removeBigWagon];
    [self removeContainerCar];
    [self removeHelicopter];
    
    [self vehicleGrid];
    
    if (spriteContainerCar != nil && spriteContainerCarAnimation != nil){
        [self displayContainerCar];
        if (!CGPointEqualToPoint(spriteContainerCarAnimation.position, ccp(638, 200)))
        {
            isTransport = NO;
        }
        return;
    }
    
    spriteContainerCar = [CCSprite spriteWithFile:@"container car_0.png"];
    spriteContainerCar.position = ccp(785,537);
    [self addChild:spriteContainerCar z:99];
    
    spriteContainerCarAnimation = [CCSprite spriteWithFile:@"container car_1.png"];
    spriteContainerCarAnimation.position = ccp(638, 200);
    [self addChild:spriteContainerCarAnimation z:99];
}

-(void) creatHelicopter{
    [self removeTractor];
    [self removeTricycle];
    [self removeSmallWagon];
    [self removeBigWagon];
    [self removeContainerCar];
    [self removeHelicopter];
    
    [self vehicleGrid];
    
    if (spriteHelicopter != nil && spriteHelicopterAnimation != nil){
        [self displayHelicopter];
        if (!CGPointEqualToPoint(spriteHelicopterAnimation.position, ccp(638, 200)))
        {
            isTransport = NO;
        }
        return;
    }
    
    spriteHelicopter = [CCSprite spriteWithFile:@"helicopter_0.png"];
    spriteHelicopter.position = ccp(785,537);
    [self addChild:spriteHelicopter z:99];
    
    spriteHelicopterAnimation = [CCSprite spriteWithFile:@"helicopter_1.png"];
    spriteHelicopterAnimation.position = ccp(638, 200);
    [self addChild:spriteHelicopterAnimation z:99];
}


-(void) removeTractor{
    spriteTractor.visible = NO;
    spriteTractorAnimation.visible = NO;
}

-(void) removeTricycle{
    spriteTricycle.visible = NO;
    spriteTricycleAnimation.visible = NO;
}

-(void) removeSmallWagon{
    spriteSmallWagon.visible = NO;
    spriteSmallWagonAnimation.visible = NO;
}

-(void) removeBigWagon{
    spriteBigWagon.visible = NO;
    spriteBigWagonAnimation.visible = NO;
}

-(void) removeContainerCar{
    spriteContainerCar.visible = NO;
    spriteContainerCarAnimation.visible = NO;
}

-(void) removeHelicopter{
    spriteHelicopter.visible = NO;
    spriteHelicopterAnimation.visible = NO;
}

-(void) displayTractor{
    spriteTractor.visible = YES;
    spriteTractorAnimation.visible = YES;
}

-(void) displayTricycle{
    spriteTricycle.visible = YES;
    spriteTricycleAnimation.visible = YES;
}

-(void) displaySmallWagon{
    spriteSmallWagon.visible = YES;
    spriteSmallWagonAnimation.visible = YES;
}

-(void) displayBigWagon{
    spriteBigWagon.visible = YES;
    spriteBigWagonAnimation.visible = YES;
}

-(void) displayContainerCar{
    spriteContainerCar.visible = YES;
    spriteContainerCarAnimation.visible = YES;
}

-(void) displayHelicopter
{
    spriteHelicopter.visible = YES;
    spriteHelicopterAnimation.visible = YES;
}

@end
