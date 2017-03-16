//
//  AVPlayerLayerView.m
//  SampleDragVideo
//
//  Created by quanght2 on 8/31/16.
//  Copyright © 2016 VngCorp. All rights reserved.
//

#import "AVPlayerLayerView.h"

@implementation AVPlayerLayerView

+ (Class)layerClass {
    return [AVPlayerLayer class];
}

- (AVPlayerLayer *)playerLayer {
    return (AVPlayerLayer *)self.layer;
}

@end
