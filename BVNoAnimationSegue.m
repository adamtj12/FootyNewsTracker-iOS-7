//
//  BVNoAnimationSegue.m
//  help me
//
//  Created by Adam Johnston on 06/12/2012.
//  Copyright (c) 2012 Adam Johnston. All rights reserved.
//

#import "BVNoAnimationSegue.h"

@implementation BVNoAnimationSegue
- (void)perform
{
    [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];
}

@end
