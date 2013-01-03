//
//  Import.h
//  往死里喊
//
//  Created by mac on 12-1-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"



#define IPHONE4_VERTICAL_PIXEL      960
#define IPHONE4_HORIZONTAL_PIXEL    640

//角度转换为弧度
#define RADIANS(degrees) ((degrees * M_PI) / 180.0) 


#ifdef __cplusplus
extern "C" {
#endif	

    
#define CAX(x)  convertACoordinateX(x)
#define CAY(y)  convertACoordinateY(y)
    
#define CCXY(x, y) ConvertCoordinateInScreen(x, y)
    
#define CCXYS(sprite, x, y) ConvertCoordinateInSprite(sprite, x, y)
    
#define TOUCHPOS(x, y) DisplayCoordinate(x, y)

CG_INLINE int convertACoordinateX(int x)
{
    return x;
}
    
CG_INLINE int convertACoordinateY(int y)
{
    return 1024-y;
}
    

CG_INLINE CGPoint ConvertCoordinateInScreen(CGFloat x, CGFloat y)
{
    CGPoint p;
    p.x = x; 
    p.y = 768-y; 
    return p;
}
    
CG_INLINE CGPoint ConvertCoordinateInSprite(CCSprite *sprite, CGFloat x, CGFloat y)
{
    CGPoint p;
    p.x = x; 
    p.y = sprite.contentSize.height - y; 
    return p;
}
    
CG_INLINE void DisplayCoordinate(CGFloat x, CGFloat y)
{
    int x1 = x;
    int y1 = y;
    CCLOG(@"x=%i, y=%i", x1, y1);
}
    
CG_INLINE bool RectContainsPoint(CGRect rect, CGPoint point)
{
    if (point.x >= rect.origin.x && 
        point.x <= rect.origin.x+rect.size.width &&
        point.y >= rect.origin.y &&
        point.y <= rect.origin.y+rect.size.height)
        return YES;
    else
        return NO;
}
    

//CG_INLINE int convertACoordinateY2(int y)
//{
//    return 634-y;
//}
    

//extern IOS_DEVICE_WIDTH = 0;
//extern IOS_DEVICE_HEIGHT = 0;



////获取IOS设备的硬件版本
//#include <sys/types.h>
//#include <sys/sysctl.h>
//@interface IOS_DEVICE_VERSION 
//
//+(NSString *)platform;
//    
//@end
//
//@implementation IOS_DEVICE_VERSION
//
//+(NSString *)platform
//{
//    size_t size;
//    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
//    char *machine = malloc(size);
//    sysctlbyname("hw.machine", machine, &size, NULL, 0);
//    /*
//     Possible values:
//     "iPhone1,1" = iPhone 1G
//     "iPhone1,2" = iPhone 3G
//     "iPhone3,1" = iPhone 4
//     "iPhone2,1" = iPhone 3GS
//     "iPod1,1"   = iPod touch 1G
//     "iPod2,1"   = iPod touch 2G
//     */
//    NSString *platform = [NSString stringWithCString:machine];
//    free(machine);
//    return platform;
//}

//@end
