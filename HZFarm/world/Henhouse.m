//
//  Henhouse.m
//  MapTest
//
//  Created by hzbc on 12-3-31.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Henhouse.h"
#import "ShedsController.h"
#import "SceneManager.h"
@interface Henhouse (PrivateMethods)
-(id) initWithHenhouseImage:(int)level;
-(id) initWithHenhouseImageoneandanimation:(int)level;
-(void)surebuildone;
@end


@implementation Henhouse
@synthesize worldlayerprotocoll,linesize,houselevel,iid,sure,menuhasbeentap,levelup,isleveluporgoginglevelup,inhenhouseen;

+(id) Henhouse:(int)level
{
	return [[[self alloc] initWithHenhouseImage:level] autorelease];
}
+(id) Henhouseview:(int)level
{

    return [[[self alloc] initWithHenhouseImageoneandanimation:level] autorelease];

 


}
-(void)levelup:(id)sender
{
    //[self.worldlayerprotocoll retuenonehenhouse:iid];
    if (!isleveluporgoginglevelup) {
        [self.worldlayerprotocoll retuenonehenhouse2:self.position];
        [self.worldlayerprotocoll retuenonehenhouse:iid  ISFIRSTTAPED:YES];
        NSLog(@"%@",iid);
    }
    else
    {
        [self.worldlayerprotocoll retuenonehenhouse:iid  ISFIRSTTAPED:NO];
        NSLog(@"%@",iid);
    }
    
}
-(void)houseinit:(id)sender
{
    NSLog(@"%@",iid);
    [SceneManager goSecondScene:iid];

}
-(void)surebuild:(id)sender
{
 
    
    undercolor.isEnabled=YES;
   // [self.worldlayerprotocoll isshowthespeaker:YES OBJECTKIND:iTECHLABKIND];
    //[self.worldlayerprotocoll setthespeakerwords:@"建筑物"];
    switch (houselevel) {
        case 5:
        {
            self.opacity=0;//消失底边
            [self removeChild:buildmenu cleanup:YES];
            [self.worldlayerprotocoll addHenHouseinview];
            [self.worldlayerprotocoll addHenhouseindata];
            //add animations
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"jieshe_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            [pet runAction:repeat];
            
            
            
            NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jishe_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            [petgear runAction:repeatgear];

        }
            break;
        case 4:
        {
            self.opacity=0;//消失底边
            [self removeChild:buildmenu cleanup:YES];
            [self.worldlayerprotocoll addHenHouseinview];
            [self.worldlayerprotocoll addHenhouseindata];
            //add animations
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
                       
            
            
            NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jishe_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            [petgear runAction:repeatgear];
 
        }
            break;
        case 3:
        {
            self.opacity=0;//消失底边
            [self removeChild:buildmenu cleanup:YES];
            [self.worldlayerprotocoll addHenHouseinview];
            [self.worldlayerprotocoll addHenhouseindata];
            //add animations
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
                        NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jishe_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            [petgear runAction:repeatgear];

        }
            break;
        case 2:
        {
            self.opacity=0;//消失底边
            [self removeChild:buildmenu cleanup:YES];
            [self.worldlayerprotocoll addHenHouseinview];
            [self.worldlayerprotocoll addHenhouseindata];
            //add animations
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jishe_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            [petgear runAction:repeatgear];

        }
            break;
        case 1:
        {
            self.opacity=0;//消失底边
            [self removeChild:buildmenu cleanup:YES];
            [self.worldlayerprotocoll addHenHouseinview];
            [self.worldlayerprotocoll addHenhouseindata];
            //add animations
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jishe_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            [petgear runAction:repeatgear];

        }
            break;
            
        default:
            break;
    }
    


}
-(void)makerotation:(id)sender
{
   // undercolor.=YES;

}
-(void)inhenhouse:(id)sender
{
   /*     [self.worldlayerprotocoll retuenonehenhouse:pet];
    NSArray *henhousearray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
    
    for(int i=0;i<henhousearray.count;i++)
    {
        NSString *iidd=[henhousearray objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iidd];
        
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        
        if(CGPointEqualToPoint( self.position,position))
        { [SceneManager goSecondScene:buildingentity.ID];
        }
    }*/
     
    
    isleveluporgoginglevelup=NO;

    menuhasbeentap.visible=YES;
//[SceneManager goSecondScene:iid];
    
}
-(id) initWithHenhouseImage:(int)level
{
	if(self=[super initWithFile:@"redline-5.png"])
    {
       inhenhouseen=[CCMenuItemImage itemFromNormalImage:@"roost_0.png" selectedImage:@"roost_1.png" target:self selector:@selector(houseinit:)];        
        
         levelup=[CCMenuItemImage itemFromNormalImage:@"level up_0.png" selectedImage:@"level up_1.png"  target:self
                                                                   selector:@selector(levelup:)];
        inhenhouseen.position= ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
        levelup.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
        

        menuhasbeentap = [CCMenu menuWithItems:inhenhouseen,levelup,nil]; 
        menuhasbeentap.anchorPoint = ccp(0.5, 0.5);
        
        menuhasbeentap.position = ccp(0, 0); 
        [self addChild:menuhasbeentap z:5];
        menuhasbeentap.visible=NO;
            
        
        houselevel=level;
         sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" disabledImage:@"mark_1.png"  target:self selector:@selector(surebuild:) ];
        self.opacity=150;
        switch (level) {
            case 5:
            {
                
               // CCMenuItemImage *undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍5级.png" selectedImage:@"鸡舍5级.png"  target:self selector:@selector(inhenhouse:) ];
                undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍5级.png" selectedImage:@"鸡舍5级.png"  target:self selector:@selector(inhenhouse:) ];

                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                undercolor.isEnabled=NO;
                //[CCSprite spriteWithFile:@"鸡舍5级.png"];
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
              
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                pet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                      [NSString stringWithFormat:@"jieshe_1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                pet.anchorPoint = CGPointMake(0.5f, 0.5f);
                pet.position =   ccp([self contentSize].width/2+45, [self contentSize].height+65);
                [self addChild: pet z:3 ];
                //CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
                self.linesize=5;

            }
                break;
            case 4:
            {
                undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍4级.png" selectedImage:@"鸡舍4级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
                undercolor.isEnabled=NO;;
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                self.linesize=5;

            }
                break;
            case 3:
            {
            
                undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍3级.png" selectedImage:@"鸡舍3级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
               undercolor.isEnabled=NO;;
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];

                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                self.linesize=5;

            }
                break;
            case 2:
            { undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍2级.png" selectedImage:@"鸡舍2级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
               undercolor.isEnabled=NO;
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                self.linesize=5;
            
            }
                break;
            case 1:
            {  undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍1级.png" selectedImage:@"鸡舍1级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
                undercolor.isEnabled=NO;
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-30, [self contentSize].height-3);
                [self addChild: petgear z:3 ];
                self.linesize=5;

            
            }
                break;
            default:
                break;
        }
                
    }
 
    iconmutablerray=[[NSMutableArray alloc] init];

    return self;
    
    // Loading the Ship's sprite using a sprite frame name (eg the filename)
}
-(id) initWithHenhouseImageoneandanimation:(int)level
{
    
	if(self=[super initWithFile:@"redline-5.png"])
    {houselevel=level;
     
       // menuhasbeentap.visible=YES;

        sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" disabledImage:@"mark_1.png"  target:self selector:@selector(surebuild:) ];         
        self.opacity=150;
        inhenhouseen=[CCMenuItemImage itemFromNormalImage:@"roost_0.png" selectedImage:@"roost_1.png" target:self selector:@selector(houseinit:)];        
        
         levelup=[CCMenuItemImage itemFromNormalImage:@"level up_0.png" selectedImage:@"level up_1.png"  target:self
                                                             selector:@selector(levelup:)];
        inhenhouseen.position= ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
        levelup.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
        
        
        menuhasbeentap = [CCMenu menuWithItems:inhenhouseen,levelup,nil]; 
        menuhasbeentap.anchorPoint = ccp(0.5, 0.5);
        
        menuhasbeentap.position = ccp(0, 0); 
        [self addChild:menuhasbeentap z:5];
        menuhasbeentap.visible=NO;
        switch (level) {
            case 5:
            {
               undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍5级.png" selectedImage:@"鸡舍5级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
               
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
                       CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                pet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                      [NSString stringWithFormat:@"jieshe_1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                pet.anchorPoint = CGPointMake(0.5f, 0.5f);
                pet.position =   ccp([self contentSize].width/2+45, [self contentSize].height+65);
                [self addChild: pet z:3 ];
                //CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
                self.linesize=5;
                
            }
                break;
            case 4:
            {
                undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍4级.png" selectedImage:@"鸡舍4级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
               
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                self.linesize=5;
                
            }
                break;
            case 3:
            {
                
                undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍3级.png" selectedImage:@"鸡舍3级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
             
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];

                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                self.linesize=5;
                
            }
                break;
            case 2:
            {  undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍2级.png" selectedImage:@"鸡舍2级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
         
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-20, [self contentSize].height+40);
                [self addChild: petgear z:3 ];
                self.linesize=5;
                
            }
                break;
            case 1:
            {  undercolor=[CCMenuItemImage itemFromNormalImage:@"鸡舍1级.png" selectedImage:@"鸡舍1级.png" target:self selector:@selector(inhenhouse:) ];
                CCMenu *undercolermenu=[CCMenu menuWithItems:undercolor,nil];
                
              
                undercolermenu.anchorPoint=ccp(0.5, 0.5);
                //  NOWITEMIMAGE.anchorPoint=ccp(0.5, 0.5);
                undercolermenu.position=ccp([self contentSize].width/2, [self contentSize].height/2+128);
                [self addChild:undercolermenu z:2];

                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                // CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                          [NSString stringWithFormat:@"jishe_1.png"]] ];
                petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
                petgear.position =   ccp([self contentSize].width/2-30, [self contentSize].height-3);
                [self addChild: petgear z:3 ];
                self.linesize=5;
                
                
            }
                break;
            default:
                break;
        }
        switch (houselevel) {
            case 5:
            {
                self.opacity=0;//消失底边
                [self removeChild:buildmenu cleanup:YES];
                [self.worldlayerprotocoll addHenHouseinview];
                [self.worldlayerprotocoll addHenhouseindata];
                //add animations
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                NSMutableArray *AnimFrames = [NSMutableArray array];
                for(int i = 1; i <= 4; ++i) {
                    [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jieshe_%d.png", i ]]];
                }
                CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
                CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
                CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
                [pet runAction:repeat];
                
                
                
                NSMutableArray *AnimFramesgear = [NSMutableArray array];
                for(int i = 1; i <= 4; ++i) {
                    [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"jishe_%d.png", i ]]];
                }
                CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
                CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
                CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
                [petgear runAction:repeatgear];
                
            }
                break;
            case 4:
            {
                self.opacity=0;//消失底边
                [self removeChild:buildmenu cleanup:YES];
                [self.worldlayerprotocoll addHenHouseinview];
                [self.worldlayerprotocoll addHenhouseindata];
                //add animations
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                
                
                
                NSMutableArray *AnimFramesgear = [NSMutableArray array];
                for(int i = 1; i <= 4; ++i) {
                    [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"jishe_%d.png", i ]]];
                }
                CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
                CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
                CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
                [petgear runAction:repeatgear];
                
            }
                break;
            case 3:
            {
                self.opacity=0;//消失底边
                [self removeChild:buildmenu cleanup:YES];
                [self.worldlayerprotocoll addHenHouseinview];
                [self.worldlayerprotocoll addHenhouseindata];
                //add animations
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                NSMutableArray *AnimFramesgear = [NSMutableArray array];
                for(int i = 1; i <= 4; ++i) {
                    [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"jishe_%d.png", i ]]];
                }
                CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
                CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
                CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
                [petgear runAction:repeatgear];
                
            }
                break;
            case 2:
            {
                self.opacity=0;//消失底边
                [self removeChild:buildmenu cleanup:YES];
                [self.worldlayerprotocoll addHenHouseinview];
                [self.worldlayerprotocoll addHenhouseindata];
                //add animations
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                NSMutableArray *AnimFramesgear = [NSMutableArray array];
                for(int i = 1; i <= 4; ++i) {
                    [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"jishe_%d.png", i ]]];
                }
                CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
                CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
                CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
                [petgear runAction:repeatgear];
                
            }
                break;
            case 1:
            {
                self.opacity=0;//消失底边
                [self removeChild:buildmenu cleanup:YES];
                [self.worldlayerprotocoll addHenHouseinview];
                [self.worldlayerprotocoll addHenhouseindata];
                //add animations
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                NSMutableArray *AnimFramesgear = [NSMutableArray array];
                for(int i = 1; i <= 4; ++i) {
                    [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                               [NSString stringWithFormat:@"jishe_%d.png", i ]]];
                }
                CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
                CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
                CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
                [petgear runAction:repeatgear];
                
            }
                break;
                
            default:
                break;
        }

        
    }
    
    iconmutablerray=[[NSMutableArray alloc] init];
    
    return self;
    
    // Loading the Ship's sprite using a sprite frame name (eg the filename)
}

