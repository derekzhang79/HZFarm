#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define SECONDS_ONE_HOUR 100


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
    
    CG_INLINE int getRandomNumber(int from, int to)
    {
        return(int)(from + arc4random() % (to-from+1));
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


@interface Content : NSObject{
    
    NSMutableDictionary *_poultryStandard;
    NSString *filename_states;
    NSString *filename_standard;
    NSString *shedsFile;
    NSDate   *lastSignOut;
    
}
@property (nonatomic, retain)NSMutableDictionary *_poultryStandard;

@property (nonatomic, retain)NSString *filename_states;
@property (nonatomic, retain)NSString *filename_standard;
@property (nonatomic, retain)NSString *shedsFile;
@property (nonatomic, retain)NSDate   *lastSignOut;

+ (Contents*)getContents;



@end