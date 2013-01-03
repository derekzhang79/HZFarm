//
//  HelloWorldLayer.m
//  MapTest
//
//  Created by Any on 12-3-22.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//
//

#import "WorldLayer.h"
#import "Contents.h"
#import "MySprite.h"
#import "Henhouse.h"
#include "Firstlayermenu.h"
#import "Tilednode.h"
#import "TECHLAB.h"
#import "Sperkermenuservice.h"
#define TileMapNode 0
#define ADDEDNEWONJECT 4
#define  HOUSETAG   200
#define  TECHLABTAG   400
#define  MENUSURE    800
#define kFilename @"tilesdata.plist"
#define Henhousefilename @"house.plist"
#define TEchlabfilename @"TECHLAB.plist"

@implementation WorldLayer

@synthesize backGround,Sperkwomenprotocol,womenspeaker,aaa,iidstring1,iidstring2;
@synthesize sp;
@synthesize map;
//30,70 order not location
//24,82
static  WorldLayer *getSharedWorldLayere = nil;
+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	
	WorldLayer *layer = [WorldLayer node];
    Firstlayermenu *firstlayer=[Firstlayermenu node];
	[scene addChild: layer z:0];
	[scene addChild: firstlayer z:1];
	return scene;
}

+(WorldLayer*)getSharedWorldLayere
{
    if (getSharedWorldLayere == nil) {
        getSharedWorldLayere = [[self alloc] init];
    }
    return getSharedWorldLayere;
}


-(void)initfreshtheview//页面刷新鸡舍视图
{

  NSArray *henhousearray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
 
    for(int i=0;i<henhousearray.count;i++)
    {
        NSString *iid=[henhousearray objectAtIndex:i];
     DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iid];
  
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
       
        Henhouse *henhouse=[Henhouse Henhouseview:buildingentity.nLevel];
        henhouse.position=position;
        [self addChild:henhouse z:buildingentity.nZindex tag:buildingentity.nTag];
      henhouse.iid=iid;
        henhouse.worldlayerprotocoll=self;

    }
  
   NSArray *factoryarray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Processing];
    for(int i=0;i<factoryarray.count;i++)
    {
        NSString *iid=[factoryarray objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iid];
     
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        
        TECHLAB *factory=[TECHLAB TECHLABinview:FACTORY];
        factory.position=position;
        [self addChild:factory z:buildingentity.nZindex tag:buildingentity.nTag];
               
    }
      
      NSArray *techlabarray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Magic];
    for(int i=0;i<techlabarray.count;i++)
    {
        NSString *iid=[techlabarray objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService]  getBuildingByID:iid];
        EFFECTIONSTOHOUSE qqq;
       if([buildingentity.SysName isEqual:@"蓄水池"])
           qqq=pool;
       else if([buildingentity.SysName isEqual:@"草垛"])
            qqq=haystackeffect;
       else if([buildingentity.SysName isEqual:@"看守者小屋"])
            qqq=guarderhouseeffect;
       else if([buildingentity.SysName isEqual:@"棕榈树"])
            qqq=Palmtree;
       else if([buildingentity.SysName isEqual:@"竹"])
            qqq=bambooeffect;
      else  if([buildingentity.SysName isEqual:@"桃树"])
            qqq=peachtree;
      else  if([buildingentity.SysName isEqual:@"榕树"])
            qqq=banian;
     else   if([buildingentity.SysName isEqual:@"柳树"])
            qqq=willow;
      else  if([buildingentity.SysName isEqual:@"蛋灵石"])
            qqq=Spiritualtone;
      else  if([buildingentity.SysName isEqual:@"金花"])
            qqq=goldenflower;
      else  if([buildingentity.SysName isEqual:@"风车"])
            qqq=2;
       else if([buildingentity.SysName isEqual:@"一级科研楼"])
            qqq=0;
       else if([buildingentity.SysName isEqual:@"椰子树"])
           qqq=coconuttree;
        
        if(qqq>2)
        {
        Staticfunctionalobject *staticobject=[Staticfunctionalobject Staticfunctionalobjectinview :qqq];
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        staticobject.position=position;
        [self addChild:staticobject z:buildingentity.nZindex tag:buildingentity.nTag];
            
        }
        else
        {
            
            
            CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
            
            TECHLAB *techlab=[TECHLAB TECHLABinview:qqq];
            techlab.position=position;
            [self addChild:techlab z:buildingentity.nZindex tag:buildingentity.nTag];

        
        
        }
       /* switch (qqq) {
       
                 
                 
            case pool:
            {  Staticfunctionalobject *staticobject=[Staticfunctionalobject Staticfunctionalobjectinview:pool];
                 CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
                staticobject.position=position;
                [self addChild:staticobject z:buildingentity.nZindex tag:buildingentity.nTag];
            
            }
                break;
            case haystackeffect:
            {Staticfunctionalobject *staticobject=[Staticfunctionalobject Staticfunctionalobjectinview:pool];
                CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
                staticobject.position=position;
                [self addChild:staticobject z:buildingentity.nZindex tag:buildingentity.nTag];

                break;
                
            case guarderhouseeffect:
            {buildname=[NSString stringWithFormat:@"看守者小屋"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
                
            case Palmtree:
            {buildname=[NSString stringWithFormat:@"棕榈树"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
            case bambooeffect:
            {buildname=[NSString stringWithFormat:@"竹"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
                
            case coconuttree:
            {buildname=[NSString stringWithFormat:@"椰子树"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
                
            case peachtree:
            {buildname=[NSString stringWithFormat:@"桃树"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
                
            case banian:
            {buildname=[NSString stringWithFormat:@"榕树"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
                
            case willow:
            {buildname=[NSString stringWithFormat:@"柳树"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
            case Spiritualtone:
            {buildname=[NSString stringWithFormat:@"蛋灵石"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
            case goldenflower:
            {buildname=[NSString stringWithFormat:@"金花"];
                objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
            }
                break;
                
            default:
                break;
        }   
*/
       /* CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        
        TECHLAB *techlab=[TECHLAB TECHLABinview:TECHLABKIND];
        techlab.position=position;
        [self addChild:techlab z:buildingentity.nZindex tag:buildingentity.nTag];
        */
        
        
        
    }

   




}
-(void)andstieldroad:(CGPoint)point
{
    NSString *filepathroad = [[NSBundle mainBundle] pathForResource:@"road" ofType:@"plist"]; 
//  NSString *filepathroad   =[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/road.plist"];
 //    NSString *filepathroad = [[NSBundle mainBundle] pathForResource:@"road" ofType:@"plist"]; 
    NSMutableArray *dataall = [[NSMutableArray alloc] initWithContentsOfFile:filepathroad];
    NSMutableDictionary *roadlocation =  [NSMutableDictionary dictionaryWithCapacity:2];
    // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
 
    [roadlocation setObject:[NSNumber numberWithInt:point.x]  forKey:@"road-x"];
    [roadlocation setObject:[NSNumber numberWithInt:point.y]  forKey:@"road-y"];
    [dataall addObject:roadlocation];
    [dataall writeToFile:filepathroad atomically:YES];    


    [dataall release];


}
-(void)makebluenot:(CGPoint)point
{
    NSString *filepathblue = [[NSBundle mainBundle] pathForResource:@"blue" ofType:@"plist"]; 
    // NSString *filepathblue=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/blue.plist"];
    NSMutableArray *dataall = [[NSMutableArray alloc] initWithContentsOfFile:filepathblue];
    NSMutableDictionary *bluelocation =  [NSMutableDictionary dictionaryWithCapacity:2];
    // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
    
    [bluelocation setObject:[NSNumber numberWithInt:point.x]  forKey:@"blue-x"];
    [bluelocation setObject:[NSNumber numberWithInt:point.y]  forKey:@"blue-y"];
    [dataall addObject:bluelocation];
    [dataall writeToFile:filepathblue atomically:YES];    
    [dataall release];
    
    
    
    
}
-(void)tilednodeschangeiscanadd:(int )length CENTERPOSOTION:(CGPoint ) center CANORNOT:(BOOL) ANMOVE
{
     NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:center.x*160+center.y];
    [nowtiled setObject:[NSNumber numberWithBool:ANMOVE] forKey:@"ISCANADDOBJECT"];
    for(int minx=center.x-(length-1)/2;minx<=center.x+(length-1)/2;minx++)
        for(int miny=center.y-(length-1)/2;miny<=center.y+(length-1)/2;miny++)    
        {
            NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:minx*160+miny];
            [nowtiled setObject:[NSNumber numberWithBool:ANMOVE] forKey:@"ISCANADDOBJECT"];
        }   
   // NSString *filepathTECHLAB = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 
   // NSString *filepathTECHLAB=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
    NSString *filepathtield = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 
    [TILEDSARRAY writeToFile:filepathtield atomically:YES];

    
}
-(void)tilednodeschangeisblue:(int )length CENTERPOSOTION:(CGPoint ) center ISBLUE:(BOOL) ISBLUE
{
   // Tilednode *nowtiled=[TILEDSARRAY objectAtIndex:center.x*160+center.y];
    //nowtiled.ISCANADDOBJECT=CANMOVE;
    for(int minx=center.x-(length-1)/2;minx<=center.x+(length-1)/2;minx++)
    for(int miny=center.y-(length-1)/2;miny<=center.y+(length-1)/2;miny++)    
    {
        NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:minx*160+miny];
       [nowtiled setObject:[NSNumber numberWithBool:ISBLUE] forKey:@"ISBLUE"];
        
    }   
    NSString *filepathtield = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 
//    [TILEDSARRAY writeToFile:filepathtield atomically:YES];
    
  }
/*-(BOOL)ISCANADDOBJECTHOUSEINBLUE:(int )length CENTERPOSOTION:(CGPoint ) center 
{
    BOOL canmove=NO;
   // NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
  //  NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathhouse];
    

    // Tilednode *nowtiled=[TILEDSARRAY objectAtIndex:center.x*160+center.y];
    //nowtiled.ISCANADDOBJECT=CANMOVE;
    for(int minx=center.x-(length-1)/2;minx<=center.x+(length-1)/2+1;minx++)
        for(int miny=center.y-(length-1)/2-1;miny<=center.y+(length-1)/2;miny++)    
        {
            NSMutableDictionary *states = [TILEDSARRAY objectAtIndex:minx*160+miny ];
            BOOL CANMOVE2= [[states objectForKey:@"ISBLUE"] boolValue];
            canmove=canmove||CANMOVE2;
            
        }  

    return !canmove;
    
    
}
*/
-(BOOL)ISCANADDOBJECTINBLUE:(int )length CENTERPOSOTION:(CGPoint ) center 
{

    int count=0;
    
      
    
    //BOOL ISBLUE1=NO,ISBLUE2=NO,ISBLUE3=NO,ISBLUE4=NO;
  //  NSString *filepathblue = [[NSBundle mainBundle] pathForResource:@"blue" ofType:@"plist"];
   // NSString *filepathblue=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/blue.plist"];
   // NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathblue];
 //   int minx=center.x-(length-1)/2;int maxx=center.x+(length-1)/2;
 //   int miny=center.y-(length-1)/2-1;int maxy=center.y+(length-1)/2;   
    for(int i=0;i<datablue.count;i++)
    {
        NSMutableDictionary *states = [datablue objectAtIndex:i];
       // NSLog(@" %d,   %d   ",[[states objectForKey:@"blue-x"] intValue],[[states objectForKey:@"blue-y"] intValue]);
        if( abs(center.x- [[states objectForKey:@"blue-x"]intValue])<3+(length-1)/2&&abs(center.y-[[states objectForKey:@"blue-y"]   intValue])<3+(length-1)/2)
            ++count;
        if(count>=2)
            return YES;
    }
/*    for(int i=0;i<datablue.count;i++)
    {
        NSMutableDictionary *states = [datablue objectAtIndex:i];
        
        if( ccpDistance(ccp(maxx,miny), ccp([[states objectForKey:@"blue-x"] intValue],[[states objectForKey:@"blue-y"] intValue] ))<3)
            ISBLUE2=YES;
        
    }
    for(int i=0;i<datablue.count;i++)
    {
        NSMutableDictionary *states = [datablue objectAtIndex:i];
        
        if( ccpDistance(ccp(maxx,maxy), ccp([[states objectForKey:@"blue-x"] intValue],[[states objectForKey:@"blue-y"] intValue] ))<3)
            ISBLUE3=YES;
        
    }
    for(int i=0;i<datablue.count;i++)
    {
        NSMutableDictionary *states = [datablue objectAtIndex:i];
        
        if( ccpDistance(ccp(minx,maxy), ccp([[states objectForKey:@"blue-x"] intValue],[[states objectForKey:@"blue-y"] intValue] ))<3)
            ISBLUE4=YES;
        
    }
    if (ISBLUE1&&ISBLUE2&&ISBLUE3&&ISBLUE4) {
        NSLog(@"iiiii");
    }
 */
   // return ISBLUE1&&ISBLUE2&&ISBLUE3&&ISBLUE4;
    //NSLog(@"jjnj %d",count);
    
        return NO;



}
-(BOOL)ISCANADDOBJECTINROAD:(int )length CENTERPOSOTION:(CGPoint ) center 
{
    
    
    
    int count=0;
/// NSString *filepathblue = [[NSBundle mainBundle] pathForResource:@"road" ofType:@"plist"];
 //NSString *filepathblue=   [NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/road.plist"];
   /// NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathblue];
  //  int minx=center.x-(length-1)/2;int maxx=center.x+(length-1)/2;
  //  int miny=center.y-(length-1)/2-1;int maxy=center.y+(length-1)/2;   
    for(int i=0;i<dataroad.count;i++)
    {
        NSMutableDictionary *states = [dataroad objectAtIndex:i];
        if( abs(center.x- [[states objectForKey:@"road-x"]intValue])<2+(length-1)/2&&abs(center.y-[[states objectForKey:@"road-y"]   intValue])<2+(length-1)/2)
            count++;

        if(count>0)
            return NO;
    }
   /* for(int i=0;i<dataroad.count;i++)
    {
        NSMutableDictionary *states = [dataroad objectAtIndex:i];
        
        if( ccpDistance(ccp(maxx,miny), ccp([[states objectForKey:@"road-x"] intValue],[[states objectForKey:@"road-y"] intValue] ))<2)
            ISBLUE2=NO;
        
    }
    for(int i=0;i<dataroad.count;i++)
    {
        NSMutableDictionary *states = [dataroad objectAtIndex:i];
        
        if( ccpDistance(ccp(maxx,maxy), ccp([[states objectForKey:@"road-x"] intValue],[[states objectForKey:@"road-y"] intValue] ))<2)
            ISBLUE3=NO;
        
    }
    for(int i=0;i<dataroad.count;i++)
    {
        NSMutableDictionary *states = [dataroad objectAtIndex:i];
        
        if( ccpDistance(ccp(minx,maxy), ccp([[states objectForKey:@"road-x"] intValue],[[states objectForKey:@"road-y"] intValue] ))<2)
            ISBLUE4=NO;
        
    }*/
    
   
        return YES;

    
      
}