-(void) setPosition:(CGPoint)pos
{
		[super setPosition:pos];
}
-(void)setpicture:(NSString*)filename
{
    CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: filename];
    [self setTexture:texture];



}
-(void)showeffection:(NSString*)filename
{
    CCTexture2D * texture =[[CCTextureCache sharedTextureCache] addImage: filename];
    [self setTexture:texture];
    
    
    
}
-(void)showtheiconofhouse:(BOOL)SHOW ICONKIND:(EFFECTIONSTOHOUSE)iconkind ISSENDERCALMDOWN:(bool)ISDOWN
{
    BOOL HAVENOWICON=NO;
   
   // smallicon.visible=SHOW;
    for(int i=[iconmutablerray count];i>0;i--)
    {
        EFFECTIONSTOHOUSE icon=[[ iconmutablerray objectAtIndex:i-1 ] integerValue];
        if (icon==iconkind) 
        {
            HAVENOWICON=YES;
        }
        
    }
    if(!HAVENOWICON)
    {
        [iconmutablerray addObject:[NSNumber numberWithInt:iconkind]];
       CCNode *icon= [self getthespritewithiconkind:iconkind];
        [self addChild:icon z:5 tag:iconkind+10];
         icon.position= ccp([self contentSize].width/2+[iconmutablerray count]*30-30, [self contentSize].height-11);
        //待安排坐标
        
    }
    else
    {
        CCSprite *icon=[self getChildByTag:iconkind+10 ];
        icon.visible=SHOW;
    
    
    }
    if (ISDOWN) {
        for(int i=[iconmutablerray count];i>0;i--)
        {
            EFFECTIONSTOHOUSE icon=[[ iconmutablerray objectAtIndex:i-1 ] integerValue];
            if (icon==iconkind) 
            {
                [ iconmutablerray removeObjectAtIndex:i-1 ];
                [self removeChildByTag:iconkind+10 cleanup:YES];
            }
            
        }

    }

    
    


}

