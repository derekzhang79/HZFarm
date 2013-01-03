//
//  Speakermenu.m
//  MapTest
//
//  Created by hzbc on 12-4-26.
//  Copyright 2012年 __MyCompanyName__. All rights reserved.
//

#import "Speakermenu.h"

#import "WorldLayer.h"
@implementation Speakermenu
-(void)latersay:(id)sender
{
    self.visible=NO;
   // thespeaker.visible=NO;
   // words.visible=NO;
    //[[WorldLayer getSharedWorldLayere]newonehenhouse];
    
}
-(id)init
{
    
    if( (self=[super init])) {

    CCMenuItemImage *sperker=[CCMenuItemImage itemFromNormalImage:@"sperker.png" selectedImage:@"sperker.png" target:self selector:nil];        
    CCMenuItemImage *wordsrangle=[CCMenuItemImage itemFromNormalImage:@"dialogbox.png" selectedImage:@"dialogbox.png" target:self selector:nil];



    sureorsomething=[CCMenuItemImage itemFromNormalImage:@"buynow0.png" selectedImage:@"buynow1.png" target:self selector:nil];
    
    later=[CCMenuItemImage itemFromNormalImage:@"cancel0.png" selectedImage:@"cancel1.png" target:self selector:@selector(latersay:
                                                                                                                        )];
    thespeaker=[CCMenu menuWithItems:sureorsomething,later, sperker,wordsrangle,nil];
    [self addChild:thespeaker z:3];
    sperker.position=ccp(412, 384);
    wordsrangle.position=ccp(662, 444);
    sureorsomething.position=ccp(412, 574);
    later.position=ccp(612, 574);
    thespeaker.position=ccp(0, 0);
    words = [CCLabelTTF labelWithString:@"欢迎开辟地图" fontName:@"Marker Felt" fontSize:32];
    words.anchorPoint=ccp(0.5, 0.5);
    words.position=ccp(662, 464);
    words.color=ccBLACK;
    [self addChild:words z:4];
    
  //  thespeaker.visible=NO;
   // words.visible=NO;
    

    }
    return self;



}
-(void)isshowthespeaker :(BOOL)show OBJECTKIND:(EFFECTIONSTOHOUSE)objectkind
{
    switch (objectkind) { 
        case iTECHLABKIND:
        {
            sureorsomething=[CCMenuItemImage itemFromNormalImage:@"buynow.png" selectedImage:@"buynow.png" target:self selector:nil];
            
            later=[CCMenuItemImage itemFromNormalImage:@"cancel.png" selectedImage:@"cancel.png" target:self selector:@selector(latersay:
                                                                                                                                )];
        }
            break;
            
        default:
            break;
    }
    sureorsomething=[CCMenuItemImage itemFromNormalImage:@"buynow.png" selectedImage:@"buynow.png" target:self selector:nil];
    
    later=[CCMenuItemImage itemFromNormalImage:@"cancel.png" selectedImage:@"cancel.png" target:self selector:@selector(toolsmenu:
                                                                                                                        )];
    thespeaker.visible=show;
    words.visible=show;
    
}
-(void)setthespeakerwords:(NSString *)worsd
{
    
    words = [CCLabelTTF labelWithString:worsd fontName:@"Marker Felt" fontSize:32];
    
    
    
}

@end
