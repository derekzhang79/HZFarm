//
//  DAItemParseXml.h
//  MapTest
//
//  Created by liwensheng on 12-4-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAHeader.h"
#import "TouchXML.h"

@interface DAItemParseXml : NSObject
{
    
}
+(id) parseBuildingXML:(NSData*)xmldata ItemType:(DABuildingType) buidType;
+(id) parseGeneralXML:(NSData*)xmldata ItemType:(DAGeneralItemType) gtype;
+(id) parsePoultryXML:(NSData*)xmldata;
+(id) parseSpecialXML:(NSData*)xmldata;


//private
+(id) getRootElement:(NSData*)xmldata;
+(NSArray*) getAllElement:(NSData*)xmldata;
#pragma mark 建筑类别
+(NSArray*) getGeneralBuilding:(NSArray*)elements;
+(NSArray*) getMagicBuilding:(NSArray*)elements;
+(NSArray*) getBreedBuilding:(NSArray*)elements;
+(NSArray*) getProcessBuilding:(NSArray*)elements;
#pragma mark 一般类别：蛋类  加工类 道具类 交通工具类
+(id) getEggItem:(CXMLElement*)node;
+(id) getProductItem:(CXMLElement*)node;
+(id) getPropItem:(CXMLElement*)node;
+(id) getVeicleItem:(CXMLElement*)node;
@end
