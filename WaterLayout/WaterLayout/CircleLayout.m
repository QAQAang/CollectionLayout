//
//  CircleLayout.m
//  WaterLayout
//
//  Created by dllo on 16/4/12.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CircleLayout.h"
#import "CircleLayoutAttributes.h"
@interface CircleLayout ()

@property (nonatomic, retain) NSMutableArray *attributeAttay;

@property (nonatomic, assign) CGFloat anglePerItem;

@property (nonatomic, assign) CGFloat angleAtExtreme;

@property (nonatomic, assign) CGFloat angle;

@end

@implementation CircleLayout

- (CGFloat)angleAtExtreme{
    _angleAtExtreme = [self.collectionView numberOfItemsInSection:0] > 0 ? - (CGFloat)([self.collectionView numberOfItemsInSection:0] - 1) * self.anglePerItem : 0;
    return _angleAtExtreme;
}

- (CGFloat)angle{
    _angle = self.angleAtExtreme * self.collectionView.contentOffset.x / (self.collectionView.contentSize.width - CGRectGetWidth(self.collectionView.bounds));
    return _angle;
}

- (CGFloat)anglePerItem{
    _anglePerItem = atan(self.itemSize.width / self.radius);
    return _anglePerItem;
}

- (NSMutableArray *)attributeAttay{
    if (_attributeAttay == nil) {
        _attributeAttay = [NSMutableArray array];
    }
    return _attributeAttay;
}

- (void)setRadius:(CGFloat)radius{
    _radius = radius;
    [self invalidateLayout];
}

-(void)prepareLayout{
    [super prepareLayout];
    self.itemSize = CGSizeMake(50, 75);
    CGFloat centerX = self.collectionView.contentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);
    CGFloat anchorPointY = ((self.itemSize.height / 2.0) + self.radius) / self.itemSize.height;
    for (int i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++) {
        CircleLayoutAttributes *attributes = [CircleLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attributes.size = self.itemSize;
        attributes.center = CGPointMake(centerX, CGRectGetMidY(self.collectionView.bounds));
        attributes.angle = self.angle + self.anglePerItem * (CGFloat)i;
        attributes.anchorPoint = CGPointMake(0.5, anchorPointY);
        [self.attributeAttay addObject:attributes];
    }
//    for (NSInteger i = 0 ; i < [self.collectionView numberOfItemsInSection:0]; i++) {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
//        [self.attributeAttay addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
//    }
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

-(CGSize)collectionViewContentSize{
    return CGSizeMake([self.collectionView numberOfItemsInSection:0] * self.itemSize.width, self.collectionView.bounds.size.height);
}
//返回设置数组
-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    return _attributeAttay;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    return self.attributeAttay[indexPath.row];
}

+ (Class)layoutAttributesClass{
    return [CircleLayoutAttributes class];
}

@end
