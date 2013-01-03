//
//  Firstlayermenu.m
//  MapTest
//
//  Created by hzbc on 12-4-9.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Firstlayermenu.h"
#import "WareHouseLayer.h"
#import "ShopLayer.h"
#import "BuildingLayer.h"
@implementation Firstlayermenu
/*-(void)sethousenumber
{CCLabelTTF *labelhouse = [CCLabelTTF labelWithString:@"00/10" fontName:@"Marker Felt" fontSize:32];
	
	// ask director the the window size
	//CGSize size = [[CCDirector sharedDirector] winSize];
	labelhouse.color=ccBLACK;
	
	// position the label on the center of the screen
	labelhouse.position =  ccp(930, 700);
    [self addChild:labelhouse z:2];
}
*/
-(void)handleTimerdirecter:(NSTimer *)timer
{
    menusmenu.visible=NO;
    [Arrowleft setSelectedImage:[CCSprite spriteWithFile:@"arrowleft_0.png"]];
    [Arrowleft setNormalImage:[CCSprite spriteWithFile:@"arrowleft_0.png"]];
}

-(void)toolsmenu:(id)sender
{
    if (menutool.visible) {
        //id ac=[CCFadeOut actionWithDuration:0.6f];
       // id ac1=[CCFadeOut actionWithDuration:0.6f];
        //[menutool runAction:ac1];
        //[menubarup runAction:ac];
        menutool.visible=NO;
        menubarup.visible=NO;
       // [menutools setSelectedImage:[CCSprite spriteWithFile:@"tool_1.png"]];
       // [menutools setNormalImage:[CCSprite spriteWithFile:@"tool_0.png"]];
    }

    else
    {
    id ac=[CCFadeIn actionWithDuration:0.6f];
    id ac1=[CCFadeIn actionWithDuration:0.6f];
    [menutool runAction:ac1];
    [menubarup runAction:ac];
    menutool.visible=YES;
    menubarup.visible=YES;
   // [menutools setSelectedImage:[CCSprite spriteWithFile:@"tool1_1.png"]];
    //[menutools setNormalImage:[CCSprite spriteWithFile:@"tool1_0.png"]];
    }
}
-(void)diamondaddItembutton:(id)sender
{
}
-(void)coinsaddItembutton:(id)sender
{
}
-(void)menuItembutton:(id)sender
{
}

-(void)buildmenu:(id)sender
{
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	BuildingLayer *buildingLayer = [BuildingLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:buildingLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];


}

-(void)warehouse:(id)sender
{
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	WareHouseLayer *wareHouseLayer = [WareHouseLayer node];
    
    
    //Scene *sc = [Scene node]; 
    [scene addChild:wareHouseLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];
}
-(void)shopItembutton:(id)sender
{
    CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ShopLayer *shopLayer = [ShopLayer node];

    
    //Scene *sc = [Scene node]; 
    [scene addChild:shopLayer];
    
    [[CCDirector sharedDirector] replaceScene: [CCTransitionSlideInR transitionWithDuration:0.1f scene:scene]];

   
}

-(void)ArrowleftItembutton:(id)sender
{
    if(menubarright.numberOfRunningActions==0)
    {
       if(!ARROWLEFT)
  {
    CCAction *moveleft = [CCMoveTo actionWithDuration:0.6f position:ccpAdd(menubarright.position, ccp(-[menubarright contentSize].width+185,0)) ];
	[menubarright runAction:moveleft];																	
      [Arrowleft setSelectedImage:[CCSprite spriteWithFile:@"arrow_0.png"]];
      [Arrowleft setNormalImage:[CCSprite spriteWithFile:@"arrow_0.png"]];

    menusmenu.visible=YES;
    ARROWLEFT=!ARROWLEFT;
      
  }
    else
    {
    CCAction *moveleft = [CCMoveTo actionWithDuration:0.6f position:ccpAdd(menubarright.position, ccp([menubarright contentSize].width-185,0)) ];
    [menubarright runAction:moveleft];	
        //[menubarright removeChild:menusmenu cleanup:YES];
    
    ARROWLEFT=!ARROWLEFT;
    connectionTimer=[NSTimer scheduledTimerWithTimeInterval:0.6f target:self selector:@selector(handleTimerdirecter:)userInfo:nil repeats:NO]  ;    
    menutool.visible=NO;
    menubarup.visible=NO;
    [menutools setSelectedImage:[CCSprite spriteWithFile:@"tool_1.png"]];
    [menutools setNormalImage:[CCSprite spriteWithFile:@"tool_0.png"]];
    }
    }   
}
-(void)ArrowrightItembutton:(id)sender
{
}

