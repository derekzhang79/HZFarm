//
//  Staticfunctionalobject.m
//  MapTest
//
//  Created by hzbc on 12-4-23.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Staticfunctionalobject.h"
@interface Staticfunctionalobject (PrivateMethods)
-(id) initWithfunctionalImage:(EFFECTIONSTOHOUSE)effectionkind;
-(id) initWithfunctionalImageinview:(EFFECTIONSTOHOUSE)effectionkind;

@end

@implementation Staticfunctionalobject
@synthesize linesize,selfpositionintiels,worldlayerprotocoll,undercolor,sure,effect;
+(id)Staticfunctionalobject:(EFFECTIONSTOHOUSE)effectionkind
{
	return [[[self alloc] initWithfunctionalImage:effectionkind] autorelease];
}
+(id) Staticfunctionalobjectinview:(EFFECTIONSTOHOUSE)effectionkind
{
    return [[[self alloc] initWithfunctionalImageinview:effectionkind] autorelease];
}
-(void)surebuild:(id)sender
{
    
    //[self.worldlayerprotocoll isshowthespeaker:YES OBJECTKIND:iTECHLABKIND];
  //  [self.worldlayerprotocoll setthespeakerwords:@"建筑物"];

    self.opacity=0; 
    [self removeChild:buildmenu cleanup:YES];
    [self removeChild:undercolorbig cleanup:YES];
    [self.worldlayerprotocoll addstaticobjectindata];
    [self.worldlayerprotocoll addstaticobjectinview];
    
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
            [self.worldlayerprotocoll showtheiconofhouse:tag ISSHOW:YES ICONKIND:effect ISSENDERCALMDOWN:NO];
        }
        else
        {
            [self.worldlayerprotocoll showtheiconofhouse:tag ISSHOW:NO ICONKIND:effect ISSENDERCALMDOWN:YES];
         }
        
        
    }
    [data release];
    






}
-(void)makerotation:(id)sender
{
    self.flipX=YES;



}
-(id) initWithfunctionalImage:(EFFECTIONSTOHOUSE)effectionkindl
{
	if(1)
    {    effect=effectionkindl;
        linesize=3;
        switch (effectionkindl) {
           
            case pool:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                //self=[super initWithFile:@"redline-1.png"];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                
                
                undercolor=[CCSprite spriteWithFile:@"蓄水池.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

            }
                break;
            case haystackeffect:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                

                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                               undercolor=[CCSprite spriteWithFile:@"小草堆.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

            }
                break;

            case guarderhouseeffect:
            {
                    linesize=5;
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
            
                //self.anchorPoint=ccp(1, 1);
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                               undercolor=[CCSprite spriteWithFile:@"看守者小屋.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+60);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

                
            }
                break;

            case Palmtree:
            {
               
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                
                
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"棕榈树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+30);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

            }
                break;

            case bambooeffect:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                
                
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"竹.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+70);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

            }
                break;

            case coconuttree:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"椰子树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+60);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

            }
                break;

            case peachtree:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"桃花.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+100);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                

            }
                break;

            case banian:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"榕树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2+15, [self contentSize].height/2+90);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

               
            }
                break;

            case willow:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"柳树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2+20, [self contentSize].height/2+105);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

            }
                break;

            case Spiritualtone:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"灵石.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+100);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];

                
            }
                break;

            case goldenflower:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"金花木.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+80);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                

            }
                break;

                
            default:
                break;
        }
    
        
      
    
     [self schedule:@selector(step:) interval:0.1f];
    
    }
    return self;

}
-(id) initWithfunctionalImageinview:(EFFECTIONSTOHOUSE)effectionkindl
{
	if(1)
    {    effect=effectionkindl;
        linesize=3;
        switch (effectionkindl) {
                
            case pool:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                //self=[super initWithFile:@"redline-1.png"];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                
                
                undercolor=[CCSprite spriteWithFile:@"蓄水池.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
            }
                break;
            case haystackeffect:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                
                
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"小草堆.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
            }
                break;
                
            case guarderhouseeffect:
            {
                linesize=5;
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                
                //self.anchorPoint=ccp(1, 1);
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"看守者小屋.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend15.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+60);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
                
            }
                break;
                
            case Palmtree:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                
                
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"棕榈树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+30);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
            }
                break;
                
            case bambooeffect:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                
                
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"竹.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+70);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
            }
                break;
                
            case coconuttree:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"椰子树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+60);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
            }
                break;
                
            case peachtree:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"桃花.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+100);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
                
            }
                break;
                
            case banian:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"榕树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2+15, [self contentSize].height/2+90);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
                
            }
                break;
                
            case willow:
            {
                
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"柳树.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2+20, [self contentSize].height/2+105);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
            }
                break;
                
            case Spiritualtone:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"灵石.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+100);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
                
            }
                break;
                
            case goldenflower:
            {
                NSString *linetype=[NSString stringWithFormat: @"redline-%d.png",self.linesize];
                self=[super initWithFile:linetype];
                sure=[CCMenuItemImage itemFromNormalImage:@"mark_0.png" selectedImage:@"mark_1.png" target:self selector:@selector(surebuild:) ];
                CCMenuItemImage *rotate=[CCMenuItemImage itemFromNormalImage:@"rotation_0.png" selectedImage:@"rotation_1.png" target:self selector:@selector(makerotation:) ];
                buildmenu=[CCMenu menuWithItems:sure,rotate,nil];
                buildmenu.position=ccp(0, 0 );
                sure.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(-60, 100));
                rotate.position=ccpAdd(ccp([self contentSize].width/2, [self contentSize].height/2), ccp(+60, 100));
                [self addChild:buildmenu z:9];
                undercolor=[CCSprite spriteWithFile:@"金花木.png"];
                undercolor.anchorPoint=ccp(0.5, 0.5);
                
                undercolorbig=[CCSprite spriteWithFile:@"extend13.png"];
                undercolorbig.anchorPoint=ccp(0.5, 0.5);
                
                undercolor.position=ccp([self contentSize].width/2, [self contentSize].height/2+80);
                [self addChild:undercolor z:1];
                undercolorbig.position=ccp([self contentSize].width/2, [self contentSize].height/2);
                [self addChild:undercolorbig z:0];
                
                
            }
                break;
                
                
            default:
                break;
        }
        
        
        
        
        [self schedule:@selector(step:) interval:0.1f];
        
    }
    
    
    
    
    
    self.opacity=0; 
    [self removeChild:buildmenu cleanup:YES];
    [self removeChild:undercolorbig cleanup:YES];
    [self.worldlayerprotocoll addstaticobjectindata];
    [self.worldlayerprotocoll addstaticobjectinview];
    
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
            [self.worldlayerprotocoll showtheiconofhouse:tag ISSHOW:YES ICONKIND:effect ISSENDERCALMDOWN:NO];
        }
        else
        {
            [self.worldlayerprotocoll showtheiconofhouse:tag ISSHOW:NO ICONKIND:effect ISSENDERCALMDOWN:YES];
        }
        
        
    }
    [data release];

    return self;
    
}

- (void)step:(ccTime) dt 
{
    
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
            [self.worldlayerprotocoll showtheiconofhouse:tag ISSHOW:YES ICONKIND:effect ISSENDERCALMDOWN:NO];
        
            
        }
        else
        {
           [self.worldlayerprotocoll showtheiconofhouse:tag ISSHOW:NO ICONKIND:effect ISSENDERCALMDOWN:NO];
        }
        
        
    }
    [data release];
    
    
    
}

@end
