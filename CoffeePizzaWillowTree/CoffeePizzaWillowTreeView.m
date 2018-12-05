//
//  CoffeePizzaWillowTreeView.m
//  CoffeePizzaWillowTree
//
//  Created by TJ Barber on 12/5/18.
//  Copyright © 2018 TJ Barber. All rights reserved.
//

#import "CoffeePizzaWillowTreeView.h"

@implementation CoffeePizzaWillowTreeView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
