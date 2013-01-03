//
//  Worldlayerprotocol.h
//  MapTest
//
//  Created by hzbc on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol Worldlayerprotocol <NSObject>
typedef enum
{
	/*
     *factoryeffect = 0,
     techlabeffect,
     windwilleffect,
     */
    
	iTECHLABKIND = 0,//科研所
	iFACTORY=1,//加工厂
    iWINDMILL=2,//风车
   

    pool,//水池
    haystackeffect,//草垛
    guarderhouseeffect,//看守着小屋
    Palmtree,//棕榈树
    bambooeffect,//竹
    coconuttree,//椰子树
    peachtree,//桃树
    banian,//榕树
    willow,//柳树
    Spiritualtone,//灵石
    goldenflower,//金花
    
    
    IHENHOUSE,

    
    
    
 
    
    
} EFFECTIONSTOHOUSE;
   

-(void)addHenHouseinview;

-(void)addHenhouseindata;

-(void)addTECHLABinview;

-(void)addTECHLABindata;
-(void)addstaticobjectinview;

-(void)addstaticobjectindata;
-(void)showtheiconofhouse:(int)tagg ISSHOW:(BOOL)SHOW ICONKIND:(EFFECTIONSTOHOUSE)iconkind ISSENDERCALMDOWN:(bool)ISDOWN;

//menu
-(void)isshowthespeaker :(BOOL)show OBJECTKIND:(EFFECTIONSTOHOUSE)objectkind;
-(void)setthespeakerwords:(NSString *)worsd;
-(void)newonehenhouse:(int)level ;
-(void)retuenonehenhouse:(NSString *)sender ISFIRSTTAPED:(BOOL)FIRSTTAP;
-(void)retuenonehenhouse2:(CGPoint)point ;


@end
