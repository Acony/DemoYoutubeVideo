//
//  AVPlayerLayerView.h
//  SampleDragVideo
//
//  Created by quanght2 on 8/31/16.
//  Copyright © 2016 VngCorp. All rights reserved.
//
//http://stackoverflow.com/questions/6548290/avplayerlayer-animates-frame-changes

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AVPlayerLayerView : UIView

@property (nonatomic, readonly) AVPlayerLayer *playerLayer;

@end