-(void)FRESHPLISTDATE
{ 
   //  NSString *filepathtield = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 
   // NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
    NSString *filepathtield = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 

     NSMutableArray *dataall = [[NSMutableArray alloc] initWithContentsOfFile:filepathtield];
    TILEDSARRAY=dataall;
}
-(BOOL)ISCANADDOBJECT:(int )length CENTERPOSOTION:(CGPoint ) center 
{
    BOOL canmove=YES;

    //Tilednode *nowtiled=[TILEDSARRAY objectAtIndex:center.x*160+center.y];
   // nowtiled.ISCANADDOBJECT=CANMOVE;
    for(int minx=center.x-(length-1)/2;minx<=center.x+(length-1)/2;minx++)
        for(int miny=center.y-(length-1)/2;miny<=center.y+(length-1)/2;miny++)    
        {
            NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:minx*160+miny];
            
           BOOL CANMOVE2= [[nowtiled objectForKey:@"ISCANADDOBJECT"] boolValue];
            canmove=canmove&&!CANMOVE2;

        }  
    return !canmove;
    
}
/*-(BOOL)ISCANADDOBJECTHOUSE:(int )length CENTERPOSOTION:(CGPoint ) center 
{
    BOOL canmove=YES;
   
    
    
    for(int minx=center.x-(length-1)/2-1;minx<=center.x+(length-1)/2;minx++)
        for(int miny=center.y-(length-1)/2-1;miny<=center.y+(length-1)/2;miny++)    
        {
            NSMutableDictionary *states = [TILEDSARRAY objectAtIndex:minx*160+miny ];
            BOOL CANMOVE2= [[states objectForKey:@"ISCANADDOBJECT"] boolValue];
            canmove=canmove&&CANMOVE2;

        }  

    return canmove;

    
}*/
-(void)changeroadnear:(CGPoint) point
{

    CGPoint cubelocation=point;

    CCNode* node = [self getChildByTag:TileMapNode];
    
    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
    CCTMXLayer* loadLayer = [tileMap layerNamed:@"公路"]; 
    int tileGIDleftup1 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(-3,2)) ];
    int tileGIDleftdow3 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(0,5)) ];
    int tileGIDrightdow4 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(3,2))];
    int tileGIDrightup2 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(0,-1))];
    
    if (tileGIDleftup1 != 0||tileGIDleftdow3 != 0||tileGIDrightdow4 != 0||tileGIDrightup2 != 0) 
    {
        
        // Tilednode *nowtiled=[TILEDSARRAY objectAtIndex:(tilePos.x-1)*160+tilePos.y ];
        // nowtiled.ISTREE=YES;
        
        ///    [NOWITEMIMAGE setSelectedImage:[CCSprite spriteWithFile:@"公路-1.png"]];
        /// [NOWITEMIMAGE setNormalImage:[CCSprite spriteWithFile:@"公路-1.png"]];
        if (tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0) 
        {
            [loadLayer setTileGID:5 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:6 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:7 at:ccpAdd(cubelocation, ccp(0,2)) ];
            
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:8 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:9 at:ccpAdd(cubelocation, ccp(0,2)) ];
            
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:10 at:ccpAdd(cubelocation, ccp(0,2)) ];
            
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3!= 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:11 at:ccpAdd(cubelocation, ccp(0,2)) ];
            
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:12 at:ccpAdd(cubelocation, ccp(0,2)) ];
            
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:13 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:14 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:15 at:ccpAdd(cubelocation, ccp(0,2)) ];
            
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0)
        {
            [loadLayer setTileGID:16 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:17 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:18 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        else if(tileGIDleftup1 == 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&  tileGIDrightup2 == 0)
        {
            [loadLayer setTileGID:19 at:ccpAdd(cubelocation, ccp(0,2)) ];
        }
        //  if(LASTROAD.x!=ccpAdd(cubelocation, ccp(0,2)).x||LASTROAD.y!=ccpAdd(cubelocation, ccp(0,2)).y)
        
        // [self  tilednodeschangeiscanadd:3 CENTERPOSOTION:cubelocation CANORNOT:NO];
        
        
        


    }




}


-(void)surebuildroad:(id)sender

{//NSString *filepath = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 
     //  NSString *filepath=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
    OBJECTISPUTDOWN=YES;

[self unschedule:@selector(step:)];
 
    [self  tilednodeschangeiscanadd:3 CENTERPOSOTION:ccpSub(LASTROAD, ccp(0, 2))  CANORNOT:NO];
    [TILEDSARRAY writeToFile:pathoftield atomically:YES];
    
    [self FRESHPLISTDATE];

   // NSLog(@"xhhxx: %f  yhhyy: %f",LASTROAD.x,LASTROAD.y);

    [self removeChildByTag:MENUSURE cleanup:YES];

    CCNode* node = [self getChildByTag:TileMapNode];

    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
    CCTMXLayer* loadLayer = [tileMap layerNamed:@"公路"]; 

    int tileGIDleftup1 = [loadLayer tileGIDAt:ccpAdd(LASTROAD, ccp(-3,0)) ];
    int tileGIDleftdow3 = [loadLayer tileGIDAt:ccpAdd(LASTROAD, ccp(0,3)) ];
    int tileGIDrightdow4 = [loadLayer tileGIDAt:ccpAdd(LASTROAD, ccp(3,0))];
    int tileGIDrightup2 = [loadLayer tileGIDAt:ccpAdd(LASTROAD, ccp(0,-3))];
    if (tileGIDleftup1) {
        [self  changeroadnear:ccpAdd(LASTROAD, ccp(-3,-2))];

    }
    if (tileGIDleftdow3){
        [self  changeroadnear:ccpAdd(LASTROAD, ccp(0,1))];
        
    }

    if (tileGIDrightdow4){
        [self  changeroadnear:ccpAdd(LASTROAD, ccp(3,-2))];
        
    }

    if (tileGIDrightup2){
        [self  changeroadnear:ccpAdd(LASTROAD, ccp(0,-5))];
        
    }



}

-(NSString *)dataFilePath
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDictionary=[paths objectAtIndex:0];
    return [documentDictionary stringByAppendingPathComponent:kFilename];


}
-(NSString *)dataFilePathhenhouse
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDictionary=[paths objectAtIndex:0];
    return [documentDictionary stringByAppendingPathComponent:kFilename];
    
    
}

-(NSString *)dataFilePathtechlab
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDictionary=[paths objectAtIndex:0];
    return [documentDictionary stringByAppendingPathComponent:kFilename];
    
    
}


-(void)applicationwillresignactive:(NSNotification *)notification
{


}

