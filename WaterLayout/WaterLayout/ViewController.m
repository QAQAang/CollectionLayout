//
//  ViewController.m
//  WaterLayout
//
//  Created by dllo on 16/4/11.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "WaterLayout.h"
#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "CircleLayout.h"
@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, retain) UICollectionView *collection;

@property (nonatomic, retain) WaterLayout *layout;

@property (nonatomic, retain) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.layout = [[WaterLayout alloc] init];
//    self.layout.lineNumber = 3;
//    self.layout.rowSpacing = 10;
//    self.layout.lineSpacing = 10;
//    self.layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
//    [self.layout computeIndexCellHeightWithWidthBlock:^CGFloat(NSIndexPath *indexPath, CGFloat width) {
//        CGFloat height = [[self.dataArr[indexPath.row] valueForKey:@"worksHeight"] floatValue] / [[self.dataArr[indexPath.row] valueForKey:@"worksWidth"] floatValue] * width+ 60;
//        return height;
//    }];
    CircleLayout *layout = [[CircleLayout alloc] init];
//    layout.itemCount = 20;
    layout.radius = 75;
    self.collection = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    self.collection.backgroundColor = [UIColor whiteColor];
    [self.collection registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collection];
//    [self getTaskData];
}

//- (void)getTaskData{
//    [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://api.artgoer.cn:8084/artgoer/api/v1/user/126323/new_likes?pageIndex=1&token=07d48315-f9be-4d20-a2db-657f7284ad5c&otherUserId=101320"]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        self.dataArr = [[[NSJSONSerialization JSONObjectWithData:data options:0 error:&error] valueForKey:@"data"] valueForKey:@"works"];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//           [self.collection reloadData];
//        });
//    }]resume];
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 11;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:(arc4random() % 255) / 256.0  green:(arc4random() % 255) / 256.0 blue:(arc4random() % 255) / 256.0 alpha:0.4];

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
