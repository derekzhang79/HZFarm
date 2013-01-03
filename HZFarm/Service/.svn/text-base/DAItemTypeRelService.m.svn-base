//
//  DAItemTypeRelService.m
//  MapTest
//
//  Created by liwensheng on 12-4-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "DAItemTypeRelService.h"

@implementation DAItemTypeRelService

+(NSString*) GetItemTypeName:(DAItemType )itype
{
    switch (itype) {
        case ItemType_Building:
            return [NSString stringWithFormat:@"建筑类"];
            break;
        case ItemType_General:
            return [NSString stringWithFormat:@"一般类"];
            break;
        case ItemType_Poultry:
            return [NSString stringWithFormat:@"家禽类"];
            break;
        case ItemType_Special:
            return [NSString stringWithFormat:@"特殊类"];
            break;
            
        default:
            return [NSString stringWithFormat:@"UnKown"];
            break;
    }
}
+(DAItemType) GetItemType:(NSString*)name
{
    if ([name isEqualToString:@"建筑类"]) {
        return ItemType_Building;
    }
    else if([name isEqualToString:@"一般类"])
    {
        return ItemType_General;
    }
    else if([name isEqualToString:@"家禽类"])
    {
        return ItemType_Poultry;
    }
    else if([name isEqualToString:@"特殊类"])
    {
        return ItemType_Special;
    }
    return ItemType_UnKown;
}

//建筑类别
+(NSString *)GetBuildingTypeName:(DABuildingType) btype
{
    switch (btype) {
        case BuildingType_Breeding:
            return [NSString stringWithFormat:@"养殖类"];
            break;
        case BuildingType_Magic:
            return [NSString stringWithFormat:@"魔法类"];
            break;
        case BuildingType_Normal:
            return [NSString stringWithFormat:@"一般类"];
            break;
        case BuildingType_Processing:
            return [NSString stringWithFormat:@"加工类"];
            break;
        default:
            return [NSString stringWithFormat:@"UnKown"];
            break;
    }
}
+(DABuildingType) GetBuildingType:(NSString *) name
{
    if ([name isEqualToString:@"养殖类"]) {
        return BuildingType_Breeding;
    }
    else if([name isEqualToString:@"魔法类"])
    {
        return BuildingType_Magic;
    }
    else if([name isEqualToString:@"一般类"])
    {
        return BuildingType_Normal;
    }
    else if([name isEqualToString:@"加工类"])
    {
        return BuildingType_Processing;
    }
    return BuildingType_UnKown;

}

//一般类别
+(NSString *) GetGeneralTypeName:(DAGeneralItemType) gtype
{
    switch (gtype) {
     case GeneralItem_Eggs:
     return [NSString stringWithFormat:@"禽蛋类"];
     break;
     case GeneralItem_Products:
     return [NSString stringWithFormat:@"加工产品类"];
     break;
     case GeneralItem_Prop:
     return [NSString stringWithFormat:@"道具类"];
     break;
     case GeneralItem_Vehicle:
     return [NSString stringWithFormat:@"交通工具类"];
     break;
     default:
     return [NSString stringWithFormat:@"UnKown"];
     break;
    }
}
+(DAGeneralItemType) GetGetneralType:(NSString*) name
{
    if ([name isEqualToString:@"禽蛋类"]) {
        return GeneralItem_Eggs;
    }
    else if([name isEqualToString:@"加工产品类"])
    {
        return GeneralItem_Products;
    }
    else if([name isEqualToString:@"道具类"])
    {
        return GeneralItem_Prop;
    }
    else if([name isEqualToString:@"交通工具类"])
    {
        return GeneralItem_Vehicle;
    }
    return GeneralItem_UnKown;

}
@end
