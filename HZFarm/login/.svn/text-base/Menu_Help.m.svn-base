//
//  Menu_Help.m
//  MapTest
//
//  Created by mac on 12-4-27.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Menu_Help.h"
#import "Import.h"
#import "SceneManager.h"


@implementation Menu_Help

@synthesize userItemScrollView;


-(void) dealloc
{
    [userItemScrollView release];
    userItemScrollView = nil;
    [super dealloc];
}


-(id) init
{
    if (self = [super init])
    {
        int width = [[CCDirector sharedDirector] winSize].width;
        int height = [[CCDirector sharedDirector] winSize].height;
        
        CCSprite *background = [CCSprite spriteWithFile:@"base maps.png"];
        background.position = ccp(width/2, height/2);
        [self addChild:background];
        
        CCSprite *bg = [CCSprite spriteWithFile:@"help底图.png"];  
        bg.position = CCXY(512, 388);
        [self addChild:bg];
        
        CCSprite *title = [CCSprite spriteWithFile:@"帮助条幅.png"];
        title.position = CCXY(512, 134);
        [self addChild:title];
        
        
        CCMenuItemImage *back = [CCMenuItemImage itemFromNormalImage:@"back_0.png" selectedImage:@"back_1.png" disabledImage:@"back_0.png" target:self selector:@selector(back:)];
        CCMenu *menu4 = [CCMenu menuWithItems:back, nil];
        menu4.position = CCXY(808, 603);
        [self addChild:menu4 z: 1];
        
        
        /******************Help*************************/
        CCLabelTTF *label = [CCLabelTTF labelWithString:@"1、如何开始游戏？\n获得更多的金币和经验来建造更多的建筑和生物，使整个农场更加热闹！\n\n2、怎样增加建筑上限？\n获得更多的经验以提升农场等级，这样就可以建造更多的建筑了。\n\n3、怎样建造建筑？\n点击屏幕右下角的菜单按钮，找到建筑选项，并点击进入建筑菜单，选择你想建造的建筑并为他找到合适的位置就可以建造了。\n\n4、鸡舍有什么用？\n你可以在鸡舍中饲养生物，并通过生物的成长和产出换来金币。\n\n5、科研楼有什么用？\n在科研楼影响范围内的鸡舍可以饲养更高级的生物。\n\n6、加工厂有什么用？\n在加工厂影响范围内的鸡舍可以将生物生产的产品直接加工为高级加工品。\n\n7、怎样饲养生物？\n点击鸡舍并进入鸡舍的场景，用手拖动场景下方的生物列表中的生物，并将它拖动到屏幕中，这样它就会在你的鸡舍中快乐的开始成长了。\n\n8、怎样让生物下蛋？\n当鸡舍内的生物成熟后，生物就会提出想要下蛋的需求，这时候只要点击需要下蛋的生物，它就会自行完成下蛋过程。\n\n9、怎样获得金币？\n在仓库中将将产品拖选到运输车辆的载货栏上，点击运输按钮，产品就会被直接送到城镇中卖掉了，但这可能要在路上消耗一定的时间。\n\n10、生物饥饿/口渴了怎么办？\n点击鸡舍中间的喂食器和给水器可填满它们，这样即解决了生物饥饿/口渴的需求，但是喂食器和给水器中的供给也会根据鸡舍中生物的消耗而不断减少，要及时添加。\n\n11、生物饥饿或者口渴了会有什么影响？\n生物饥饿或者口渴的时候会停止生长和产蛋。\n\n12、放置装饰物能为我带来什么好处？\n放置装饰物能为周围的建筑带来更好的收益。\n\n13、我的土地用完了怎么办？\n点击你的土地以外的地点，可以进入扩张土地的选项。\n\n14、建筑合成有什么用？\n合成后的建筑相应功能会强化很多。\n\n15、怎么合成建筑？\n在商店中购买相应的合成许可后，只要在地图上两个相邻位置建造相同的可合成建筑，随后点击它们中的任何一个进入合成选项。\n\n16、为什么要修建公路？\n鸡舍需要建立在公路边上以便于将产品运输到仓库中去。" dimensions:CGSizeMake(624, 2500) alignment:UITextAlignmentLeft fontName:@"Verdana" fontSize:28];
        label.color = ccc3(73, 90, 32);
        
		CGSize size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp(0,0);
        
        /******************SWScrollView*************************/
        CGSize viewSize = CGSizeMake(624, 267);
        self.userItemScrollView = [SWScrollView viewWithViewSize:viewSize];
        self.userItemScrollView.anchorPoint = ccp(0.5f, 0.5f);
        self.userItemScrollView.position = CCXY(196, 510); //ccp(268, 291);
        self.userItemScrollView.contentOffset = ccp(0, -2250);
        CGSize viewContentSize = CGSizeMake(624, 2500);
        self.userItemScrollView.contentSize = viewContentSize;
        self.userItemScrollView.direction = SWScrollViewDirectionVertical;
        self.userItemScrollView.bounces = YES;
        
        [self addChild:userItemScrollView z:3];
        [self.userItemScrollView addChild:label];
        
        //[self scheduleUpdate];
    }
    return self;
}

-(void) back: (id)sender
{
    [SceneManager backLogin];
}

@end
