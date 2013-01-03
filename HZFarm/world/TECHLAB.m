//
//  TECHLAB.m
//  MapTest
//
//  Created by hzbc on 12-4-19.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "TECHLAB.h"
#import "WorldLayer.h"
#import "DAWorldMapService.h"
@interface TECHLAB (PrivateMethods)
-(id) initWithtechlabImage:(FUNCBUILSINGSLIND) kind;
-(id) initWithtechlabImageandanimation:(FUNCBUILSINGSLIND) kind;
@end



@implementation TECHLAB

@synthesize worldlayerprotocol,selfpositionintiels,linesize,kindd,sure;


+(id) TECHLAB:(FUNCBUILSINGSLIND) kind
{
	return [[[self alloc] initWithtechlabImage:kind] autorelease];
}
+(id) TECHLABinview:(FUNCBUILSINGSLIND) kind
{

    
        
    return [[[self alloc] initWithtechlabImageandanimation:kind] autorelease];





}
-(void)surebuild:(id)sender
{
    
   // [self.worldlayerprotocol isshowthespeaker:YES OBJECTKIND:iTECHLABKIND];
    //[self.worldlayerprotocol setthespeakerwords:@"建筑物"];
    NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/house.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathhouse];
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    for(int i=0;i<data.count;i++ )
    {
        states=[data objectAtIndex:i]; 
        int  x= [[states objectForKey:@"house-x"] intValue];
        int  y= [[states objectForKey:@"house-y"] intValue];
        int tag=[[states objectForKey:@"tag"] intValue];
        if (abs(selfpositionintiels.x-x)<self.linesize*2+1&&abs(selfpositionintiels.y-y)<self.linesize*2+1)
        {
            [self.worldlayerprotocol showtheiconofhouse:tag ISSHOW:YES ICONKIND:buildkind ISSENDERCALMDOWN:NO];
        }
        else
        {
            [self.worldlayerprotocol showtheiconofhouse:tag ISSHOW:NO ICONKIND:buildkind ISSENDERCALMDOWN:YES];         }
        
        
    }

    
    [self removeChild:buildmenu cleanup:YES];
    [self removeChild:undercolorbig cleanup:YES];
    [self.worldlayerprotocol addTECHLABinview];
    [self.worldlayerprotocol addTECHLABindata];
   
    self.opacity=0;//消失底边
    
    
    switch (kindd) {
        case TECHLABKIND:
        {
        
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"keyan_1_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            CCSprite *pet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                            [NSString stringWithFormat:@"keyan_1_1.png"]] ];
            //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
            //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
            pet.anchorPoint = CGPointMake(0.5f, 0.5f);
            pet.position =   ccp([self contentSize].width/2-123, [self contentSize].height/2+102);
            [self addChild: pet z:3 ];
            // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
            [pet runAction:repeat];
            
            
            
            NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 3; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"keyan_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            CCSprite *petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                                [NSString stringWithFormat:@"keyan_1.png"]] ];
            petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
            petgear.position =   ccp([self contentSize].width/2+40, [self contentSize].height/2+45);
            [self addChild: petgear z:3 ];
            [petgear runAction:repeatgear];
            

        
        
        
        }
            break;
        case FACTORY:
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"jiagongchang_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            [factorypet runAction:repeat];
            
                           
        }
            break;
        case WINDMILL:
        {
           

            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"fengche_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
            [windwillpet runAction:repeat];
           
        
        
        }
            break;
        case MACHINE:
            {
            
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                NSMutableArray *AnimFrames = [NSMutableArray array];
                for(int i = 1; i <= 5; ++i) {
                    [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"jianzao%d.png", i ]]];
                }
                CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.5f];
                CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
                CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
                                // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
                [machinepet runAction:repeat];
         
            
            
            
            
            }
            break;
        default:
            break;
    }
    
    //add animations
    //图片集
   


}
-(void)makerotation:(id)sender
{
    self.flipX=YES;

}