-(id)init
{
    if( (self=[super init])) {
		
             
                
        CCSprite  *star=[CCSprite spriteWithFile:@"star0_改.png"]; 
        CCSprite  *coins=[CCSprite spriteWithFile:@"gold.png"]; 
        CCSprite  *Diamond=[CCSprite spriteWithFile:@"diamond.png"]; 
        CCSprite  *house=[CCSprite spriteWithFile:@"house.png"]; 
        CCSprite  *starbar=[CCSprite spriteWithFile:@"experience_0.png"]; 
        CCSprite  *starbarback=[CCSprite spriteWithFile:@"experience_1.png"]; 
        CCSprite  *coinsbar=[CCSprite spriteWithFile:@"diamondbar.png"]; 
        CCSprite  *Diamondbar=[CCSprite spriteWithFile:@"diamondbar.png"]; 
        
        star.position=ccp(50, 710);
        coins.position=ccp(270, 710);
        Diamond.position=ccp(550, 710);
        house.position=ccp(900, 710);
        starbar.position=ccpAdd(star.position, ccp([starbar contentSize].width/2, 0)) ;
        starbarback.position=ccpAdd(star.position, ccp([starbar contentSize].width/2, 0)) ;
        coinsbar.position=ccpAdd(coins.position, ccp([coinsbar contentSize].width/2, 0)) ;
        Diamondbar.position=ccpAdd(Diamond.position, ccp([Diamondbar contentSize].width/2, 0)) ;
        [self addChild:star z:1];
        [self addChild:coins z:1];
        [self addChild:Diamond z:1];
        [self addChild:house z:1];
        [self addChild:starbarback z:0];
        [self addChild:starbar z:0];
        [self addChild:coinsbar z:0];
        [self addChild:Diamondbar z:0];
        
        CCLabelAtlas *imageNumberstar;
        imageNumberstar = [CCLabelAtlas labelWithString: @"0" charMapFile:@"experience_numeral.png" itemWidth:28 itemHeight:33 startCharMap:'0'];
        [self addChild:imageNumberstar z:2];
        imageNumberstar.position=star.position;
        imageNumberstar.anchorPoint=ccp(0.5, 0.5);
        //NSString *str = [[NSString alloc] initWithFormat:@"%.1f", frameRate_];
        NSString *str = [[NSString alloc] initWithFormat:@"0"];
        [imageNumberstar setString: str];
        [str release];

        CCLabelAtlas *imageNumbercoins;
        imageNumbercoins = [CCLabelAtlas labelWithString: @"0" charMapFile:@"gold_number.png" itemWidth:17 itemHeight:19 startCharMap:'0'];
        [self addChild:imageNumbercoins z:1 ];
        imageNumbercoins.position=coinsbar.position;
        imageNumbercoins.anchorPoint=ccp(0.5, 0.5);
        //NSString *str = [[NSString alloc] initWithFormat:@"%.1f", frameRate_];
        NSString *str2 = [[NSString alloc] initWithFormat:@"0123456"];
        [imageNumbercoins setString: str2];
        [str2 release];

        CCLabelAtlas *imageNumberdiamond;
        imageNumberdiamond = [CCLabelAtlas labelWithString: @"0" charMapFile:@"diamond_numbuer.png" itemWidth:17 itemHeight:19 startCharMap:'0'];
        [self addChild:imageNumberdiamond z:1];
        imageNumberdiamond.position=Diamondbar.position;
        imageNumberdiamond.anchorPoint=ccp(0.5, 0.5);
        //NSString *str = [[NSString alloc] initWithFormat:@"%.1f", frameRate_];
        NSString *str3 = [[NSString alloc] initWithFormat:@"0123456"];
        [imageNumberdiamond setString: str3];
        [str3 release];
        
        CCLabelAtlas *imageNumberhouse;
        imageNumberhouse = [CCLabelAtlas labelWithString: @"0" charMapFile:@"housenumbuer.png" itemWidth:23 itemHeight:26 startCharMap:'0'];
        [self addChild:imageNumberhouse z:1];
        imageNumberhouse.position=ccp(930, 703);;
        imageNumberhouse.anchorPoint=ccp(0.5, 0.5);
        //NSString *str = [[NSString alloc] initWithFormat:@"%.1f", frameRate_];
        NSString *str4 = [[NSString alloc] initWithFormat:@"0010"];
        [imageNumberhouse setString: str4];
        [str4 release];


        
        CCMenuItemImage *menubutton=[CCMenuItemImage itemFromNormalImage:@"menu1_0.png" selectedImage:@"menu1_1.png" target:self selector:@selector(ArrowleftItembutton:)];
        CCMenuItemImage *shopbutton=[CCMenuItemImage itemFromNormalImage:@"shop_0.png" selectedImage:@"shop_1.png" target:self selector:@selector(shopItembutton:)];
        CCMenuItemImage *coinsadd=[CCMenuItemImage itemFromNormalImage:@"plus_button_0.png" selectedImage:@"plus_button_1.png" target:self selector:@selector(coinsaddItembutton:)];
        CCMenuItemImage *diamondadd=[CCMenuItemImage itemFromNormalImage:@"plus_button_0.png" selectedImage:@"plus_button_1.png" target:self selector:@selector(diamondaddItembutton:)];
        Arrowleft=[CCMenuItemImage itemFromNormalImage:@"arrowleft_0.png" selectedImage:@"arrowleft_1.png" target:self selector:@selector(ArrowleftItembutton:)];
       
      //   CCMenuItemImage *Arrowright=[CCMenuItemImage itemFromNormalImage:@"arrow_0.png" selectedImage:@"arrow_1.png" target:self selector:@selector(ArrowrightItembutton:)];
        CCMenu *menuall = [CCMenu menuWithItems:menubutton,shopbutton,diamondadd,coinsadd,nil]; 
        shopbutton.position=ccp(54, 48);
        menubutton.position=ccp(1024-54, 48);
        menuall.anchorPoint = ccp(0.5, 0.5);
        menuall.position = ccp(0, 0);   
        coinsadd.position=ccpAdd(coinsbar.position, ccp([coinsbar contentSize].width/2, 0));
        diamondadd.position=ccpAdd(Diamondbar.position, ccp([Diamondbar contentSize].width/2, 0));
       // Arrowleft.position=ccpSub(menubutton.position, ccp([menubutton contentSize].width, 0));
        [self addChild:menuall z:1];
        menubarright=[CCSprite spriteWithFile:@"menubar.png"]; 
        CCSprite  *menubarright2=[CCSprite spriteWithFile:@"menubar.png"];
        menubarright.position=ccpSub(menubutton.position, ccp(-140,0)) ;
        menubarright2.position=ccpSub(menubutton.position, ccp(-30,0)) ;
        [menubarright2 setTextureRect:CGRectMake(50, 0, 150,[menubarright2 contentSize].height)];
        //[menubarright2 contentSize].height
        [self addChild:menubarright z:0];
        [self addChild:menubarright2 z:0];
        CCSprite  *menubarleft=[CCSprite spriteWithFile:@"menubar.png"]; 
        menubarleft.position=ccpSub(shopbutton.position, ccp(180,0)) ;
        //menubarleft.rotation=180;
        menubarleft.flipX=YES;
        [self addChild:menubarleft z:0];
        CCMenu *menuright = [CCMenu menuWithItems:Arrowleft,nil]; 
        Arrowleft.position=ccpSub( Arrowleft.position, ccp([menubarright contentSize].width-[Arrowleft contentSize].width+10,338));
        
        [menubarright addChild:menuright z:1];
        
        
        
        
        menutools=[CCMenuItemImage itemFromNormalImage:@"tool_0.png" selectedImage:@"tool_1.png" target:self selector:@selector(toolsmenu:)];
        
        CCMenuItemImage *menubuild=[CCMenuItemImage itemFromNormalImage:@"building_0.png" selectedImage:@"building_1.png" target:self selector:@selector(buildmenu:)];
        
        CCMenuItemImage *menustorage=[CCMenuItemImage itemFromNormalImage:@"warehouse_0.png" selectedImage:@"warehouse_1.png" target:self selector:@selector(warehouse:)];
        
        CCMenuItemImage *menucollection=[CCMenuItemImage itemFromNormalImage:@"collection_0.png" selectedImage:@"collection_1.png" target:self selector:nil];
        
        CCMenuItemImage *menusettings=[CCMenuItemImage itemFromNormalImage:@"configure_0.png" selectedImage:@"configure_1.png" target:self selector:nil];
        menusmenu = [CCMenu menuWithItems:menutools,menubuild,menustorage,menucollection,menusettings,nil]; 
        menutools.position=ccpAdd(Arrowleft.position, ccp(80,-2)); 
        menubuild.position=ccpAdd(Arrowleft.position, ccp(70*2+10,-2)); 
        menustorage.position=ccpAdd(Arrowleft.position, ccp(70*3+10,-2)); 
        menucollection.position=ccpAdd(Arrowleft.position, ccp(70*4+10,-2)); 
        menusettings.position=ccpAdd(Arrowleft.position, ccp(70*5+10,-2)); 
        [menubarright addChild:menusmenu z:1];
         menusmenu.visible=NO;
        
        
        
        //upbsr part
        menubarup=[CCSprite spriteWithFile:@"menubar_1.png"]; 
       
        CCMenuItemImage *menumove=[CCMenuItemImage itemFromNormalImage:@"move_0.png" selectedImage:@"move_1.png" target:self selector:nil];
        
        CCMenuItemImage *menuremove=[CCMenuItemImage itemFromNormalImage:@"remove_0.png" selectedImage:@"remove_1.png" target:self selector:@selector(toolsmenu:
                                                                                                                                                      )];
        
        CCMenuItemImage *collection=[CCMenuItemImage itemFromNormalImage:@"collection1_0.png" selectedImage:@"collection1_1.png" target:self selector:nil];
        
        menutool = [CCMenu menuWithItems:menumove,menuremove,collection,nil]; 
        // NSLog(@" x: %f y: %f",menubarup.position.x,menubarup.position.y );
        menubarup.position=ccpSub(menubarright.position, ccp(140+[menubarright contentSize].width-185,-[menubarup contentSize].height+[menubarright contentSize].height-2)) ;
        menumove.position=ccp(menubarup.position.x-512,-100); 
        menuremove.position=ccp(menubarup.position.x-512,-180);
        collection.position=ccp(menubarup.position.x-512,-260);
        [self addChild:menubarup z:1];
        [self addChild:menutool z:2 ];
        menubarup.visible=NO;
        menutool.visible=NO;
       
                 
       // womenspeaker=[[Speakermenu alloc]init];
        //[self addChild:womenspeaker z:1000];
        

                
       // [self sethousenumber];      
	}
   	return self;

}

@end
