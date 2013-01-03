//
//  HelloWorldLayer.h
//  WareHouse
//
//  Created by hzbc on 4/6/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import <UIKit/UIKit.h>
#import "SWScrollView.h"
#import "DAItemInWareHouse.h"
#import "WomanWarning.h"

// WareHouseLayer
@interface WareHouseLayer : CCLayer
{
    CCSprite *background;                     //界面背景
    CCSprite *selSprite;                      //当前选中的精灵
    NSMutableArray *selectSprites;            //储存可选择精灵的数组
    NSMutableArray *labelArray;
    
    NSMutableArray *allButtons;
    NSMutableArray *itemsArray;
    NSMutableArray *sellItems;
    
    DAItemInWareHouse *itemWare;
    
    CCSprite *spriteTractor;                  //tractor工具精灵
    CCSprite *spriteTricycle;                 //tricycle工具精灵
    CCSprite *spriteSmallWagon;               //SmallWagon工具精灵
    CCSprite *spriteBigWagon;                 //BigWagon工具精灵
    CCSprite *spriteContainerCar;             //ContainerCar工具精灵
    CCSprite *spriteHelicopter;               //Helicopter工具精灵
    CCSprite *spriteTractorAnimation;         //tractor工具的移动动画精灵
    CCSprite *spriteTricycleAnimation;        //tricycle工具得移动动画精灵
    CCSprite *spriteSmallWagonAnimation;      //SmallWagon工具的移动动画精灵
    CCSprite *spriteBigWagonAnimation;        //BigWagon工具得移动动画精灵
    CCSprite *spriteContainerCarAnimation;    //ContainerCar工具得移动动画精灵
    CCSprite *spriteHelicopterAnimation;      //Helicopter工具得移动动画精灵
    BOOL tractorFlag;
    BOOL smallWagonFlag;
    BOOL bigWagonFlag;
    BOOL containerCarFlag;
    BOOL helicopterFlag;
    
    NSInteger  state;                         //交通工具的存在状态（不同数字表示不同交通工具）
    NSInteger  transportState;                //交通工具的运输状态（不同数字表示不同交通工具）
    BOOL isTransport;                         //判断运送按钮是否可用的状态
    
    
    CCMenuItemImage *transportation;          //运送按钮
    
    SWScrollView *scrollView;
    
    WomanWarning *womanWarn;
}

@property (nonatomic) NSInteger state;
@property (nonatomic, assign) NSString *itemName;
//@property (nonatomic, retain) GoodsGridLayer *goodsGridLayer;

-(void) vehicleGrid;
-(void) refreshWareHouse;


-(void) creatTractor;                         //tractor工具的创建
-(void) creatTricycle;                        //tricycle工具的创建
-(void) creatSmallWagon;                      //SmallWagon工具的创建
-(void) creatBigWagon;                        //BigWagon工具的创建
-(void) creatContainerCar;                    //ContainerCar工具的创建
-(void) creatHelicopter;                      //Helicopter工具的创建
-(void) removeTractor;                        //tractor工具的移除
-(void) removeTricycle;                       //tricycle工具的移除
-(void) removeSmallWagon;                     //SmallWagon工具的移除
-(void) removeBigWagon;                       //BigWagon工具的移除
-(void) removeContainerCar;                   //ContainerCar工具的移除
-(void) removeHelicopter;                     //Helicopter工具的移除
-(void) displayTractor;                       //tractor工具的保持
-(void) displayTricycle;                      //tricycle工具的保持
-(void) displaySmallWagon;                    //SmallWagon工具的保持
-(void) displayBigWagon;                      //BigWagon工具的保持
-(void) displayContainerCar;                  //ContainerCar工具的保持
-(void) displayHelicopter;                    //Helicopter工具的保持

@end