-(CCNode *)getthespritewithiconkind:(EFFECTIONSTOHOUSE)iconkind
{
    

 

    switch (iconkind) {
            
        case IHENHOUSE:
        {
          
            CCMenuItemImage *sure=[CCMenuItemImage itemFromNormalImage:@"使能饲养更多种类的生物.png" selectedImage:@"使能饲养更多种类的生物.png" target:self selector:@selector(levelup:) ];
            
          CCMenu  *buildmenu2=[CCMenu menuWithItems:sure,nil];
           
                                    return buildmenu2;
            
        }
            break;
    
            
        case iTECHLABKIND:
        {
            CCSprite *  icon=[CCSprite spriteWithFile:@"使能饲养更多种类的生物.png"];
            return icon;
            
        }
            break;

            
        case iFACTORY:
        {
            CCSprite *  icon=[CCSprite spriteWithFile:@"使能加工.png"];
            return icon;
            
        }
            break;

            
        case iWINDMILL:
        {
            CCSprite *  icon=[CCSprite spriteWithFile:@"增加生物的生长速度.png"];
            return icon;
            
        }
            break;

            

                   
            
        case pool:
        {
           CCSprite *  icon=[CCSprite spriteWithFile:@"减少生物对水的消耗.png"];
            return icon;
        
        }
            break;
        case haystackeffect:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"减少生物对食物的消耗.png"];
            return icon;

        }
            break;
        case guarderhouseeffect:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的产蛋量.png"];
            return icon;

        }
            break;
        case Palmtree:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的生长速度.png"];
            return icon;

        }
            break;
        case bambooeffect:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的生长速度.png1"];
            return icon;

        }
            break;
        case coconuttree:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的生长速度.png"];
            return icon;

        }
            break;
        case peachtree:
        {
       CCSprite *  icon=[CCSprite spriteWithFile:@"减少生物对食物的消耗.png"];
            return icon;

        }
            break;
        case banian:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的生长速度.png"];
            return icon;

        }
            break;
        case willow:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的生长速度.png"];
            return icon;

        }
            break;
        case Spiritualtone:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"使生物不会生病.png"];
            return icon;

        }
            break;
        case goldenflower:
        {
        CCSprite * icon=[CCSprite spriteWithFile:@"增加生物的产蛋量.png"];
            return icon;

        }
            break;
            
        default:
            break;
    }






}
@end
