
#import "Content.h"

@implementation Content

@synthesize _poultryStandard;
@synthesize filename_states;
@synthesize filename_standard;
@synthesize shedsFile;
@synthesize lastSignOut;

static Content *_sharedContext = nil;

+(Content*)getContents 
{
	if (!_sharedContext) {
		_sharedContext = [[self alloc] init];
	}
	
	return _sharedContext;
}

- (id)init
{
    if ((self = [super init])){
        self.shedsFile = @"shedCollMap.tmx";
        self.filename_states = @"/Users/mac/Desktop/ShedsStates.plist";
        self.filename_standard = @"/Users/mac/Desktop/ShedsStandard.plist";
        
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithContentsOfFile:filename_standard];
        self._poultryStandard = [[NSMutableDictionary alloc] initWithDictionary:[dict objectForKey:@"poultryStandard"]];
        [dict release];
        
        NSMutableDictionary *states = [[NSMutableDictionary alloc] initWithContentsOfFile:filename_states];
        self.lastSignOut = [states objectForKey:@"lastSignOut"]; 
        [states release];
    }
    return self; 
}

- (void)dealloc {	
    [self._poultryStandard release];
    [self.filename_states release];
    [self.filename_standard release];
    [self.shedsFile release];
    [self.lastSignOut release];
	[super dealloc];
}

@end