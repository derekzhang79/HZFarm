//
//  Contents.m
//  MapTest
//
//  Created by Any on 12-3-22.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//


#import "Contents.h"

@implementation Contents

@synthesize gestureStartPoint;
@synthesize cameraPos;

@synthesize _poultryStandard;
@synthesize _frame;
@synthesize filename_states;
@synthesize filename_standard;
@synthesize filename_frame;
@synthesize shedsFile;

static Contents *_sharedContext = nil;

+(Contents*)getContents 
{
	if (!_sharedContext) {
		_sharedContext = [[self alloc] init];
	}
	
	return _sharedContext;
}

- (id) init
{
	if ((self = [super init])) {
		gestureStartPoint = CGPointZero;
        cameraPos = CGPointZero;
        
        
        self.shedsFile = @"shedCollMap.tmx";
        self.filename_states = @"/Users/any/Desktop/ShedsStates.plist";
        self.filename_standard = @"/Users/any/Desktop/ShedsStandard.plist";
        self.filename_frame = [[NSBundle mainBundle] pathForResource:@"Frame" ofType:@"plist"];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:filename_standard];
        _poultryStandard = [[NSMutableDictionary alloc] initWithDictionary:[dict objectForKey:@"poultryStandard"]];
        
        NSMutableDictionary *frame = [NSMutableDictionary dictionaryWithContentsOfFile:self.filename_frame];
        _frame = [[NSMutableDictionary alloc] initWithDictionary:frame ];
        
        NSMutableDictionary *states = [NSMutableDictionary dictionaryWithContentsOfFile:filename_states];
        
        
	}
	return self;
}

- (NSString *)getSysNameByType:(NSInteger)type isAdult:(BOOL)isAdult isHarvest:(BOOL)isHarvest
{
    NSString *preName;
    NSString *lastName;
    if (isAdult == NO) {
        preName = @"幼年";
    }
    else if (isHarvest == NO) {
        preName = @"成年";
    }
    else {
        preName = @"成熟";
    }
    switch (type) {
        case 1:
            lastName = @"鸡";
            break;
        case 2:
            lastName = @"野鸡";
            break;
        case 3:
            lastName = @"火鸡";
            break;
        case 4:
            lastName = @"珍珠鸡";
            break;
        case 5:
            lastName = @"贵妃鸡";
            break;
        case 6:
            lastName = @"天鹅";
            break;
        case 7:
            lastName = @"鸵鸟";
            break;
        case 8:
            lastName = @"孔雀";
            break;
            
        default:
            break;
    }
    NSString *name = [preName stringByAppendingString:lastName];
    return name;
}

- (NSInteger)getTypeBySysName:(NSString *)name
{
    NSInteger type = 1;
    if ([name isEqualToString:@"幼年鸡"] || [name isEqualToString:@"成年鸡"] || [name isEqualToString:@"成熟鸡"]) {
        type = 1;
    }
    else if ([name isEqualToString:@"幼年野鸡"] || [name isEqualToString:@"成年野鸡"] || [name isEqualToString:@"成熟野鸡"]) {
        type = 2;
    }
    else if ([name isEqualToString:@"幼年火鸡"] || [name isEqualToString:@"成年火鸡"] || [name isEqualToString:@"成熟火鸡"]) {
        type = 3;
    }
    else if ([name isEqualToString:@"幼年珍珠鸡"] || [name isEqualToString:@"成年珍珠鸡"] || [name isEqualToString:@"成熟珍珠鸡"]) {
        type = 4;
    }
    else if ([name isEqualToString:@"幼年贵妃鸡"] || [name isEqualToString:@"成年贵妃鸡"] || [name isEqualToString:@"成熟贵妃鸡"]) {
        type = 5;
    }
    else if ([name isEqualToString:@"幼年天鹅"] || [name isEqualToString:@"成年天鹅"] || [name isEqualToString:@"成熟天鹅"]) {
        type = 6;
    }
    else if ([name isEqualToString:@"幼年鸵鸟"] || [name isEqualToString:@"成年鸵鸟"] || [name isEqualToString:@"成熟鸵鸟"]) {
        type = 7;
    }
    else if ([name isEqualToString:@"幼年孔雀"] || [name isEqualToString:@"成年孔雀"] || [name isEqualToString:@"成熟孔雀"]) {
        type = 8;
    }
    return type;
}

- (NSString*)getEggNameByType:(NSInteger)type
{
    NSString *lastName;
    switch (type) {
        case 1:
            lastName = @"鸡蛋";
            break;
        case 2:
            lastName = @"野鸡蛋";
            break;
        case 3:
            lastName = @"火鸡蛋";
            break;
        case 4:
            lastName = @"珍珠鸡蛋";
            break;
        case 5:
            lastName = @"贵妃鸡蛋";
            break;
        case 6:
            lastName = @"天鹅蛋";
            break;
        case 7:
            lastName = @"鸵鸟蛋";
            break;
        case 8:
            lastName = @"孔雀蛋";
            break;
            
        default:
            break;
    }
    return lastName;
}

- (void)dealloc {	
	
    self._poultryStandard = nil;
    self._frame = nil;
    self.filename_states = nil;
    self.filename_standard = nil;
    self.filename_frame = nil;
    self.shedsFile = nil;
	[super dealloc];
}

@end