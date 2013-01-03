//
//  AudioController.m
//  往死里喊
//
//  Created by mac on 12-1-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AudioController.h"
#import <AudioToolbox/AudioServices.h>


@interface AudioController (privataMethod)

-(void) OpenEarsInit;

@end

@implementation AudioController


@synthesize recorder;
//@synthesize uiUpdateTimer;



static AudioController *sharedAudioController = nil;


+(AudioController*) sharedAudioController
{
    if (sharedAudioController == nil) 
    {
        sharedAudioController = [[self alloc] init];
    }
    return sharedAudioController;
}


-(id) init
{
    if (self = [super init]) 
    {

        
//        [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryRecord error:nil];
//        
//        NSDictionary* record_settings = [[NSDictionary alloc] 
//                                         initWithObjectsAndKeys:
//                                         [NSNumber numberWithInt:kAudioFormatAppleLossless], AVFormatIDKey, // needs CoreAudioTypes.h
//                                         [NSNumber numberWithInt:AVAudioQualityMax], AVEncoderAudioQualityKey,
//                                         nil
//                                         ];
//        
//        NSString* temp_dir = NSTemporaryDirectory();
//        NSString* recording_file_path = [temp_dir stringByAppendingString: @"audio_recording.caf"];
//        NSURL* recording_file_url = [[NSURL alloc] initFileURLWithPath:recording_file_path];
//        
//        
//        recorder = [[AVAudioRecorder alloc] initWithURL:recording_file_url
//                                               settings:record_settings
//                                                  error:nil
//                    ];
//        
//        
//        [record_settings release];
//        [recording_file_url release];
//        recorder.delegate = self;
//        recorder.meteringEnabled = YES;
//        
//        // Start the audio session
//        [[AVAudioSession sharedInstance] setActive:YES error:nil];
//        
//        // Optional: Will create file and prepare to record. If you don't call this, it will happen at record.
//        [self.recorder prepareToRecord];
//        [self.recorder record];
//        
//        //开启录音和播放同时进行的模式
//        UInt32 audioCategory = kAudioSessionCategory_PlayAndRecord;
//        AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(audioCategory), &audioCategory);
//        UInt32 audioRoute = kAudioSessionOverrideAudioRoute_Speaker;
//        AudioSessionSetProperty(kAudioSessionProperty_OverrideAudioRoute, sizeof(audioRoute), &audioRoute);
    }
    return self;
}

-(void) setMusicVolume :(float)volume
{
    avPlayer.volume = volume;
}

-(void) setSoundVolume :(float)volume
{
    avSound.volume = volume;
}

-(void) playBackgroundMusic: (NSString*)musicName
{
    [[AVAudioSession sharedInstance] setDelegate:self];
    [[AVAudioSession sharedInstance] setActive:YES error:nil]; 
    
    NSURL* file_url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:musicName ofType:@"mp3"] isDirectory:NO];
    avPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:file_url error:nil];	
    avPlayer.delegate = self;
    avPlayer.numberOfLoops = -1; // repeat infinitely
    [file_url release];
    
    [avPlayer play];
    isPlaying = YES;
}

-(void) pausePlayBackgroundMusic
{
    if(isPlaying)
	{
		[avPlayer pause];
		avPlayer.volume = 1.0;
        isPlaying = NO;
	}

}

-(void) gotoPlayBackgroundMusic
{
    if(!isPlaying)
	{
		[avPlayer play];		
		avPlayer.volume = MUSIC_VOLUME_REDUCTION;
        isPlaying = YES;
	}
}

-(void) playSound: (NSString*)soundName
{
    [[AVAudioSession sharedInstance] setDelegate:self];
    [[AVAudioSession sharedInstance] setActive:YES error:nil]; 
    
    NSURL* file_url = [[NSURL alloc] initFileURLWithPath:[[NSBundle mainBundle] pathForResource:soundName ofType:@"wav"] isDirectory:NO];
    avSound = [[AVAudioPlayer alloc] initWithContentsOfURL:file_url error:nil];	
    avSound.delegate = self;
    //avPlayer.numberOfLoops = -1; // repeat infinitely
    [file_url release];
    
    [avSound play];
}

-(bool) isBackgroundMusicPlaying
{
    return isPlaying;
}

-(void) deleRecordFile
{
    [recorder stop];
    [recorder deleteRecording];
}

-(void) dealloc
{
	[[AVAudioSession sharedInstance] setActive:NO error:nil]; // don't care about the error
	
	NSString* temp_dir = NSTemporaryDirectory();
	NSString* recording_file_path = [temp_dir stringByAppendingString: @"audio_recording.caf"];
	[[NSFileManager defaultManager] removeItemAtPath:recording_file_path error:nil];
	[avPlayer release];
    [avSound release];
	[[AVAudioSession sharedInstance] setActive:NO error:nil]; // don't care about the error
    
    
    [super dealloc];
    
}




@end
