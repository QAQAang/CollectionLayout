//
//  CollectionViewCell.m
//  WaterLayout
//
//  Created by dllo on 16/4/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "CollectionViewCell.h"
#import "CircleLayoutAttributes.h"
@interface CollectionViewCell ()

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

- (void)creatView{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ([UIScreen mainScreen].bounds.size.width - 30) / 2, self.frame.size.height - 60)];
    [self.contentView addSubview:self.imageView];
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 50, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 20)];
    self.textLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:self.textLabel];
    self.detextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 20, ([UIScreen mainScreen].bounds.size.width - 30) / 2, 20)];
    self.detextLabel.font = [UIFont systemFontOfSize:15];
    self.detextLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.detextLabel];
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    CircleLayoutAttributes *circularlayoutAttributes = layoutAttributes;
    self.layer.anchorPoint = circularlayoutAttributes.anchorPoint;
    self.center = CGPointMake(self.center.x, (circularlayoutAttributes.anchorPoint.y - 0.5) * CGRectGetHeight(self.bounds) + self.center.y);
}

@end
