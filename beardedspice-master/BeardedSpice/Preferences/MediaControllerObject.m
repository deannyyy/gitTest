//
//  MediaControllerObject.m
//  BeardedSpice
//
//  Created by Roman Sokolov on 02.05.15.
//  Copyright (c) 2015 Tyler Rhodes / Jose Falcon. All rights reserved.
//

#import "MediaControllerObject.h"
#import "BSMediaStrategy.h"

@implementation MediaControllerObject

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

- (id)initWithObject:(id)object{

    self = [super init];
    if (self) {
        if ([object respondsToSelector:@selector(displayName)]) {
            _name = [object displayName];
        }

        if ([object isMemberOfClass:BSMediaStrategy.class]) {
            _isCustom = [object custom];
            _version = [NSString stringWithFormat:@"%ld", [object strategyVersion]];
        } else if ([[object class] instancesRespondToSelector:@selector(isPlaying)] || [[object class] instancesRespondToSelector:@selector(isPlaying:)]) {
            _isCustom = NO;
            _version = [NSString string];
        }
        
        _representationObject = object;
    }

    return self;
}

#pragma clang diagnostic pop

- (id)init
{
    return [self initWithObject:nil];
}

@end