-(void)objectsplistsinit
{

/*
    NSFileManager * fileManager = [NSFileManager defaultManager]; 
    NSString *filepath= [self dataFilePathhenhouse];//[self dataFilePath];[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
    
    if(![[NSFileManager defaultManager]fileExistsAtPath:filepath])
    {[fileManager changeCurrentDirectoryPath:[filepath stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:filepath contents:nil attributes:nil]; 
        
    }
    else
        return;
    NSMutableArray  *TILEDSARRAYhouse=[[NSMutableArray alloc] init];
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
    [states setObject:[NSNumber numberWithInt:-100]  forKey:@"tag"];
    [states setObject:[NSNumber numberWithInt:-100]  forKey:@"house-x"];
    [states setObject:[NSNumber numberWithInt:-100]  forKey:@"house-y"];
    [TILEDSARRAYhouse addObject:states];
    [TILEDSARRAYhouse writeToFile:filepath atomically:YES];    

    NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/house.plist"];
     NSString *filepathTECHLAB=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/TECHLAB.plist"];
    //[self dataFilePath];
    if(![[NSFileManager defaultManager]fileExistsAtPath:filepathhouse])
    {[fileManager changeCurrentDirectoryPath:[filepathhouse stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:filepathhouse contents:nil attributes:nil]; 
        
    }
   
    if(![[NSFileManager defaultManager]fileExistsAtPath:filepathTECHLAB])
    {[fileManager changeCurrentDirectoryPath:[filepathTECHLAB stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:filepathTECHLAB contents:nil attributes:nil]; 
        
    }
   
   
  */  
    


}
-(void)objectsplistsinittech
{
   /* NSFileManager * fileManager = [NSFileManager defaultManager]; 
    NSString *filepath= [self dataFilePathtechlab];//[self dataFilePath];[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
    
    if(![[NSFileManager defaultManager]fileExistsAtPath:filepath])
    {[fileManager changeCurrentDirectoryPath:[filepath stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:filepath contents:nil attributes:nil]; 
        
    }
    else
        return;

    NSMutableArray  *TILEDSARRAYTECHLAB=[[NSMutableArray alloc] init];
    NSMutableDictionary *TILEDSARRAYTECHLABstates =  [NSMutableDictionary dictionaryWithCapacity:10];
    // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
    [TILEDSARRAYTECHLABstates setObject:[NSNumber numberWithInt:-100]  forKey:@"tag"];
    [TILEDSARRAYTECHLABstates setObject:[NSNumber numberWithInt:-100]  forKey:@"TECHLAB-x"];
    [TILEDSARRAYTECHLABstates setObject:[NSNumber numberWithInt:-100]  forKey:@"TECHLAB-y"];
    [TILEDSARRAYTECHLAB addObject:TILEDSARRAYTECHLABstates];
    [TILEDSARRAYTECHLAB writeToFile:filepath atomically:YES];    
*/

}
-(void)tilednodesinit
{
   /* TILEDSARRAY=[[NSMutableArray alloc] init];
    for(int i=1;i<=160*160;i++)
    {   
        Tilednode *tilednode=[Tilednode new];
       [TILEDSARRAY addObject:tilednode];
        
    }
    */
    NSFileManager * fileManager = [NSFileManager defaultManager]; 
    //NSString *filepath= [self dataFilePath];//[self dataFilePath];
    pathoftield=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/road.plist"];
   
    if(![[NSFileManager defaultManager]fileExistsAtPath:pathoftield])
    {[fileManager changeCurrentDirectoryPath:[pathoftield stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:pathoftield contents:nil attributes:nil]; 

    }
   NSString  *pathoftield2=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/blue.plist"];
    if(![[NSFileManager defaultManager]fileExistsAtPath:pathoftield2])
    {[fileManager changeCurrentDirectoryPath:[pathoftield2 stringByExpandingTildeInPath]];   
        [fileManager createFileAtPath:pathoftield2 contents:nil attributes:nil]; 
        
    }
   /* NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; 
    
   pathoftield = [documentsDirectory stringByAppendingPathComponent:@"tilesdata.plist"]; NSFileManager *fileManager = [NSFileManager defaultManager];
    
    
    
    if (![fileManager fileExistsAtPath: pathoftield]) 
        
    {
        
        pathoftield = [documentsDirectory stringByAppendingPathComponent: [NSString stringWithFormat: @"tilesdata.plist"] ];
        
    }
    else
        return;*/
   /*   TILEDSARRAY=[[NSMutableArray alloc] init];
        for(int i=1;i<=160*160;i++)
        {   
            NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
           // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
            [states setObject:[NSNumber numberWithBool:NO] forKey:@"ISTREE"];
            [states setObject:[NSNumber numberWithBool:NO] forKey:@"ISHOUSE"];
            [states setObject:[NSNumber numberWithBool:NO] forKey:@"ISROAD"];
            [states setObject:[NSNumber numberWithBool:YES] forKey:@"ISBLUE"];
            [states setObject:[NSNumber numberWithBool:YES] forKey:@"ISCANADDOBJECT"];
            [TILEDSARRAY addObject:states];
            
        }
    */
        //make canannobject
    NSMutableDictionary *roadlocation =  [NSMutableDictionary dictionaryWithCapacity:2];
    // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
      NSMutableArray *dataall = [[NSMutableArray alloc] init];
    [roadlocation setObject:[NSNumber numberWithInt:-10000]  forKey:@"road-x"];
    [roadlocation setObject:[NSNumber numberWithInt:-10000]  forKey:@"road-y"];
    [dataall addObject:roadlocation];
    [dataall writeToFile:pathoftield atomically:YES];   
    [dataall writeToFile:pathoftield2 atomically:YES];
   // NSMutableDictionary *roadlocation2 =[[NSMutableArray alloc] init];
    // [states setObject:[[NSDate alloc] init] forKey:@"lastSignOut"];
   /* NSMutableArray *dataall2=[[NSMutableArray alloc] init];
    NSMutableDictionary *roadlocation2 =  [NSMutableDictionary dictionaryWithCapacity:2];

    [roadlocation2 setObject:[NSNumber numberWithInt:-10000]  forKey:@"blue-x"];
    [roadlocation2 setObject:[NSNumber numberWithInt:-10000]  forKey:@"blue-y"];
    [dataall2 addObject:roadlocation2];
    [dataall2 writeToFile:pathoftield2 atomically:YES]; 
    */
        for(int i=29;i<45;i=i+3)
            for(int  j=68;j>53;j=j-3)
                [self  andstieldroad:CGPointMake(i , j)];
     [self  andstieldroad:CGPointMake(26 , 62)];
     [self  andstieldroad:CGPointMake(25 , 62)];
     [self  andstieldroad:CGPointMake(22 , 62)];
     [self  andstieldroad:CGPointMake(19 , 62)];
    for (int u=-6;u<=6; u++) {
         [self  andstieldroad:CGPointMake(19 , 62+u*3)];
    }
        //make blue
        for(int i=15;i<=55;i=i+5)
            for(int  j=79;j>=39;j=j-5)
                [self  makebluenot:CGPointMake(i , j)];
                
               // [self  tilednodeschangeisblue:5 CENTERPOSOTION:ccp(i ,j ) ISBLUE:NO];
 //   NSString *filepathTECHLAB = [[NSBundle mainBundle] pathForResource:@"tilesdata" ofType:@"plist"]; 
    
  //  NSString *filepathTECHLAB=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/tilesdata.plist"];
    
  //  [TILEDSARRAY writeToFile:pathoftield atomically:YES];
   // NSLog(@" path is:  %@",pathoftield);

   //   [TILEDSARRAY writeToFile:filepath atomically:YES];
    
   

    UIApplication *app=[UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationwillresignactive:) name:UIApplicationWillResignActiveNotification object:app];
    
    
}

-(void)menuimageItemqingmingTouched :(id)sender
{
  /*
  // [self schedule:@selector(step:) interval:0.1f];
    Henhouse *henhouse=[Henhouse Henhouse:5];
       NOWHENHOUSE=henhouse;
    henhouse.worldlayerprotocoll=self;
    henhouse.anchorPoint=ccp(0.5, 0.5);
    henhouse.position=ccp(-520, 1268); 
   
    NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/house.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathhouse];
       [self addChild:henhouse z:3 tag:data.count+HOUSETAG];
    MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=house;
    OBJECTISPUTDOWN=NO;
     womenspeaker.position=ccp(111,111 );
   */

}
-(void)newonehenhouse:(int)level
{
     [self schedule:@selector(step:) interval:0.1f];
    NSArray *factoryarray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
    
    Henhouse *henhouse=[Henhouse Henhouse:level];
    NOWHENHOUSE=henhouse;
    henhouse.worldlayerprotocoll=self;
    henhouse.anchorPoint=ccp(0.5, 0.5);
    henhouse.position=ccp(-520, 1268); 
    
   
    [self addChild:henhouse z:factoryarray.count+HOUSETAG tag:factoryarray.count+HOUSETAG];
    
    MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=house;
    OBJECTISPUTDOWN=NO;
   

}
-(void)newoneSTATICOBJECT:(int)level
{
    [self schedule:@selector(step:) interval:0.1f];
    NSArray *factoryarray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Processing];

    Staticfunctionalobject *staticobj=[Staticfunctionalobject Staticfunctionalobject:level ];
    
    staticobj.worldlayerprotocoll=self;
    NOWSTATICOBJECT=staticobj;
    staticobj.anchorPoint=ccp(0.5, 0.5);
    staticobj.position=ccp(-520, 1268); 
    [self addChild:staticobj z:factoryarray.count+TECHLABTAG tag:factoryarray.count+TECHLABTAG];
    staticobj.effect=level;
    MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=staticobjection;
    OBJECTISPUTDOWN=NO;
    
}

-(void)newoneTECHLAB:(int)level
{
    [self schedule:@selector(step:) interval:0.1f];
    NSArray *factoryarray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Processing];

    TECHLAB *techlab=[TECHLAB TECHLAB:level ];
    techlab.worldlayerprotocol=self;
    NOWITEMIMAGE=techlab;
    techlab.anchorPoint=ccp(0.5, 0.5);
    techlab.position=ccp(-520, 1268); 
   [self addChild:techlab z:factoryarray.count+1+TECHLABTAG tag:factoryarray.count+1+TECHLABTAG];
   
       MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=researchinstitution;
    OBJECTISPUTDOWN=NO;
    
}

-(void)menuimageItemfactoryeTouched:(CCMenuItemImage *)sender
{
  
   
    
    TECHLAB *techlab=[TECHLAB TECHLAB:WINDMILL ];
    techlab.worldlayerprotocol=self;
    NOWITEMIMAGE=techlab;
    techlab.anchorPoint=ccp(0.5, 0.5);
    techlab.position=ccp(-924, 968); 
    [self addChild:techlab z:9];

    MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=researchinstitution;
     OBJECTISPUTDOWN=NO;
  //  [self schedule:@selector(step:) interval:0.1f];

  
    
   /* Staticfunctionalobject *staticobj=[Staticfunctionalobject Staticfunctionalobject:goldenflower ];

    staticobj.worldlayerprotocoll=self;
     NOWSTATICOBJECT=staticobj;
    staticobj.anchorPoint=ccp(0.5, 0.5);
    staticobj.position=ccp(-924, 968); 
    [self addChild:staticobj z:9];
    
    MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=staticobjection;
      NEWOBJECTKIND=staticobjectsprite;*///静态建筑
    /*  typedef enum
     {        pool=0,
     haystackeffect,
     guarderhouseeffect,
     Palmtree,
     bambooeffect,
     coconuttree,
     peachtree,
     banian,
     willow,
     Spiritualtone,
     goldenflower
     
     } EFFECTIONSTOHOUSE;*/
    
}


-(void)showtheiconofhouse:(int)tagg ISSHOW:(BOOL)SHOW ICONKIND:(EFFECTIONSTOHOUSE)iconkind ISSENDERCALMDOWN:(bool)ISDOWN

