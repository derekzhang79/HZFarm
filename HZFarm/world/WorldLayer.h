//
//  HelloWorldLayer.h
//  MapTest
//
//  Created by Any on 12-3-22.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Tilednode.h"
#import "Worldlayerprotocol.h"
#import "Henhouse.h"
#import "TECHLAB.h"
#import "NOWSPRITE.h"
#import "Staticfunctionalobject.h"
#import "DAPlayerService.h"
#import "DAWorldMapService.h"
#import "SceneManager.h"
#import "Speakermenu.h"
#import "sperkwomenprotocol.h"
@class MySprite;

// HelloWorldLayer
typedef enum
{
	house = 0,
	road=1,
    researchinstitution=2,
    staticobjection,
EnemyType_MAX,
} NOWITEMIMAGETypes;
//CGPoint NOWPOSITION;


@interface WorldLayer : CCLayer<Worldlayerprotocol>
{
    MySprite *sp;
    CCTMXTiledMap *map;
     CGFloat _mapScale;  
    CGFloat _lastscale;//地图缩放
    CGFloat initialDistance;
    CGFloat  zoomFactor;
    BOOL CANMOVE;BOOL  START;
    CGPoint middlepoint;
    CGPoint TOUCHBIGANPOINT;
    CGFloat  TOUCHBIGANTIME;
    CGFloat startscale;
    BOOL ISTOWCOUNT;
    NSTimer *connectionTimer;
    BOOL CANMOVEanimation;
    BOOL HASBIGAN;
    CCEaseOut* ease;
    CGPoint NOWPOSITION;
    CGPoint NOWVIEWPOSITION;
    TECHLAB *NOWITEMIMAGE;
   //   CCSprite *NOWITEMIMAGEsprite;
    BOOL MOVEMENU;
    NSMutableArray *TILEDSARRAY;
    NOWITEMIMAGETypes nowmenuimageTypes;
    CGPoint LASTROAD;
    Henhouse *NOWHENHOUSE;
    CCMenuItemImage *sure;
    Staticfunctionalobject *NOWSTATICOBJECT;
    BOOL OBJECTISPUTDOWN;
    DAPlayerService *daplayerservice;
    DAWorldMapService *daworldmapservice;
    NSString *objectid;
    Speakermenu *womenspeaker;
    id <sperkwomenprotocol> Sperkwomenprotocol;
    CGPoint starttaplocation;
    CGPoint expendlandcenterpositionoftiels;
    
    CCSprite *expend1; CCLabelTTF   *words ;
    CCMenu *inandlevelup;
    NSString *aaa;
    
    NSString *nowhenhouseiid;
    BOOL CANDOUBLETAP;
    CGPoint LASTLANDPOSITION;
    NSString *pathoftield;
    NSMutableArray *datablue;
    NSMutableArray *dataroad;

}

@property (nonatomic, retain)CCSprite *backGround;//背景
@property (nonatomic, retain)MySprite *sp;//精灵
@property (nonatomic, retain)CCTMXTiledMap *map;//地图文件
@property (readwrite, retain)    Speakermenu *womenspeaker;
@property (nonatomic, retain)id <sperkwomenprotocol> Sperkwomenprotocol;
@property (nonatomic, retain)  NSString *aaa;
@property (nonatomic, retain) NSString *nowhenhouseiid;
@property (readwrite, retain) NSString *iidstring1;
@property (readwrite, retain) NSString *iidstring2;//地图文件
+(WorldLayer*)getSharedWorldLayere;
-(void)addHenHouseinview;

-(void)addHenhouseindata;

-(void)addTECHLABinview;

-(void)addTECHLABindata;

-(void)addstaticobjectinview;

-(void)addstaticobjectindata;

-(void)showtheiconofhouse:(int)tagg ISSHOW:(BOOL)SHOW ICONKIND:(EFFECTIONSTOHOUSE)iconkind ISSENDERCALMDOWN:(bool)ISDOWN;
-(void)showtheexpend:(CGPoint)cubelocation;
-(void)newonehenhouse;
-(void)newoneTECHLAB:(int)level;
-(void)newoneSTATICOBJECT:(int)level;
-(void)newonehenhouse:(int)level ;
//-()

-(CGPoint) tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap;
-(CGPoint) locationPosFromtilen:(CGPoint)tilelocation tileMap:(CCTMXTiledMap*)tileMap;
//视图位置转换为地图位置
- (CGPoint)viewPosToMapPos:(CGPoint)pos;

//地图位置转换为视图位置
- (CGPoint)MapPosToViewPos:(CGPoint)pos;

//世界位置转换为视图位置
- (CGPoint)bgPosToViewPos:(CGPoint)pos;

//视图位置转换为世界位置
- (CGPoint)viewPosToBgPos:(CGPoint)pos;

//判断精灵是否在有效地图区域
- (BOOL)isInMap:(CGPoint)pos;

//世界位置转换为地图位置
- (CGPoint)bgPosToMapPos:(CGPoint)pos;
//缩放地图
- (void)resize:(CGFloat)newScale;
//地图位置转换为世界位置
- (CGPoint)mapPosToBgPos:(CGPoint)pos;

//判断精灵是否在地图的阴影区域
- (BOOL)IsInShadow:(MySprite*)sprite Map:(CCTMXTiledMap*)mapData;
-(void)retuenonehenhouse:(NSString *)sender  ISFIRSTTAPED:(BOOL)FIRSTTAP;
-(void)retuenonehenhouse2:(CGPoint)point ;
// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
