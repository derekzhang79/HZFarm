//
//  Factory.m
//  MapTest
//
//  Created by Any on 12-4-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Factory.h"
#import "EggModel.h"
#include "Contents.h"

const static float shuiZhuDan = 50;
const static float chaYeDan = 25;
const static float songHuaDan = 15;
const static float bingGan = 11;
const static float mianBao = 8;
const static float jiDanMian = 5;
const static float danTa = 3;
const static float danJuan = 3;
const static float danHuangJiang = 2;
const static float danBaiFen = 2;
const static float naiYouDanGao = 1;
const static float caoMeiDanGao = 0.5;
const static float qiaoKeLiDanGao = 0.5;
const static float xiangCaoDanGao = 0.25;
const static float zhiShiDanGao = 0.25;
const static float huangJinDan = 0.05;
const static float zuanShi = 0.01;

@implementation Factory

+ (NSString *)privPro:(EggModel *)egg
{
    NSInteger level = 1;
    CGFloat commonPro = egg._sellPrice*2*level;
//    if (RANDOM_F(0, 100)<=commonPro*zuanShi) {
//        return @"zuanShi";
//    }
    if (RANDOM_F(0, 100)<=commonPro*huangJinDan) {
        return @"金蛋";
    }
    if (RANDOM_F(0, 100)<=commonPro*zhiShiDanGao) {
        return @"芝士蛋糕";
    }
    if (RANDOM_F(0, 100)<=commonPro*xiangCaoDanGao) {
        return @"香草蛋糕";
    }
    if (RANDOM_F(0, 100)<=commonPro*qiaoKeLiDanGao) {
        return @"巧克力蛋糕";
    }
    if (RANDOM_F(0, 100)<=commonPro*caoMeiDanGao) {
        return @"草莓蛋糕";
    }
    if (RANDOM_F(0, 100)<=commonPro*naiYouDanGao) {
        return @"奶油蛋糕";
    }
    if (RANDOM_F(0, 100)<=commonPro*danBaiFen) {
        return @"蛋白粉";
    }
    if (RANDOM_F(0, 100)<=commonPro*danHuangJiang) {
        return @"蛋黄酱";
    }
    if (RANDOM_F(0, 100)<=commonPro*danJuan) {
        return @"蛋卷";
    }
    if (RANDOM_F(0, 100)<=commonPro*danTa) {
        return @"蛋挞";
    }
    if (RANDOM_F(0, 100)<=commonPro*jiDanMian) {
        return @"鸡蛋面";
    }
    if (RANDOM_F(0, 100)<=commonPro*mianBao) {
        return @"面包";
    }
    if (RANDOM_F(0, 100)<=commonPro*bingGan) {
        return @"饼干";
    }
    if (RANDOM_F(0, 100)<=commonPro*songHuaDan) {
        return @"松花蛋";
    }
    if (RANDOM_F(0, 100)<=commonPro*chaYeDan) {
        return @"茶叶蛋";
    }
    if (RANDOM_F(0, 100)<=commonPro*shuiZhuDan) {
        return @"鸡蛋";
    }
    return @"鸡蛋";
}

+ (NSMutableArray *)process:(NSMutableArray *)materials
{
    NSMutableArray *products = [[[NSMutableArray alloc] initWithCapacity:10] autorelease];
    for (EggModel *element in materials) {
        NSString *product = [self privPro:element];
        [products addObject:product];
    }
    return products;
}

+ (NSString*)processOne:(EggModel*)meterial
{
    return [self privPro:meterial];
}

@end
