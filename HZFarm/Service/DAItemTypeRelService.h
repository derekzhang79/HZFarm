//
//  DAItemTypeRelService.h
//  MapTest
//
//  Created by liwensheng on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DAItemTypeDefine.h"
@interface DAItemTypeRelService : NSObject
{
    
}
//物品总类别
+(NSString*) GetItemTypeName:(DAItemType )itype;
+(DAItemType) GetItemType:(NSString*)name;

//建筑类别
+(NSString *)GetBuildingTypeName:(DABuildingType) btype;
+(DABuildingType) GetBuildingType:(NSString *) name;

//一般类别
+(NSString *) GetGeneralTypeName:(DAGeneralItemType) gtype;
+(DAGeneralItemType) GetGetneralType:(NSString*) name;



@end