{
    Henhouse *hen=[self getChildByTag:tagg];
  //  [hen showtheiconofhouse:SHOW ICONKIND:  ISSENDERCALMDOWN:ISDOWN];

    [hen showtheiconofhouse:SHOW ICONKIND:iconkind ISSENDERCALMDOWN:NO];

}
-(id)menuimageItemhenroadTouched:(CCMenuItemImage *)sender
{
    // sender.position=NOWPOSITION;
    //  NOWITEMIMAGE=sender;
    //[self schedule:selector:@selector()  interval:0.01];
    [self schedule:@selector(step:) interval:0.1f];
    // sender.position=ccpAdd(sender.position,ccp(10,10));
    // NOWITEMIMAGE=sender;
    //  CCSprite *undercolor=[CCSprite spriteWithFile:@"鸡舍一级.png"];
    // undercolor.anchorPoint=ccp(0.5, 0.5);
    //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
    //  undercolor.position=ccp([NOWITEMIMAGE contentSize].width/2, [NOWITEMIMAGE contentSize].height/2+128);
    // [NOWITEMIMAGE addChild:undercolor z:9];
    //  NSLog(@"aa");
    sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuildroad:) ];
    
    CCMenu *roadbuildmenu=[CCMenu menuWithItems:sure,nil];
    roadbuildmenu.position=ccp(0, 0 );
    sure.position=ccp(-724, 968);
    [self addChild:roadbuildmenu z:9 tag:MENUSURE];

    MOVEMENU=!MOVEMENU;
    nowmenuimageTypes=road;
    LASTROAD=ccp(42, 80);
    OBJECTISPUTDOWN=NO;
    
   
    
}
-(void)housein:(id)sender
{
    NSArray *sheds = [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
    NSString *one = [sheds objectAtIndex:0];
    //NSString *one1 = [sheds objectAtIndex:1];
    NSInteger num = [sheds count];
   [SceneManager goSecondScene:one];     
    
}


-(id) init
{
	if( (self=[super init])) {
        switch ([[Sperkermenuservice getSharedSperkermenuservice]getthekind] ) {
            case 1:
            {
                [self newonehenhouse:1];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
            
            }
                break;
                
            case 2:
            {
                [self newoneTECHLAB:iFACTORY];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
                

            case 3:
            {
                [self newoneTECHLAB:iTECHLABKIND];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 4:
            {
                [self newoneTECHLAB:iWINDMILL];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 5:
            {
                [self newoneSTATICOBJECT:guarderhouseeffect];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 6:
            {
                [self newoneSTATICOBJECT:Spiritualtone];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 7:
            {
                [self newoneSTATICOBJECT:willow];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break; case 8:
            {
                [self newoneSTATICOBJECT:banian];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 9:
            {
                [self newoneSTATICOBJECT:peachtree];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 10:
            {
                [self newoneSTATICOBJECT:pool];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break; case 11:
            {
                [self newoneSTATICOBJECT:coconuttree];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 12:
            {
                [self newoneSTATICOBJECT:bambooeffect];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break; case 13:
            {
                [self newoneSTATICOBJECT:Palmtree];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break; 
            case 14:
           
            {
                [self newoneSTATICOBJECT:goldenflower];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 15:
                
            {
                [self newoneSTATICOBJECT:haystackeffect];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
            case 21:
                
            {
                [self newoneTECHLAB:3];
                [[Sperkermenuservice getSharedSperkermenuservice]makethekind:0];
                
            }
                break;
                

            default:
                break;
        }        
       [self initfreshtheview];
         
          //  [self tilednodesinit];//初始化所有地图点的属性
       // [self objectsplistsinit];
      // [self objectsplistsinittech];
        MOVEMENU=NO;
		[self FRESHPLISTDATE];
        CANMOVEanimation=YES;
        CGSize size = [[CCDirector sharedDirector] winSize];
        
        _mapScale = 1.0f;
        self.scale = _mapScale;
        
        map = [CCTMXTiledMap tiledMapWithTMXFile:@"map.tmx"];//加载地图
        map.position = ccp(512,384);
        self.position = ccp(1024,-868);
       // self.position = ccp(0,-0);
        map.anchorPoint = ccp(0.5, 0.5);
        
        [self addChild:map z:0 tag:TileMapNode];
        
        
        
              
        //开启触摸
        self.isTouchEnabled = YES;
      // UIPinchGestureRecognizer *pinch = [[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(doPinch:)] autorelease];
      //  [[[CCDirector sharedDirector]openGLView]addGestureRecognizer:pinch];
       // UITapGestureRecognizer *singletap=[[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dosingletap:)]autorelease];
        //singletap.numberOfTapsRequired=1;
      //  [[[CCDirector sharedDirector]openGLView]addGestureRecognizer:singletap];
      //   [self  addGestureRecognizer:singletap];
 
        initialDistance=0;
        zoomFactor=1;
        
		 
        ///////////////////////////
        
      
       //CCMenuItemImage *itemhenhouse=[CCMenuItemImage itemFromNormalImage:@"鸡舍.png" selectedImage:@"鸡舍.png" target:self selector:@selector(menuimageItemhenhouseTouched:) ];   
       /* CCMenuItemImage *itemhenhouse=[CCMenuItemImage itemFromNormalImage:@"fivered.png" selectedImage:@"fivered.png" target:self selector:@selector(menuimageItemqingmingTouched:) ];
        CCMenuItemImage *itemhenhouse2=[CCMenuItemImage itemFromNormalImage:@"fivered.png" selectedImage:@"fivered.png"  block:^(id object) {
            [self menuimageItemfactoryeTouched: object];
        }];
       
        CCMenuItemImage *itemhenroad=[CCMenuItemImage itemFromNormalImage:@"公路-1.png" selectedImage:@"公路-1.png" block:^(id object) {
            [self menuimageItemhenroadTouched: object];
        }];

        
        CCMenuItemImage *itemhenhouse3=[CCMenuItemImage itemFromNormalImage:@"鸡舍二级.png" selectedImage:@"鸡舍二级.png"  target:self
                                                                   selector:@selector(housein:)];
        CCMenu *menu3 = [CCMenu menuWithItems:itemhenhouse3,nil]; 
        menu3.anchorPoint = ccp(0.5, 0.5);

        menu3.position = ccp(-524, 1268); 
        [self addChild:menu3 z:1];

        
        CCMenu *menu = [CCMenu menuWithItems:itemhenhouse,nil]; 
        menu.anchorPoint = ccp(0.5, 0.5);
        CCMenu *menu2 = [CCMenu menuWithItems:itemhenhouse2,nil]; 
        menu2.anchorPoint = ccp(0.5, 0.5);

        CCMenu *menuroad = [CCMenu menuWithItems:itemhenroad,nil]; 
        menu.position = ccp(-924, 968); 
        menu2.position = ccp(-524, 968); 
        menuroad.position = ccp(-724, 968); 
       // menu.position = ccp(-0, 0);
        [self addChild:menu z:1];
        [self addChild:menuroad z:1];
        [self addChild:menu2 z:1];
        */

        
        
      /*  CCSprite *pet = [CCSprite spriteWithFile:@"keyan_1_1.png"];
        pet.anchorPoint = CGPointMake(0.5f, 0.5f);
        pet.position = ccp(-524, 968);
        [self addChild: pet z:3 ];
        CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
        [pet runAction:repeat];
*/
       // Henhouse  *henhouse1=[Henhouse Henhouse];
       // henhouse1.position=ccp(512, 384);
       // [self addChild:henhouse1 z:0];
        NSString *filepathroad = [[NSBundle mainBundle] pathForResource:@"road" ofType:@"plist"];
        //NSString *filepathblue=   [NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/road.plist"];
        dataroad = [[NSMutableArray alloc] initWithContentsOfFile:filepathroad];
        NSString *filepathblue = [[NSBundle mainBundle] pathForResource:@"blue" ofType:@"plist"];
        //NSString *filepathblue=   [NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/road.plist"];
        datablue = [[NSMutableArray alloc] initWithContentsOfFile:filepathblue];
        
        expend1=[CCSprite spriteWithFile:@"extend20.png"];
        [self addChild:expend1 z:10 tag:2000];
        words = [CCLabelTTF labelWithString:@"双击扩展该地图" fontName:@"Marker Felt" fontSize:32];
        
        
        words.color=ccBLACK;
        [self addChild:words z:11 tag:2001];

	}
   	return self;
}
-(void)deletemenu
{}



                                    
- (void)doPinch:(UIPinchGestureRecognizer *)pinch{
    
    [self deletemenu];
    CGFloat newScale = _mapScale;
    CGFloat scale=[pinch scale];
    int  count=1;
    if(scale<_lastscale-0.01&&newScale>0.5)
    {
     count+=(_lastscale-scale)/0.1;   

    newScale -= 0.01*count ;
    }
    else if(newScale<1.2&&scale>_lastscale+0.01)
    {
        count+=(-_lastscale+scale)/0.1;
        newScale += 0.01*count;  
    }
  // NSLog(@"f:%f",[pinch scale]);
    [self resize:newScale];
    _lastscale=scale;
}

- (void)dosingletap:(UITapGestureRecognizer *)pinch
{
    /*if(!MOVEMENU)
    {
        
        CGPoint tapPoint = [pinch locationInView:[[CCDirector sharedDirector]openGLView]];
       CGPoint location = [[CCDirector sharedDirector] convertToGL:tapPoint];
        CCNode* node = [self getChildByTag:TileMapNode];
        // NSAssert([node isKindOfClass:[CCTMXTiledMap class]], @"not a CCTMXTiledMap"); 
        CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
        CGPoint tilePos = [self tilePosFromLocation:location tileMap:tileMap];    
        NSLog(@"xxx: %f  yyy: %f",tilePos.x,tilePos.y);
        CCTMXLayer* eventLayer = [tileMap layerNamed:@"black"]; 
        CCTMXLayer* treeLayer = [tileMap layerNamed:@"树木"]; 
        //int tileGID = [eventLayer tileGIDAt:tilePos];
        [eventLayer removeTileAt:tilePos];
        
        for(int i=-2;i<=2;i++)
            for(int j=0;j<=5;j++)
            { 
                CGPoint nowtilePos=ccpAdd(tilePos, ccp(i,j));
                [eventLayer removeTileAt:nowtilePos];
                for(int i=0;i<4;i++)
                { 
                    [treeLayer removeTileAt:ccpAdd(nowtilePos, ccp(i,i))];
                }
                
            }        
        for(int i=-4;i<=4;i++)
            for(int j=-5;j<=5;j++)
            { 
                CGPoint nowtilePos=ccpAdd(tilePos, ccp(i,j));
                // [eventLayer removeTileAt:nowtilePos];
                for(int i=0;i<4;i++)
                { 
                    [treeLayer removeTileAt:ccpAdd(nowtilePos, ccp(i,i))];
                }
                
            }         
        //int tileGID = [eventLayer tileGIDAt:tilePos];
        // [treeLayer removeTileAt:tilePos];
        

    
    
    
    }*/
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{  
    
//if(!CANMOVEanimation)
   if( [map isRunning])
   {
        Contents *m = [Contents getContents];
       [map  stopAllActions];     
       CGPoint ss= ccpSub(ccp(-m.cameraPos.x+512, -m.cameraPos.y+384),self.position);
       m.gestureStartPoint =ccpSub(  m.gestureStartPoint, ss);
       m.cameraPos=ccpAdd(m.cameraPos, ss);
       
   }

    if( 1)
    {
        NSSet *allTouches = [event allTouches];//获得所有触摸点  
        UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  
        CGPoint curruntpoint=[[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
        NOWVIEWPOSITION=curruntpoint;
       // NSLog(@"aaaa %f,   %f",curruntpoint.x,curruntpoint.y);
        starttaplocation=curruntpoint;
        NOWPOSITION=ccpMult(curruntpoint, 1/self.scaleX) ;
        NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;

        switch (nowmenuimageTypes) {
            case house:
            {
                if ( abs( NOWHENHOUSE.position.x-NOWPOSITION.x)<200&&abs( NOWHENHOUSE.position.y-NOWPOSITION.y)<200&& ( !OBJECTISPUTDOWN)) 
                {
                     [self schedule:@selector(step:) interval:0.1f];
                    MOVEMENU=YES;
                }
                else
                {
                MOVEMENU=NO;
                [self unschedule:@selector(step:)];
                
                }
            }
                break;
            case road:
            {
            
            }
                break;
            case researchinstitution:
            {
                
                if ( abs( NOWITEMIMAGE.position.x-NOWPOSITION.x)<250&&abs( NOWITEMIMAGE.position.y-NOWPOSITION.y)<250&& ( !OBJECTISPUTDOWN)) 
                {
                    [self schedule:@selector(step:) interval:0.1f];
                    MOVEMENU=YES;
                }
                else
                {
                    MOVEMENU=NO;
                    [self unschedule:@selector(step:)];
                    
                }

            
            
            
            }
                break;
            case staticobjection:
            {
            
                
                if ( abs( NOWSTATICOBJECT.position.x-NOWPOSITION.x)<250&&abs( NOWSTATICOBJECT.position.y-NOWPOSITION.y)<250&& ( !OBJECTISPUTDOWN)) 
                {
                    [self schedule:@selector(step:) interval:0.1f];
                    MOVEMENU=YES;
                }
                else
                {
                    MOVEMENU=NO;
                    [self unschedule:@selector(step:)];
                    
                }

            
            }    
                break;


            default:
                break;
        }
             
    }
if(!MOVEMENU)
 {
     
    ISTOWCOUNT=NO;
    HASBIGAN=YES;
    Contents *m = [Contents getContents];
    TOUCHBIGANTIME=  event.timestamp;
    
    NSSet *allTouches = [event allTouches];//获得所有触摸点  
    UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  
    CGPoint location = [touch1 locationInView: [touch1 view]];
     //curruntpoint=[[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
     NOWPOSITION=location;
    int count = [[allTouches allObjects] count];//当前触摸点数量，单点触摸为1.  
   

    if (count == 1) {//单点触摸  
     
        CANMOVE=YES;
            switch ([touch1 tapCount]) {//判断是单击还是双击  
            case 1: 
                {
                }
                break;  
            case 2: 
                    
                    /*location = [[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
                    CCNode* node = [self getChildByTag:TileMapNode];
                    // NSAssert([node isKindOfClass:[CCTMXTiledMap class]], @"not a CCTMXTiledMap"); 
                    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
                    CGPoint tilePos = [self tilePosFromLocation:location tileMap:tileMap];   
                    CGPoint cubelocation=ccp(-2+(int)((tilePos.x+2)/5)*5,-3+(int)((tilePos.y+3)/5)*5);

                    NSLog(@"xxx: %f  yyy: %f",tilePos.x,tilePos.y);
                    CCTMXLayer* eventLayer = [tileMap layerNamed:@"black"]; 
                    CCTMXLayer* treeLayer = [tileMap layerNamed:@"树木"]; 
                    //int tileGID = [eventLayer tileGIDAt:tilePos];
                    [eventLayer removeTileAt:ccpAdd(cubelocation, ccp(2, 6)) ];

      
                    for(int i=-1;i<=7;i++)
                        for(int j=0;j<=8;j++)
                        { 
                            CGPoint nowtilePos=ccpAdd(cubelocation, ccp(i,j));
                       
                                [treeLayer removeTileAt:nowtilePos];
                           // }
                            
                        }         
           
                    [ self tilednodeschangeisblue:5 CENTERPOSOTION:ccpAdd(cubelocation, ccp(2, 2)) ISBLUE:NO];
                    [self FRESHPLISTDATE];      
                     */
                                      
                    location = [[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
                    CCNode* node = [self getChildByTag:TileMapNode];
                    // NSAssert([node isKindOfClass:[CCTMXTiledMap class]], @"not a CCTMXTiledMap"); 
                    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
                    CGPoint tilePos = [self tilePosFromLocation:location tileMap:tileMap];   
                    if (abs( tilePos.x-expendlandcenterpositionoftiels.x)<10&&abs( tilePos.y-expendlandcenterpositionoftiels.y)<10)
                    {
                        expend1.position=ccp(1,1);
                        words.position=ccp(1,1);

                        CGPoint cubelocation=ccpSub(expendlandcenterpositionoftiels, ccp(10, 10));
                        [self showtheexpend:ccpAdd(cubelocation, ccp(+1, 1)) ];   
                        expendlandcenterpositionoftiels=ccp(-1000, -1000);
                       
                    }
                    
                       
                    return;
        }
    m.gestureStartPoint = [[CCDirector sharedDirector] convertToGL:location];
    TOUCHBIGANPOINT=location;
        
    }else if (count == 2) {//多点触摸  
        
        NSSet *allTouches = [event allTouches];
        UITouch *tOne = [[allTouches allObjects] objectAtIndex:0];
        UITouch *tTwo =  [[allTouches allObjects] objectAtIndex:1];
        CGPoint firstTouch = [tOne locationInView:[tOne view]];
        CGPoint secondTouch = [tTwo locationInView:[tTwo view]];
        initialDistance = sqrt(pow(firstTouch.x - secondTouch.x, 2.0f) + pow(firstTouch.y - secondTouch.y, 2.0f));
        middlepoint=CGPointMake((firstTouch.x + secondTouch.x)/2, (firstTouch.y+ secondTouch.y)/2);
        TOUCHBIGANPOINT=middlepoint;
        m.gestureStartPoint = [[CCDirector sharedDirector] convertToGL:middlepoint];
        NOWPOSITION=middlepoint;
        startscale=self.scale;
    }  
    
    
        
 }  
    


}
 
- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{

    
    womenspeaker.position= womenspeaker.position;
       if(MOVEMENU)
   {
       NSSet *allTouches = [event allTouches];//获得所有触摸点  
       UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  
       CGPoint curruntpoint=[[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
       NOWVIEWPOSITION=curruntpoint;

       NOWPOSITION=ccpMult(curruntpoint, 1/self.scaleX) ;
       switch (nowmenuimageTypes) {
           case house:
               NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
              
               break;
           case road:
               NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
               break;
           case researchinstitution:
               NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
               break;
           case staticobjection:
               NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
               break;


           default:
               break;
       }

   }
   else
   {
    
       
       
       
       
       
    NSSet *allTouches = [event allTouches];//获得所有触摸点  
    
     int count = [[allTouches allObjects] count];//当前触摸点数量，单点触摸为1.  
     if (count == 1) {//单点触摸  
         UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  

       
         if(!START)
    {
        
        Contents *m = [Contents getContents];
         
         CGPoint location = [touch1 locationInView: [touch1 view]];
         CGPoint currentPositoin = [[CCDirector sharedDirector] convertToGL:location];
          NOWPOSITION=middlepoint;
         CGFloat deltaX = (currentPositoin.x - m.gestureStartPoint.x);
         CGFloat deltaY = (currentPositoin.y - m.gestureStartPoint.y);
         // CGFloat deltaX = (currentPositoin.x - m.gestureStartPoint.x);
        //  CGFloat deltaY = (currentPositoin.y - m.gestureStartPoint.y);
         m.cameraPos = ccpSub(m.cameraPos, ccp(deltaX, deltaY));
         // CGSize size = [[CCDirector sharedDirector] winSize];
         CGFloat y = clampf(m.cameraPos.y,-1536+768 -1536*(self.scaleY-1), 1536+1536*(self.scaleY-1));
         CGFloat x = clampf(m.cameraPos.x, -2048+1024-2048*(self.scaleX-1), 2048+2048*(self.scaleX-1));
         m.cameraPos = ccp(x, y);
         m.gestureStartPoint = currentPositoin;
        // self.position = ccp(-m.cameraPos.x+512, -m.cameraPos.y+384); 
        self.position = ccp(-m.cameraPos.x+512, -m.cameraPos.y+384);
        
    }
         else
         {
             UITouch *touch = [touches anyObject];
             CGPoint location = [touch locationInView: [touch view]];
             Contents *m = [Contents getContents];
             m.gestureStartPoint = [[CCDirector sharedDirector] convertToGL:location];
             NOWPOSITION=location;
         }
     START=NO;
     }
     
     else if (count == 2) {//多点触摸 
         START=YES;
         if(count==2)
         {ISTOWCOUNT=YES;
         }
                  
      NSSet *allTouches2 = [event allTouches];
        UITouch *tOne2 = [[allTouches2 allObjects] objectAtIndex:0];
         UITouch *tTwo2 =  [[allTouches2 allObjects] objectAtIndex:1];
         CGPoint firstTouch2 = [tOne2 locationInView:[tOne2 view]];
         CGPoint secondTouch2 = [tTwo2 locationInView:[tTwo2 view]];
         CGFloat currentDistance = sqrt(pow(firstTouch2.x - secondTouch2.x, 2.0f) + pow(firstTouch2.y - secondTouch2.y, 2.0f));
         
         if (initialDistance == 0) {
             initialDistance = currentDistance;
             // set to 0 in case the two touches weren't at the same time
         } else if (currentDistance - initialDistance > 3&&zoomFactor<1.5f) {
             // zoom in
            
                 zoomFactor += 0.02;
                 self.scale = zoomFactor;
           
             
             initialDistance = currentDistance;
         } else if (currentDistance - initialDistance < 0&&zoomFactor>0.5) {
             // zoom out
                 
                 zoomFactor -= 0.02;
                 self.scale = zoomFactor;
            initialDistance = currentDistance;
         }
         
         
         
         NSSet *allTouches = [event allTouches];
         UITouch *tOne = [[allTouches allObjects] objectAtIndex:0];
         UITouch *tTwo =  [[allTouches allObjects] objectAtIndex:1];
         CGPoint firstTouch = [tOne locationInView:[tOne view]];
         CGPoint secondTouch = [tTwo locationInView:[tTwo view]];
         CGPoint  middlepoint2=CGPointMake((firstTouch.x + secondTouch.x)/2, (firstTouch.y + secondTouch.y)/2);
         
         
         
         Contents *m = [Contents getContents];
         
         //  CGPoint location = [touch1 locationInView: [touch1 view]];
         //  CGPoint currentPositoin = [[CCDirector sharedDirector] convertToGL:location];
         
         CGFloat deltaX = middlepoint2.x - middlepoint.x;
         CGFloat deltaY =-middlepoint2.y+ middlepoint.y;
         m.cameraPos = ccpSub(m.cameraPos, ccp(deltaX, deltaY));
         
         CGSize size = [[CCDirector sharedDirector] winSize];
         self.position=ccp(512,384);
         // CGFloat y = clampf(m.cameraPos.y,-1536+384*(1/self.scaleY), 1536-384*(1/self.scaleY));
         // CGFloat x = clampf(m.cameraPos.x, -2048+512*(1/self.scaleX), 2048-512*(1/self.scaleX));
         CGFloat y = clampf(m.cameraPos.y,-1536+768 -1536*(self.scaleY-1), 1536+1536*(self.scaleY-1));
         CGFloat x = clampf(m.cameraPos.x, -2048+1024-2048*(self.scaleX-1), 2048+2048*(self.scaleX-1));
         m.cameraPos = ccp(x, y);
         m.gestureStartPoint = middlepoint2;;
         
         //将背景和地图位置更新
         self.position = ccp(-m.cameraPos.x+512, -m.cameraPos.y+384);  
         middlepoint=middlepoint2;
    
         NOWPOSITION=middlepoint;
         CANMOVE=NO;

        }  

   }
    
}

-(void)handleTimer:(NSTimer *)timer
{
    CANMOVEanimation=YES;
}
-(void)showtheexpend:(CGPoint)cubelocation
{
    CCNode* node = [self getChildByTag:TileMapNode];
         CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;  
    CCTMXLayer* eventLayer = [tileMap layerNamed:@"black"]; 
    CCTMXLayer* treeLayer = [tileMap layerNamed:@"树木"]; 
    //int tileGID = [eventLayer tileGIDAt:tilePos];
    
    for (int k=0; k<=3; k++)
        for (int l=0; l<=3; l++) 
        {
            [eventLayer removeTileAt:ccpAdd(cubelocation, ccp(2+k*5, 6+l*5)) ]; 
            for(int i=-1;i<=7;i++)
                for(int j=0;j<=8;j++)
                { 
                    CGPoint nowtilePos=ccpAdd(ccpAdd(cubelocation,  ccp(2+k*5, 6+l*5)), ccp(i,j));
                    
                    [treeLayer removeTileAt:nowtilePos];
                    
                    
                }         
            
            [ self tilednodeschangeisblue:5 CENTERPOSOTION:ccpAdd(cubelocation, ccp(2+k*5, 6+l*5-4)) ISBLUE:NO];
            
        }
    [self FRESHPLISTDATE];                                                     
    
    CANDOUBLETAP=NO;
    womenspeaker=[[Speakermenu alloc]init];
    womenspeaker.position=ccp(-self.position.x,-self.position.y );
    [self addChild:womenspeaker z:1000];
   // womenspeaker.visible=NO;

}
- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];//获得所有触摸点  
    UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  
    CGPoint curruntpoint=[[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
     if (abs(curruntpoint.x-starttaplocation.x)<8&&abs(curruntpoint.y-starttaplocation.y)<8) {
        
        curruntpoint = [[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
        CCNode* node = [self getChildByTag:TileMapNode];
        // NSAssert([node isKindOfClass:[CCTMXTiledMap class]], @"not a CCTMXTiledMap"); 
        CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
        CGPoint tilePos = [self tilePosFromLocation:curruntpoint tileMap:tileMap];   
          //  NSLog(@" x: %f   y:  %f",tilePos.x,tilePos.y );
      //  CGPoint cubelocation=ccp(-2+(int)((tilePos.x+2)/20)*20,2+(int)((tilePos.y-2)/20)*20);
         CGPoint cubelocation=ccp(17+(int)((tilePos.x -17)/20)*20,41+(int)((tilePos.y-41)/20)*20);
         if(tilePos.y-41<0)
         {
         
             cubelocation=ccpAdd(cubelocation, ccp(0, -20));
             
         
         
         }
         if(tilePos.x-17<0)
         {
             
             cubelocation=ccpAdd(cubelocation, ccp(-20, 0));
             
             
             
         }

        // NSLog(@" x: %f   y:  %f",cubelocation.x,cubelocation.y );
        NSMutableDictionary *states = [TILEDSARRAY objectAtIndex:tilePos.x*160+tilePos.y ];
         BOOL CANEXPEND= [[states objectForKey:@"ISBLUE"] boolValue];
         CGPoint cubelocationup=ccpAdd(cubelocation, ccp(-1,10));
         if (CANEXPEND) {
            // NSLog(@"aaaaaa");
             
         }
         else
         {
        // NSLog(@"bbbbbbb");
         }
         NSMutableDictionary *statesup = [TILEDSARRAY objectAtIndex:cubelocationup.x*160+cubelocationup.y ];
         BOOL CANEXPENDup= [[statesup objectForKey:@"ISBLUE"] boolValue];
         CGPoint cubelocationdown=ccpAdd(cubelocation, ccp(10, -1));
         NSMutableDictionary *statesdown = [TILEDSARRAY objectAtIndex:cubelocationdown.x*160+cubelocationdown.y ];
         BOOL CANEXPENDdown= [[statesdown objectForKey:@"ISBLUE"] boolValue];
         CGPoint cubelocationleft=ccpAdd(cubelocation, ccp(10, 21));
         NSMutableDictionary *statesleft = [TILEDSARRAY objectAtIndex:cubelocationleft.x*160+cubelocationleft.y ];
         BOOL CANEXPENDleft= [[statesleft objectForKey:@"ISBLUE"] boolValue];
         CGPoint cubelocationright=ccpAdd(cubelocation, ccp(21, 10));
         NSMutableDictionary *statesright = [TILEDSARRAY objectAtIndex:cubelocationright.x*160+cubelocationright.y ];
         BOOL CANEXPENDright= [[statesright objectForKey:@"ISBLUE"] boolValue];
//         if (CANEXPENDup) {
//           //  NSLog(@"aaaaaa");
//             
//         }
//         else
//         {
//           //  NSLog(@"bbbbbbb");
//         }
//
//         if (CANEXPENDdown) {
//           //  NSLog(@"aaaaaa");
//             
//         }
//         else
//         {
//             NSLog(@"bbbbbbb");
//         }

//         if (CANEXPENDleft) {
//             NSLog(@"aaaaaa");
//             
//         }
//         else
//         {
//             NSLog(@"bbbbbbb");
//         }
//
//         if (CANEXPENDright) {
//             NSLog(@"aaaaaa");
//             
//         }
//         else
//         {
//             NSLog(@"bbbbbbb");
//         }

           if (CANEXPEND&&(!CANEXPENDdown||!CANEXPENDup||!CANEXPENDleft||!CANEXPENDright)&&!CGPointEqualToPoint (expendlandcenterpositionoftiels,ccp(-1000, -1000))) 
    {
              //29,69  -782,1365
        CANDOUBLETAP=YES;
        CGPoint cubelocation2=ccpAdd(cubelocation, ccp(10, 10));
        LASTLANDPOSITION=cubelocation2;
        expendlandcenterpositionoftiels=cubelocation2;
        int mmx=cubelocation2.x-29;
          int mmy=cubelocation2.y-69;
        CGPoint ppp=ccpAdd(ccp(-766, 1340), ccp(mmx*32, -mmx*16));
        ppp=ccpAdd(ppp, ccp(-mmy*32, -mmy*16));
       // NSLog(@"ppx:%f ppy:%f",cubelocation2.x,cubelocation2.y );
     
        //expend1.anchorPoint=ccp(0, 0);
      /*  [self removeChildByTag:2000 cleanup:YES];
        [self removeChildByTag:2001 cleanup:YES];

        expend1=[CCSprite spriteWithFile:@"extend20.png"];
        [self addChild:expend1 z:10 tag:2000];
        words = [CCLabelTTF labelWithString:@"双击扩展该地图" fontName:@"Marker Felt" fontSize:32];
        
        
        words.color=ccBLACK;
        [self addChild:words z:11 tag:2001];
        expend1.visible=YES;
        words.visible=YES;
*/
        expend1.position=ppp  ;
          words.position=ppp;
      //  expend1.opacity=255;
      //  words.opacity=255;
      //  [self showtheexpend:cubelocation];
       // expend1.position=ccp(1,1);
      //  words.position=ccp(1,1);
             
    }
        
    }
    if(MOVEMENU)
    {
        NSSet *allTouches = [event allTouches];//获得所有触摸点  
        UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  
        CGPoint curruntpoint=[[CCDirector sharedDirector] convertToGL:[touch1 locationInView: [touch1 view]]];
         NOWVIEWPOSITION=curruntpoint;
        NOWPOSITION=ccpMult(curruntpoint, 1/self.scaleX) ;
        switch (nowmenuimageTypes) {
            case house:
                NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
                break;
            case road:
                NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
                break;
            case researchinstitution:
                NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
                break;

            case staticobjection:
                NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512, (384+self.position.y)/self.scale-384)) ;
                break;

            default:
                break;
        }

    }
else
{
    
    CGPoint endlocation;
    Contents *m = [Contents getContents];
    NSSet *allTouches = [event allTouches];//获得所有触摸点  
    
    int count = [[allTouches allObjects] count];//当前触摸点数量，单点触摸为1.  
    CANMOVE=YES;
    UITouch *touch1 = [[allTouches allObjects] objectAtIndex:0];//获得第一个触摸点  
    endlocation= [touch1 locationInView: [touch1 view]] ;
     NOWPOSITION=endlocation;
    CGFloat moveinstance=sqrt(pow(endlocation.x - TOUCHBIGANPOINT.x, 2.0f) + pow(endlocation.y - TOUCHBIGANPOINT.y, 2.0f));
    CGFloat moveinstancex;//=endlocation.x -TOUCHBIGANPOINT.x;
    CGFloat moveinstancey;//=endlocation.y - TOUCHBIGANPOINT.y;
    CGFloat tanyx=(endlocation.x -TOUCHBIGANPOINT.x)/(endlocation.y - TOUCHBIGANPOINT.y);
    NSInteger moveinstancexsymbol=(endlocation.x -TOUCHBIGANPOINT.x>0)?1:-1;
   // NSInteger moveinstanceysymbol= (endlocation.y -TOUCHBIGANPOINT.y>0)?1:-1;
    CGFloat Interval=event.timestamp-TOUCHBIGANTIME;
    CGFloat endtscale=self.scale;
    NSInteger times=moveinstance/ Interval;
       
   //// if(times>1200&&CANMOVEanimation)
    if(times>1200)

    {
        //NSLog(@"%f",moveinstance/ Interval);
         
       
            moveinstancex=(times-1200)/200*20*moveinstancexsymbol;
           // moveinstancey=(times-1000)/200*6*moveinstanceysymbol;
        
           if(((endtscale-startscale<0.05&&endtscale-startscale>-0.05)&&count==2)||(count==1&&!ISTOWCOUNT))
        {
   

            Contents *m = [Contents getContents];
            CGFloat deltaX= moveinstancex*(1/self.scaleX);//+moveduration*10;//- m.gestureStartPoint.x;
            //CGFloat deltaY= -moveinstancey*(1/self.scaleY) ;//- moveduration*10;//+ m.gestureStartPoint.y;
            CGFloat deltaY=-deltaX/tanyx;
            CGPoint a=m.cameraPos;
            m.cameraPos = ccpSub(a, ccp(deltaX, deltaY));
            
            CGFloat y = clampf(m.cameraPos.y,-1536+768 -1536*(self.scaleY-1), 1536+1536*(self.scaleY-1));
            CGFloat x = clampf(m.cameraPos.x, -2048+1024-2048*(self.scaleX-1), 2048+2048*(self.scaleX-1));
            m.cameraPos = ccp(x, y);
          
            CGFloat   moveinstance2=sqrt(pow(deltaX, 2.0f) + pow(deltaY, 2.0f));
            
            BOOL ISENDX,ISENDY;
            deltaX=ccpSub(a,m.cameraPos).x;
            deltaY=ccpSub(a,m.cameraPos).y;
            if(y==-1536+768 -1536*(self.scaleY-1)||y==1536+1536*(self.scaleY-1))
            {
                ISENDY=YES;
                
            }
            if(x==-2048+1024-2048*(self.scaleX-1)|| x==2048+2048*(self.scaleX-1))
            {
                ISENDX=YES;
            
            }
            if(ISENDX||ISENDY)
            {
                CGFloat d=deltaX/deltaY,f=tanyx;
                if(d<0)
                { d=-d;}
                if(tanyx<0)
                   f=-tanyx;
                else
                   f=tanyx;

                if(d<f)
                    deltaY=-deltaX/tanyx;
                else
                {
                    deltaX=-deltaY*tanyx;
                }
                m.cameraPos = ccpSub(a,ccp(deltaX, deltaY));
                moveinstance2=sqrt(pow(deltaX, 2.0f) + pow(deltaY, 2.0f));
            }
           
            m.gestureStartPoint =ccpAdd(  m.gestureStartPoint, ccp(deltaX, deltaY));
            CGFloat movetime=moveinstance2/times*2;
            // NSLog(@" movetime:  %f",movetime);
            if(movetime>0)
            {
             if(movetime<0.3)
               {
                movetime=0.3;
               }
                
             CCMoveTo  *movemap = [CCMoveTo actionWithDuration:movetime position:ccp(-m.cameraPos.x+512, -m.cameraPos.y+384)]; 
             ease = [CCEaseOut actionWithAction:movemap rate:1.5f];
             [self runAction:ease];
            }

        
        CANMOVEanimation=NO;
      // connectionTimer=[NSTimer scheduledTimerWithTimeInterval:movetime target:self selector:@selector(handleTimer:)userInfo:nil repeats:NO]  ;
        
    }
    else
    {
    CANMOVEanimation=YES;
    }
    }
  
 HASBIGAN=NO;
}
}



-(CGPoint) tilePosFromLocation:(CGPoint)location tileMap:(CCTMXTiledMap*)tileMap {
    
    // 触摸的位置信息必须减去瓷砖地图的位置信息,因为地图的位置可能在滚动变化
    
    CGPoint a= ccp(-(512+self.position.x)/self.scale+tileMap.mapSize.width/2*tileMap.tileSize.width,-(384+self.position.y)/self.scale+tileMap.mapSize.height/2*tileMap.tileSize.height);
    CGPoint pos = ccpAdd(ccpMult(location, 1/self.scale),a);
    float halfMapWidth = tileMap.mapSize.width * 0.5f;
   //  NSLog(@" ccc:  %f",tileMap.mapSize.height/2*tileMap.tileSize.height);
    float mapHeight = tileMap.mapSize.height;
    float tileWidth = tileMap.tileSize.width;
    float tileHeight = tileMap.tileSize.height;
    //ccp((512+self.position.x)/self.scale+, (384+self.position.y)/self.scale)
    
    CGPoint tilePosDiv = CGPointMake(pos.x / tileWidth, pos.y / tileHeight); 
   
    float inverseTileY = mapHeight - tilePosDiv.y;
   // inverseTileY =tilePosDiv.y;
    // 将得到的计算结果转换成 int,以确保得到的是整数
    float posX = (int)(inverseTileY + tilePosDiv.x - halfMapWidth); 
    float posY = (int)(inverseTileY - tilePosDiv.x + halfMapWidth);
    // 确保坐标在地图的边界之内
    posX = MAX(0, posX);
    posX = MIN(tileMap.mapSize.width - 1, posX); 
    posY = MAX(0, posY);
    posY = MIN(tileMap.mapSize.height - 1, posY);
    return CGPointMake(posX, posY);
}
-(CGPoint) locationPosFromtilen:(CGPoint)tilelocation tileMap:(CCTMXTiledMap*)tileMap {
    
    // 触摸的位置信息必须减去瓷砖地图的位置信息,因为地图的位置可能在滚动变化
    float halfMapWidth = tileMap.mapSize.width * 0.5f;
   // NSLog(@" ccc:  %f",tileMap.mapSize.height/2*tileMap.tileSize.height);
    float mapHeight = tileMap.mapSize.height;
    float tileWidth = tileMap.tileSize.width;
    float tileHeight = tileMap.tileSize.height;
    float inverseTileY=(tilelocation.x+tilelocation.y)/2;
    float tilePosDivy = mapHeight - inverseTileY;
    float posy=tilePosDivy*tileHeight;
  //  float inverseTileY=(tilelocation.x+tilelocation.y)/2;
    float tilePosDivx = (tilelocation.x-tilelocation.y+2*halfMapWidth)/2;
   // float posy=tilePosDivy*tileHeight;
    float posx=tilePosDivx*tileWidth;
    CGPoint a= ccp(-(512+self.position.x)/self.scale+tileMap.mapSize.width/2*tileMap.tileSize.width,-(384+self.position.y)/self.scale+tileMap.mapSize.height/2*tileMap.tileSize.height);
    CGPoint posposition =ccpMult(ccpSub(ccp(posx,posy), a), self.scale) ;
    return posposition;
    
    //ccpAdd(ccpMult(location, 1/self.scale),a);

}

//视图位置转换为地图位置
- (CGPoint)viewPosToMapPos:(CGPoint)pos{
    CGPoint mapPos = [self bgPosToMapPos:[self viewPosToBgPos:pos]];
    return mapPos;
}

//地图位置转换为视图位置
- (CGPoint)MapPosToViewPos:(CGPoint)pos{
    CGPoint viewPos = [self bgPosToMapPos:[self mapPosToBgPos:pos]];
    return viewPos;
}

//世界位置转换为视图位置
- (CGPoint)bgPosToViewPos:(CGPoint)pos{
    Contents *m = [Contents getContents];
    return ccpSub(ccpMult(pos, MAPSCALE), m.cameraPos);
}

//视图位置转换为世界位置
- (CGPoint)viewPosToBgPos:(CGPoint)pos{
    Contents *m = [Contents getContents];
    CGPoint posToBg = ccpMult(ccpAdd(pos, m.cameraPos), 1/MAPSCALE);
    return posToBg;
}

//判断一个点是否在45度地图里
- (BOOL)isInMap:(CGPoint)pos{
    if (pos.x <= map.mapSize.width &&
            pos.x >= 0 &&
            pos.y <= map.mapSize.height &&
            pos.y >= 0)
    {
        return YES;
    }
    return NO;
}

//世界位置转换为45度地图位置
- (CGPoint)bgPosToMapPos:(CGPoint)pos{
    CGFloat halfHeight = map.tileSize.height/2;
    CGFloat halfWidth = map.tileSize.width/2;
    //找到地图(0,0)原点在世界坐标中的位置
    CGPoint mapSource = ccp(map.mapSize.height*halfWidth, (map.mapSize.height+map.mapSize.width)*halfHeight);
    //用当前世界位置减去原点在世界中的位置
    CGPoint disVec = ccpSub(pos, mapSource);
    CGFloat x_45 = (0.25*disVec.x-0.5*disVec.y)/halfHeight;
    CGFloat y_45 = (-0.25*disVec.x-0.5*disVec.y)/halfHeight;
    CGPoint mapPos = ccp(x_45, y_45);
    if ([self isInMap:mapPos] == YES) {
        return mapPos;
    }
    return ccp(-1, -1);
}

//45度地图位置转换为世界位置
- (CGPoint)mapPosToBgPos:(CGPoint)pos{
    CGFloat halfHeight = map.tileSize.height/2;
    CGFloat halfWidth = map.tileSize.width/2;
    //找到地图(0,0)原点
    CGPoint mapSource = ccp(map.mapSize.height*halfWidth, (map.mapSize.height+map.mapSize.width)*halfHeight);
    CGFloat x = 2*pos.x-2*pos.y;
    CGFloat y = -pos.x-pos.y;
    //世界坐标下相对于地图原点的距离 + 地图原点在世界中的坐标 = 实际位置
    CGPoint bgPos = ccpAdd(ccp(x, y), mapSource);
    return bgPos;
}

//检测精灵是否在建筑的背面
- (BOOL)IsInShadow:(MySprite*)sprite
               Map:(CCTMXTiledMap*)mapData
{
    //得到地图的阴影区域
    CCTMXObjectGroup *objects = [map objectGroupNamed:@"object"];
    NSMutableDictionary *shadows;
    int counter = 1;
    while ((shadows = [objects objectNamed:[NSString stringWithFormat:@"shadow%d", counter]]))
    {
        
        CGFloat x = [[shadows valueForKey:@"x"] floatValue];
		CGFloat y = [[shadows valueForKey:@"y"] floatValue];
        CGFloat width = [[shadows valueForKey:@"width"] floatValue];
		CGFloat height = [[shadows valueForKey:@"height"] floatValue];
        CGPoint spPosToMap = [self bgPosToMapPos: sp.position];
        if (CGRectContainsPoint(CGRectMake(x, y, width, height), spPosToMap)) {
            return YES;
        }
        counter++;
    }
    return NO;
}
-(void)retuenonehenhouse:(NSString *)sender ISFIRSTTAPED:(BOOL)FIRSTTAP
{
    DAState *newhenhouse;
    if(FIRSTTAP)
    {
        iidstring1=sender;
       //  NSLog(@" aaa %@   ", iidstring1);
    }
    else
    {
        iidstring2=sender;
        //sender iidstring
  [[DAPlayerService sharePlayerService  ] UpgradHenHouseByDestHenhouseID:iidstring1 SrcHenHouseID:iidstring2];
    //   NSLog(@" aaa %@   ", iidstring1);
     //  NSLog(@    "   aaa%@ aaa %@   ",iidstring1, iidstring2);
 
    [[DAWorldMapService shareWorldMapService]getBuildingByID:iidstring1];
   // [self addChild:newhouse z:buildingentity.nZindex tag:buildingentity.nTag];
      //  NSLog(@"ididididi   %@",buildingentity.ID); 
        
       // NSLog(@"aaa %d  ddd   %d",buildingentity.nPosX, buildingentity.nPosY);


     //  DABuildingEntity *buildingentity2=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iidstring2];
        DABuildingEntity *buildingentity3=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iidstring1];
      //  Henhouse  *newhouse1= [Henhouse Henhouse:1];
//[self addChild:newhouse1 z:buildingentity2.nZindex tag:buildingentity2.nTag];
    //    newhouse1.position=ccp(buildingentity2.nPosX, buildingentity2.nPosY);
        //[newhouse showtheiconofhouse:YES ICONKIND:IHENHOUSE ISSENDERCALMDOWN:NO];
      
        /*Henhouse  *newhouse2= [Henhouse Henhouse:1];
        [self addChild:newhouse2 z:buildingentity3.nZindex tag:buildingentity3.nTag];
        newhouse2.position=ccp(buildingentity3.nPosX, buildingentity3.nPosY);
        
        NSLog(@"aaa %f  ddd   %f",newhouse2.position. x, newhouse2.position.y);*/
        [self initfreshtheview];

    }


   /* for(int i=0;i<henhousearray2.count;i++)
    {
        NSString *iid=[henhousearray2 objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iid];
        
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        if(abs( newhouse.position.x-position.x)<640&&abs( newhouse.position.x-position.x)>0&&abs( newhouse.position.y-position.y)<320&&abs( newhouse.position.y-position.y)>0)
        {
            [newhouse showtheiconofhouse:YES ICONKIND:IHENHOUSE ISSENDERCALMDOWN:NO];
            
            Henhouse *childsprite=[self getChildByTag:buildingentity.nTag];
            [childsprite  showtheiconofhouse:YES ICONKIND:IHENHOUSE ISSENDERCALMDOWN:NO];
            
            
        }
        
               
    }
        iidstring1=nil;
        iidstring2=nil;
    
    }
    */



}
-(void)retuenonehenhouse2:(CGPoint)point
{

    NSArray  *henhousearray2=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
    
    for(int i=0;i<henhousearray2.count;i++)
    {
        NSString *iid=[henhousearray2 objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iid];
        
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        if(abs( point.x-position.x)<320&&abs( point.x-position.x)>0&&abs(point.y-position.y)<160&&abs( point.y-position.y)>0)
        {

            
            Henhouse *childsprite=[self getChildByTag:buildingentity.nTag];
            childsprite.inhenhouseen.visible=NO;   
            childsprite.menuhasbeentap.visible=YES;
            childsprite.isleveluporgoginglevelup=YES;
            if(childsprite.isleveluporgoginglevelup)
                NSLog(@"bbbb");
            
        }
        
        
    }



}
- (void)resize:(CGFloat)newScale{
    _mapScale = newScale;
  
    self.scale = _mapScale;
   
    
   // }
}


-(void)addHenHouseinview
{
    
    MOVEMENU=NO; 
    [self unschedule:@selector(step:)];
     OBJECTISPUTDOWN=YES;
}

-(void)addTECHLABinview
{

    MOVEMENU=NO;
    [self unschedule:@selector(step:)];
     OBJECTISPUTDOWN=YES;
}

-(void)addHenhouseindata
{
   
    //change the tile's property
    CCNode* node = [self getChildByTag:TileMapNode];
    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
    CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];
    
    NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:tilePos.x*160+tilePos.y];
    [nowtiled setObject:[NSNumber numberWithBool:YES] forKey:@"ISHOUSE"];
    
    //change the houseplist's property
    /* NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/house.plist"];
     NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathhouse];
     NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    [states setObject:[NSNumber numberWithInt:data.count+HOUSETAG]  forKey:@"tag"];
    [states setObject:[NSNumber numberWithInt:tilePos.x]  forKey:@"house-x"];
    [states setObject:[NSNumber numberWithInt:tilePos.y]  forKey:@"house-y"];
    
    [data addObject:states];
    [data writeToFile:filepathhouse atomically:YES];*/
    
    NSArray *henhousearray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
    
 

    [self  tilednodeschangeiscanadd:NOWHENHOUSE.linesize CENTERPOSOTION:tilePos CANORNOT:NO];
    [self FRESHPLISTDATE];
    
   // NSString *buildname=[NSString stringWithFormat:@"一级鸡舍",data.count+HOUSETAG];
    NSString *buildname=[NSString stringWithFormat:@"一级鸡舍"];
     if (NOWHENHOUSE.houselevel==1 ) {
        buildname=[NSString stringWithFormat:@"一级鸡舍"];
    }
    else if (NOWHENHOUSE.houselevel==2 ) {
        buildname=[NSString stringWithFormat:@"一级鸡舍"];
    }
    else if (NOWHENHOUSE.houselevel==3 ) {
        buildname=[NSString stringWithFormat:@"一级鸡舍"];
    }
    else if (NOWHENHOUSE.houselevel==4 ) {
        buildname=[NSString stringWithFormat:@"一级鸡舍"];
    }
    else if (NOWHENHOUSE.houselevel==5 ) {
        buildname=[NSString stringWithFormat:@"一级鸡舍"];
    }
    objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Breeding PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:henhousearray.count+HOUSETAG Zindex:henhousearray.count+HOUSETAG BTans:NO].ID;
    NOWHENHOUSE.iid=objectid;     
  // NSLog(@"string is :%@", objectid);
    henhousearray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];

    for(int i=0;i<henhousearray.count;i++)
    {
        NSString *iid=[henhousearray objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iid];
        
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        if(abs( NOWPOSITION.x-position.x)<640&&abs( NOWPOSITION.x-position.x)>0&&abs( NOWPOSITION.y-position.y)<320&&abs( NOWPOSITION.y-position.y)>0)
        {
            [NOWHENHOUSE showtheiconofhouse:YES ICONKIND:IHENHOUSE ISSENDERCALMDOWN:NO];
        
            Henhouse *childsprite=[self getChildByTag:buildingentity.nTag];
            [childsprite  showtheiconofhouse:YES ICONKIND:IHENHOUSE ISSENDERCALMDOWN:NO];
        
        }
        
        
        
        
    }

}

-(void)addTECHLABindata
{
    
    //change the tile's property
    CCNode* node = [self getChildByTag:TileMapNode];
    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
    CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];
    
   // NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:tilePos.x*160+tilePos.y];
    //[nowtiled setObject:[NSNumber numberWithBool:YES] forKey:@"ISHOUSE"];
    
    //change the houseplist's property
   /*
    NSString *filepathTECHLAB=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/TECHLAB.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathTECHLAB];
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    [states setObject:[NSNumber numberWithInt:data.count+TECHLABTAG]  forKey:@"tag"];
    [states setObject:[NSNumber numberWithInt:tilePos.x]  forKey:@"TECHLAB-x"];
    [states setObject:[NSNumber numberWithInt:tilePos.y]  forKey:@"TECHLAB-y"];
    
    [data addObject:states];
    [data writeToFile:filepathTECHLAB atomically:YES];
    */
  
    [self  tilednodeschangeiscanadd:NOWITEMIMAGE.linesize CENTERPOSOTION:tilePos CANORNOT:NO];
    [self FRESHPLISTDATE];
    
    NSString *buildname=[NSString stringWithFormat:@"一级加工厂"];
    switch (NOWITEMIMAGE.kindd) 
    {
        case TECHLABKIND:
        { buildname=[NSString stringWithFormat:@"一级科研楼"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWITEMIMAGE.tag Zindex:NOWITEMIMAGE.tag BTans:NO].ID;


        }
            break;
        case FACTORY:
        {buildname=[NSString stringWithFormat:@"一级加工厂"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Processing PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWITEMIMAGE.tag Zindex:NOWITEMIMAGE.tag BTans:NO].ID;
}
            break;

        case WINDMILL:
        {buildname=[NSString stringWithFormat:@"风车"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWITEMIMAGE.tag Zindex:NOWITEMIMAGE.tag BTans:NO].ID;

        }
            break;

        case MACHINE:
        {
            /*buildname=[NSString stringWithFormat:@"一级科研楼"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Breeding PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWITEMIMAGE.tag Zindex:NOWITEMIMAGE.tag BTans:NO].ID;
       */
        
        }
            break;

        default:
            break;
    }   
   // NSLog(  @"uuxxx  :%f   uuyy :%f",NOWPOSITION.x,NOWPOSITION.y);

    [self initfreshtheview];
}

-(void)addstaticobjectinview
{
    MOVEMENU=NO;
    [self unschedule:@selector(step:)];
     OBJECTISPUTDOWN=YES;
    

}

-(void)addstaticobjectindata
{
   
    //change the tile's property
    CCNode* node = [self getChildByTag:TileMapNode];
    CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
    CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];
    
    // NSMutableDictionary *nowtiled=[TILEDSARRAY objectAtIndex:tilePos.x*160+tilePos.y];
    //[nowtiled setObject:[NSNumber numberWithBool:YES] forKey:@"ISHOUSE"];
    
    //change the houseplist's property
  /*
    NSString *filepathTECHLAB=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/TECHLAB.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathTECHLAB];
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    [states setObject:[NSNumber numberWithInt:data.count+TECHLABTAG]  forKey:@"tag"];
    [states setObject:[NSNumber numberWithInt:tilePos.x]  forKey:@"TECHLAB-x"];
    [states setObject:[NSNumber numberWithInt:tilePos.y]  forKey:@"TECHLAB-y"];
    
    [data addObject:states];
    [data writeToFile:filepathTECHLAB atomically:YES];
   */
   // NOWSTATICOBJECT.tag=data.count+TECHLABTAG;
    [self  tilednodeschangeiscanadd:NOWITEMIMAGE.linesize CENTERPOSOTION:tilePos CANORNOT:NO];
    [self FRESHPLISTDATE];    
    NSString *buildname=[NSString stringWithFormat:@"蓄水池"];
    switch (NOWSTATICOBJECT.effect) {
            /*p ool,//水池
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
            
*/
        case pool:
        { buildname=[NSString stringWithFormat:@"蓄水池"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;
        case haystackeffect:
        {buildname=[NSString stringWithFormat:@"草垛"];
         objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;}
            break;
            
        case guarderhouseeffect:
        {buildname=[NSString stringWithFormat:@"看守者小屋"];
         objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;
            
        case Palmtree:
        {buildname=[NSString stringWithFormat:@"棕榈树"];
         objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;
        case bambooeffect:
        {buildname=[NSString stringWithFormat:@"竹"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;

        case coconuttree:
        {buildname=[NSString stringWithFormat:@"椰子树"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;

        case peachtree:
        {buildname=[NSString stringWithFormat:@"桃树"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;

        case banian:
        {buildname=[NSString stringWithFormat:@"榕树"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;

        case willow:
        {buildname=[NSString stringWithFormat:@"柳树"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;
        case Spiritualtone:
        {buildname=[NSString stringWithFormat:@"蛋灵石"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;
        case goldenflower:
        {buildname=[NSString stringWithFormat:@"金花"];
            objectid=  [[DAPlayerService sharePlayerService] AddBuildingbyName:buildname Type:BuildingType_Magic PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:NOWSTATICOBJECT.tag Zindex:NOWSTATICOBJECT.tag BTans:NO].ID;
        }
            break;

        default:
            break;
    }   
  //  objectid=  [daplayerservice AddBuildingbyName:buildname Type:BuildingType_Breeding PosX:NOWPOSITION.x posY:NOWPOSITION.y Tag:data.count+HOUSETAG Zindex:data.count+HOUSETAG BTans:NO].ID;
    
    


}
- (void)step:(ccTime) dt 
{
      
        switch (nowmenuimageTypes)
    {
        case house:
        {
            
            if(MOVEMENU)
                NOWHENHOUSE.position=NOWPOSITION ;
            
            CCNode* node = [self getChildByTag:TileMapNode];
            CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;  
            
            CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];    
           // NSLog(@"xxx: %f  yyy: %f",tilePos.x,tilePos.y);
           // NSLog(@"xhhxx: %f  yhhyy: %f",tilePos.x,tilePos.y);
           if(![self ISCANADDOBJECTINBLUE:5 CENTERPOSOTION:tilePos])
            {
               
                 NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",NOWHENHOUSE.linesize];
                NOWHENHOUSE.sure.visible=NO;
                CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage:linetype  ];
                [NOWHENHOUSE setTexture:texture];
                NOWHENHOUSE.opacity=150;;
                
            
            }
            else if([self ISCANADDOBJECTINBLUE:5 CENTERPOSOTION:tilePos])
    {
      
             if([self ISCANADDOBJECTINROAD:5 CENTERPOSOTION:tilePos]&&(![self ISCANADDOBJECTINROAD:9 CENTERPOSOTION:tilePos]))
            
            {
                 NSString *linetype=[NSString stringWithFormat: @"greenline-%d.png",NOWHENHOUSE.linesize];
                NOWHENHOUSE.sure.visible=YES;
                CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                [NOWHENHOUSE setTexture:texture];
                               
            }
            else if(![self ISCANADDOBJECTINROAD:5 CENTERPOSOTION:tilePos])
            {    
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",NOWHENHOUSE.linesize];
               NOWHENHOUSE.sure.visible=NO;
                CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                [NOWHENHOUSE setTexture:texture];
            }
            else if([self ISCANADDOBJECTINROAD:9 CENTERPOSOTION:tilePos])
            {
                
                NSString *linetype=[NSString stringWithFormat: @"yellowline-%d.png",NOWHENHOUSE.linesize];
              NOWHENHOUSE.sure.visible=NO;
                CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                [NOWHENHOUSE setTexture:texture];

            }
    }
        }
            break;
        case road:
        {
                       //sure.position= ccp(798+(int)((NOWPOSITION.x-798)/192)*192,1312+(int)((NOWPOSITION.y-1312)/96)*96);
            
           // CGPoint tilePos = [self tilePosFromLocation:location tileMap:tileMap];    
           // NSLog(@"xxx: %f  yyy: %f",tilePos.x,tilePos.y);
         //   NSLog(@"xxx: %f  yyy: %f",NOWPOSITION.x,NOWPOSITION.y);
            CCNode* node = [self getChildByTag:TileMapNode];
            // NSAssert([node isKindOfClass:[CCTMXTiledMap class]], @"not a CCTMXTiledMap"); 
            CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;    
            CCTMXLayer* loadLayer = [tileMap layerNamed:@"公路"]; 
             CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];   
            CGPoint cubelocation=ccp(30+(int)((tilePos.x-30)/3)*3,68+(int)((tilePos.y-68)/3)*3);
           // CGPoint positionnow=[self locationPosFromtilen:cubelocation tileMap:tileMap];
          //  NOWPOSITION= ccpSub(NOWPOSITION,ccp((512+self.position.x)/self.scale-512-724, (384+self.position.y)/self.scale-384+965)) ;
           // sure.position=NOWPOSITION;
           // CGPoint positionnow=[self locationPosFromtilen:cubelocation tileMap:tileMap];
            //if((cubelocation.x==tilePos.x&& cubelocation.y==tilePos.y)&&tilePos.y<78&&)
                       int tileGIDleftup1 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(-3,2)) ];
            int tileGIDleftdow3 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(0,5)) ];
            int tileGIDrightdow4 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(3,2))];
            int tileGIDrightup2 = [loadLayer tileGIDAt:ccpAdd(cubelocation, ccp(0,-1))];
            // NSLog(@" %d %d  %d %d ",tileGIDleftup1,tileGIDrightdow4,tileGIDrightup2,tileGIDleftdow3);
            
            
            
    
            
            
            
            
            
            ////
          //  NOWITEMIMAGE.position=ccpSub(positionnow,ccp((512+self.position.x)/self.scale-512-693, (384+self.position.y)/self.scale-384+999)) ;
            NOWITEMIMAGE.visible=NO; 
            //if()
            if([self ISCANADDOBJECTINBLUE:3 CENTERPOSOTION:cubelocation])

            if([self ISCANADDOBJECT:3 CENTERPOSOTION:cubelocation])
            {
            if (tileGIDleftup1 != 0||tileGIDleftdow3 != 0||tileGIDrightdow4 != 0||tileGIDrightup2 != 0) 
            {
                
               // Tilednode *nowtiled=[TILEDSARRAY objectAtIndex:(tilePos.x-1)*160+tilePos.y ];
               // nowtiled.ISTREE=YES;
               
               ///    [NOWITEMIMAGE setSelectedImage:[CCSprite spriteWithFile:@"公路-1.png"]];
               /// [NOWITEMIMAGE setNormalImage:[CCSprite spriteWithFile:@"公路-1.png"]];
                if (tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0) 
                {
                    [loadLayer setTileGID:5 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 == 0)
                {
                    [loadLayer setTileGID:6 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
                {
                   [loadLayer setTileGID:7 at:ccpAdd(cubelocation, ccp(0,2)) ];
                    
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0)
                {
                    [loadLayer setTileGID:8 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 == 0)
                {
                    [loadLayer setTileGID:9 at:ccpAdd(cubelocation, ccp(0,2)) ];
                    
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0)
                {
                    [loadLayer setTileGID:10 at:ccpAdd(cubelocation, ccp(0,2)) ];
                    
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3!= 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 == 0)
                {
                   [loadLayer setTileGID:11 at:ccpAdd(cubelocation, ccp(0,2)) ];
                    
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
                {
                    [loadLayer setTileGID:12 at:ccpAdd(cubelocation, ccp(0,2)) ];
                    
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
                {
                    [loadLayer setTileGID:13 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 == 0)
                {
                   [loadLayer setTileGID:14 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 != 0)
                {
                   [loadLayer setTileGID:15 at:ccpAdd(cubelocation, ccp(0,2)) ];
                    
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 != 0)
                {
                    [loadLayer setTileGID:16 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 != 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&tileGIDrightup2 == 0)
                {
                    [loadLayer setTileGID:17 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3 != 0&&tileGIDrightdow4 == 0&&tileGIDrightup2 == 0)
                {
                   [loadLayer setTileGID:18 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
                else if(tileGIDleftup1 == 0&&tileGIDleftdow3 == 0&&tileGIDrightdow4 != 0&&  tileGIDrightup2 == 0)
                {
                    [loadLayer setTileGID:19 at:ccpAdd(cubelocation, ccp(0,2)) ];
                }
              //  if(LASTROAD.x!=ccpAdd(cubelocation, ccp(0,2)).x||LASTROAD.y!=ccpAdd(cubelocation, ccp(0,2)).y)
                   
               // [self  tilednodeschangeiscanadd:3 CENTERPOSOTION:cubelocation CANORNOT:NO];

            }
            
          else
            {
                
                 [loadLayer setTileGID:5 at:ccpAdd(cubelocation, ccp(0,2)) ];
            ///    [NOWITEMIMAGE setSelectedImage:[CCSprite spriteWithFile:@"公路-15.png"]];
             ///   [NOWITEMIMAGE setNormalImage:[CCSprite spriteWithFile:@"公路-15.png"]];
            }
            if(LASTROAD.x!=ccpAdd(cubelocation, ccp(0,2)).x||LASTROAD.y!=ccpAdd(cubelocation, ccp(0,2)).y)
            {   
                CGPoint nnn=ccpAdd(cubelocation, ccp(0,2));
                sure.position=ccpAdd( sure.position, ccp((nnn.x-LASTROAD.x)*32, -(nnn.x -LASTROAD.x)*16));
                sure.position=ccpAdd( sure.position, ccp(-(nnn.y-LASTROAD.y)*32, -(nnn.y -LASTROAD.y)*16));
                //NSLog(@"lastxxx: %f  lastttttyyy: %f",LASTROAD.x,LASTROAD.y); 

            if(!OBJECTISPUTDOWN)
            [loadLayer removeTileAt:LASTROAD ];                     
                       }
            LASTROAD=ccpAdd(cubelocation, ccp(0,2));

            
        
        }
            break;
            case researchinstitution:
        {
        
            if(MOVEMENU)
                NOWITEMIMAGE.position=NOWPOSITION ;

            CCNode* node = [self getChildByTag:TileMapNode];
            CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;  
            
            CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];    
           // NSLog(@"xxx: %f  yyy: %f",tilePos.x,tilePos.y);
               NOWITEMIMAGE.selfpositionintiels=NOWPOSITION;
            if(![self ISCANADDOBJECTINBLUE:5 CENTERPOSOTION:tilePos])
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",NOWITEMIMAGE.linesize];
                CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage:linetype];
                NOWITEMIMAGE.sure.visible=NO;
                [NOWITEMIMAGE setTexture:texture];
                                          
            }
            else if([self ISCANADDOBJECTINBLUE:5 CENTERPOSOTION:tilePos])
            {
                if([self ISCANADDOBJECTINROAD:5 CENTERPOSOTION:tilePos])
                    
                {
                    NOWITEMIMAGE.sure.visible=YES;
                    NSString *linetype=[NSString stringWithFormat: @"greenline-%d.png",NOWITEMIMAGE.linesize];
                    CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                    [NOWITEMIMAGE setTexture:texture];
                    

                }
                else if(![self ISCANADDOBJECTINROAD:5 CENTERPOSOTION:tilePos])
                {    
                    NOWITEMIMAGE.sure.visible=NO;
                    NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",NOWITEMIMAGE.linesize];
                    CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                    [NOWITEMIMAGE setTexture:texture];
                  
                                    }
                           }

        }
        
        }
            break;
        case staticobjection:
        {
            
            if(MOVEMENU)
                NOWSTATICOBJECT.position=NOWPOSITION ;
            
            CCNode* node = [self getChildByTag:TileMapNode];
            CCTMXTiledMap* tileMap = (CCTMXTiledMap*)node;  
            
            CGPoint tilePos = [self tilePosFromLocation:NOWVIEWPOSITION tileMap:tileMap];    
          //  NSLog(@"xhhxx: %f  yhhyy: %f",tilePos.x,tilePos.y);

            NOWSTATICOBJECT.selfpositionintiels=NOWPOSITION;
            if(![self ISCANADDOBJECTINBLUE:5 CENTERPOSOTION:tilePos])
            {
                NOWSTATICOBJECT.sure.visible=NO;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",NOWSTATICOBJECT.linesize];
                CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage:linetype];
                [NOWSTATICOBJECT setTexture:texture];
               
                
            }
            else if([self ISCANADDOBJECTINBLUE:NOWSTATICOBJECT.linesize CENTERPOSOTION:tilePos])
            {
                if([self ISCANADDOBJECTINROAD:NOWSTATICOBJECT.linesize CENTERPOSOTION:tilePos])
                    
                {
                    NOWSTATICOBJECT.sure.visible=YES;
                    NSString *linetype=[NSString stringWithFormat: @"greenline-%d.png",NOWSTATICOBJECT.linesize];
                    CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                    [NOWSTATICOBJECT  setTexture:texture];
                   
                    
                }
                else if(![self ISCANADDOBJECTINROAD:NOWSTATICOBJECT.linesize CENTERPOSOTION:tilePos])
                {   
                    NOWSTATICOBJECT.sure.visible=NO;
                    NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",NOWSTATICOBJECT.linesize];
                    CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: linetype];
                    [NOWSTATICOBJECT setTexture:texture];
                  
                }
                          }
            
        
            
    }
    break;

        default:
            break;
    } 
   
    
    
}

- (void) dealloc
{
    
    [super dealloc];
}
@end