-(id) initWithtechlabImage:(FUNCBUILSINGSLIND) kind
{
     
     if(1) 
    {
        kindd=kind;
        switch (kindd) {
            case TECHLABKIND:
            {
                 self.linesize=5;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                CCSprite *undercolor=[CCSprite spriteWithFile:@"研究所四级.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                 
                [self schedule:@selector(step:) interval:0.1f];

            
            
            
            }
                break;
                
            case FACTORY:
            {
                self.linesize=5;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];

            
                CCSprite *undercolor=[CCSprite spriteWithFile:@"加工厂五级.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                factorypet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"jiagongchang_1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                factorypet.anchorPoint = CGPointMake(0.5f, 0.5f);
                factorypet.position =   ccp([self contentSize].width/2+75, [self contentSize].height/2+10);
                [self addChild: factorypet z:3 ];
                // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
                
                CCSprite *box=[CCSprite spriteWithFile:@"5-2.png"];
                box.position =   ccp([self contentSize].width/2+3, [self contentSize].height/2-20);
                [self addChild: box z:3 ];

                
                  self.linesize=5;
                [self schedule:@selector(step:) interval:0.1f];
                
                

            
            }
                break;
            case WINDMILL:
            {
               // self.anchorPoint=ccp(0.0, 1.0);
                self.linesize=3;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];

                CCSprite *undercolor=[CCSprite spriteWithFile:@"小风车.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
               [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                //CCSpriteBatchNode *objectanimations= [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                windwillpet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                                [NSString stringWithFormat:@"fengche_1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                windwillpet.anchorPoint = CGPointMake(0.5f, 0.5f);
                windwillpet.position =   ccp([self contentSize].width/2-27, [self contentSize].height/2+103);
               [self addChild: windwillpet z:3 ];

                
                self.linesize=3;
                [self schedule:@selector(step:) interval:0.1f];
                 
                
                
                
            }
                break;

            case MACHINE:
            {
                
                self.linesize=5;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];

                CCSprite *undercolor=[CCSprite spriteWithFile:@"建造状态.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
               sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                machinepet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                                       [NSString stringWithFormat:@"jianzao1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                machinepet.anchorPoint = CGPointMake(0.5f, 0.5f);
                machinepet.position =   ccp([self contentSize].width/2-3, [self contentSize].height/2+69);
                [self addChild: machinepet z:3 ];

                  self.linesize=5;
                [self schedule:@selector(step:) interval:0.1f];
                
               
                
                
            }
                break;

                       default:
                break;
        }
        
                
    
    
    }
    buildkind=kind;
    return self;
    
    // Loading the Ship's sprite using a sprite frame name (eg the filename)
}
-(id) initWithtechlabImageandanimation:(FUNCBUILSINGSLIND)kind
{

    
    if(1) 
    {
        kindd=kind;
        switch (kindd) {
            case TECHLABKIND:
            {
                self.linesize=5;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                CCSprite *undercolor=[CCSprite spriteWithFile:@"研究所四级.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                
                [self schedule:@selector(step:) interval:0.1f];
                
                
                
                
            }
                break;
                
            case FACTORY:
            {
                self.linesize=5;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                
                
                CCSprite *undercolor=[CCSprite spriteWithFile:@"加工厂五级.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                factorypet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"jiagongchang_1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                factorypet.anchorPoint = CGPointMake(0.5f, 0.5f);
                factorypet.position =   ccp([self contentSize].width/2+75, [self contentSize].height/2+10);
                [self addChild: factorypet z:3 ];
                // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
                
                CCSprite *box=[CCSprite spriteWithFile:@"5-2.png"];
                box.position =   ccp([self contentSize].width/2+3, [self contentSize].height/2-20);
                [self addChild: box z:3 ];
                
                
                self.linesize=5;
                [self schedule:@selector(step:) interval:0.1f];
                
                
                
                
            }
                break;
            case WINDMILL:
            {
                // self.anchorPoint=ccp(0.0, 1.0);
                self.linesize=3;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                
                CCSprite *undercolor=[CCSprite spriteWithFile:@"小风车.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                //CCSpriteBatchNode *objectanimations= [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                windwillpet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                              [NSString stringWithFormat:@"fengche_1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                windwillpet.anchorPoint = CGPointMake(0.5f, 0.5f);
                windwillpet.position =   ccp([self contentSize].width/2-27, [self contentSize].height/2+103);
                [self addChild: windwillpet z:3 ];
                
                
                self.linesize=3;
                [self schedule:@selector(step:) interval:0.1f];
                
                
                
                
            }
                break;
                
            case MACHINE:
            {
                
                self.linesize=5;
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                
                CCSprite *undercolor=[CCSprite spriteWithFile:@"建造状态.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+64);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
                CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
                [self addChild:objectanimations];
                machinepet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                             [NSString stringWithFormat:@"jianzao1.png"]] ];
                //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
                machinepet.anchorPoint = CGPointMake(0.5f, 0.5f);
                machinepet.position =   ccp([self contentSize].width/2-3, [self contentSize].height/2+69);
                [self addChild: machinepet z:3 ];
                
                self.linesize=5;
                [self schedule:@selector(step:) interval:0.1f];
                
                
                
                
            }
                break;
                
            default:
                break;
        }
        
        
        
        
    }
    buildkind=kind;
    NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/house.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathhouse];
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    for(int i=0;i<data.count;i++ )
    {
        states=[data objectAtIndex:i]; 
        int  x= [[states objectForKey:@"house-x"] intValue];
        int  y= [[states objectForKey:@"house-y"] intValue];
        int tag=[[states objectForKey:@"tag"] intValue];
        if (abs(selfpositionintiels.x-x)<self.linesize*2+1&&abs(selfpositionintiels.y-y)<self.linesize*2+1)
        {
            [self.worldlayerprotocol showtheiconofhouse:tag ISSHOW:YES ICONKIND:buildkind ISSENDERCALMDOWN:NO];
        }
        else
        {
            [self.worldlayerprotocol showtheiconofhouse:tag ISSHOW:NO ICONKIND:buildkind ISSENDERCALMDOWN:YES];         }
        
        
    }
    
    
    [self removeChild:buildmenu cleanup:YES];
    [self removeChild:undercolorbig cleanup:YES];
    [self.worldlayerprotocol addTECHLABinview];
    [self.worldlayerprotocol addTECHLABindata];
    
    self.opacity=0;//消失底边
    
    
    switch (kindd) {
        case TECHLABKIND:
        {
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"keyan_1_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            CCSprite *pet =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                            [NSString stringWithFormat:@"keyan_1_1.png"]] ];
            //[pet setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
            //[NSString stringWithFormat:@"keyan_1_1.png"]] ];
            pet.anchorPoint = CGPointMake(0.5f, 0.5f);
            pet.position =   ccp([self contentSize].width/2-123, [self contentSize].height/2+102);
            [self addChild: pet z:3 ];
            // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
            [pet runAction:repeat];
            
            
            
            NSMutableArray *AnimFramesgear = [NSMutableArray array];
            for(int i = 1; i <= 3; ++i) {
                [AnimFramesgear addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                           [NSString stringWithFormat:@"keyan_%d.png", i ]]];
            }
            CCAnimation *Animgear = [CCAnimation animationWithFrames:AnimFramesgear delay:0.15f];
            CCAnimate* animategear = [CCAnimate actionWithAnimation:Animgear restoreOriginalFrame:NO];
            CCRepeatForever *repeatgear=[CCRepeatForever actionWithAction:animategear];
            CCSprite *petgear =[CCSprite spriteWithSpriteFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                                                [NSString stringWithFormat:@"keyan_1.png"]] ];
            petgear.anchorPoint = CGPointMake(0.5f, 0.5f);
            petgear.position =   ccp([self contentSize].width/2+40, [self contentSize].height/2+45);
            [self addChild: petgear z:3 ];
            [petgear runAction:repeatgear];
            
            
            
            
            
        }
            break;
        case FACTORY:
        {
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"jiagongchang_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            [factorypet runAction:repeat];
            
            
        }
            break;
        case WINDMILL:
        {
            
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"fengche_%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.15f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
            [windwillpet runAction:repeat];
            
            
            
        }
            break;
        case MACHINE:
        {
            
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"objectanimations.plist"]];        
            CCSpriteBatchNode *objectanimations = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"objectanimations.png"]];
            [self addChild:objectanimations];
            NSMutableArray *AnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 5; ++i) {
                [AnimFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:
                                       [NSString stringWithFormat:@"jianzao%d.png", i ]]];
            }
            CCAnimation *Anim = [CCAnimation animationWithFrames:AnimFrames delay:0.5f];
            CCAnimate* animate = [CCAnimate actionWithAnimation:Anim restoreOriginalFrame:NO];
            CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animate];
            // CCRepeatForever *repeat=[CCRepeatForever actionWithAction:animationSequence];
            [machinepet runAction:repeat];
            
            
            
            
            
        }
            break;
        default:
            break;
    }
    
    //add animations
    return self;



}
- (void)step:(ccTime) dt 
{

   /* NSString *filepathhouse=[NSString stringWithString:@"/Users/hzbc/Desktop/wwwfarm/house.plist"];
    NSMutableArray *data = [[NSMutableArray alloc] initWithContentsOfFile:filepathhouse];
    NSMutableDictionary *states =  [NSMutableDictionary dictionaryWithCapacity:10];
    for(int i=0;i<data.count;i++ )
    {
        states=[data objectAtIndex:i]; 
        int  x= [[states objectForKey:@"house-x"] intValue];
        int  y= [[states objectForKey:@"house-y"] intValue];
        int tag=[[states objectForKey:@"tag"] intValue];
        if (abs(selfpositionintiels.x-x)<self.linesize*2+1&&abs(selfpositionintiels.y-y)<self.linesize*2+1)
        {
             [self.worldlayerprotocol showtheiconofhouse:tag ISSHOW:YES ICONKIND:buildkind ISSENDERCALMDOWN:NO];
        }
        else
        {
            [self.worldlayerprotocol showtheiconofhouse:tag ISSHOW:NO ICONKIND:buildkind ISSENDERCALMDOWN:NO];  
        }
    
        
    }
*/
    //NSLog(@" why step !");
 /*   NSArray*  henhousearray=  [[DAWorldMapService shareWorldMapService] GetAllBuildingIDByType:BuildingType_Breeding];
    
    for(int i=0;i<henhousearray.count;i++)
    {
        NSString *iid=[henhousearray objectAtIndex:i];
        DABuildingEntity *buildingentity=   [[DAWorldMapService shareWorldMapService] getBuildingByID:iid];
        
        CGPoint position=ccp(buildingentity.nPosX,buildingentity.nPosY) ;
        if(abs( selfpositionintiels.x-position.x)<320&&abs( selfpositionintiels.y-position.y)<160)
        {
            [self.worldlayerprotocol showtheiconofhouse:buildingentity.nTag ISSHOW:YES ICONKIND:buildkind ISSENDERCALMDOWN:NO];
        }
        else
        {
            [self.worldlayerprotocol showtheiconofhouse:buildingentity.nTag ISSHOW:NO ICONKIND:buildkind ISSENDERCALMDOWN:NO];  
        }
        
        
        
        
    }
*/



}

@end
