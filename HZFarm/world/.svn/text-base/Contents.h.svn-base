
#import "cocos2d.h"

#define SECONDS_ONE_HOUR 30/3600
#define kDEFAULT_DATE_TIME_FORMAT (@"yyyy-MM-dd'T'HH:mm:ss'Z'")

enum PoultryType{
    poultry1 = 1,
    poultry2,
    poultry3,
    poultry4,
    poultry5,
    poultry6,
    poultry7,
    poultry8,
};





#ifdef __cplusplus
extern "C" {
#endif	
    //

#define RANDOM(from, to)  getRandomNumber(from, to)
#define RANDOM_F(from, to) getRandomNumberf(from, to)
    
CG_INLINE int getRandomNumber(int from, int to)
{
    return(int)(from + arc4random() % (to-from+1));
}
    
CG_INLINE float getRandomNumberf(CGFloat from, CGFloat to)
{
    assert(to>from);
    srand(time(NULL));
    CGFloat dis = to-from;
    return(float)(from + (rand()%1000)/(1000/dis));
}

CG_INLINE CGPoint normalize(const CGPoint v)
{
    if (ccpLength(v) == 0) {
        return ccp(0, 0);
    }
    else{
        return ccpMult(v, 1.0f/ccpLength(v));
    }
}
    
    
static const CGFloat MAPSCALE = 1.0f;//地图缩放

@interface Contents : NSObject{
    CGPoint gestureStartPoint;
    CGPoint cameraPos;
    
    
    NSMutableDictionary *_poultryStandard;
    NSMutableDictionary *_frame;
    NSString *filename_states;
    NSString *filename_standard;
    NSString *filename_frame;
    NSString *shedsFile;
    NSMutableDictionary *_foot;
}

@property (nonatomic)CGPoint gestureStartPoint;//保存上次触摸位置
@property (nonatomic)CGPoint cameraPos;//摄影机位置


@property (nonatomic, retain)NSMutableDictionary *_poultryStandard;
@property (nonatomic, retain)NSMutableDictionary *_frame;

@property (nonatomic, retain)NSString *filename_states;
@property (nonatomic, retain)NSString *filename_standard;
@property (nonatomic, retain)NSString *filename_frame;
@property (nonatomic, retain)NSString *shedsFile;


+ (Contents*)getContents;

- (NSString *)getSysNameByType:(NSInteger)type isAdult:(BOOL)isAdult isHarvest:(BOOL)isHarvest;

- (NSInteger)getTypeBySysName:(NSString *)name;

- (NSString*)getEggNameByType:(NSInteger)type;

@end