//
//  AudioController.h
//  往死里喊
//
//  Created by mac on 12-1-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreAudio/CoreAudioTypes.h>
#import <AVFoundation/AVFoundation.h>


#define MUSIC_VOLUME_REDUCTION 0.4 // 5 seconds
#define kLevelUpdatesPerSecond 18 

@interface AudioController : NSObject <AVAudioSessionDelegate, AVAudioPlayerDelegate, AVAudioRecorderDelegate>
{
    AVAudioRecorder *recorder;
    AVAudioPlayer   *avPlayer;
    AVAudioPlayer   *avSound;
    double          lowPassResults;
    
    bool            isPlaying;

/*****************************************OpenEars************************************************/
    
}

@property (nonatomic, retain) AVAudioRecorder* recorder;

+(AudioController*) sharedAudioController;
 
//播放背景音乐
-(void) playBackgroundMusic: (NSString*)musicName;

//播放音效
-(void) playSound: (NSString*)soundName;

//音乐是否在播放中
-(bool) isBackgroundMusicPlaying;

//暂停播放音乐
-(void) pausePlayBackgroundMusic;

//继续播放音乐
-(void) gotoPlayBackgroundMusic;

//设置音乐音量
-(void) setMusicVolume :(float)volume;

//设置音效音量
-(void) setSoundVolume :(float)volume;


//-(IBAction)sliderChanged:(id)sender;

// Example for reading out the input audio levels without locking the UI using an NSTimer


@end
