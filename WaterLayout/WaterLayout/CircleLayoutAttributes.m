//
//  CircleLayoutAttributes.m
//  WaterLayout
//
//  Created by dllo on 16/4/12.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CircleLayoutAttributes.h"

@implementation CircleLayoutAttributes

- (CGPoint)anchorPoint{
    if (_anchorPoint.x == 0 && _anchorPoint.y == 0) {
        _anchorPoint = CGPointMake(0.5, 0.5);
    }
    return _anchorPoint;
}

- (void)setAngle:(CGFloat)angle{
    _angle = angle;
    self.zIndex = (int)(angle * 1000000);
    self.transform = CGAffineTransformMakeRotation(angle);
}

- (id)copyWithZone:(NSZone *)zone{
    CircleLayoutAttributes *copiedAttributes = [super copyWithZone:zone];
    copiedAttributes.anchorPoint = self.anchorPoint;
    copiedAttributes.angle = self.angle;
    return copiedAttributes;
}



@end
