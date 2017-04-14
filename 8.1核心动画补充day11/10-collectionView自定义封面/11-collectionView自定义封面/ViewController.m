//
//  ViewController.m
//  11-collectionView自定义封面
//
//  Created by vera on 16/4/7.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "ViewController.h"
#import "Cell.h"
#import "CircleFlowLayout.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

/**
 *  图片
 */
@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation ViewController

- (NSMutableArray *)images
{
    if (!_images)
    {
        _images = [NSMutableArray array];
        
        for (int i = 0; i < 6; i++)
        {
            NSString *imageName = [NSString stringWithFormat:@"Irelia_%d",i];
            
            [_images addObject:[UIImage imageNamed:imageName]];
        }
    }
    
    return _images;
}

/**
 *  获取图片比例
 *
 *  @return <#return value description#>
 */
- (CGFloat)scaleForImage
{
    UIImage *image = [UIImage imageNamed:@"Irelia_0"];
    
    //比例
    return image.size.height / image.size.width;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        CircleFlowLayout *layout = [[CircleFlowLayout alloc] init];
        
        //item的大小
        layout.itemSize = CGSizeMake(300, 300 * [self scaleForImage]);
        
        //滚动方向
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        layout.minimumLineSpacing = -80;
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        
        collectionView.delegate = self;
        collectionView.dataSource = self;
        
        [self.view addSubview:collectionView];
        
        [collectionView registerNib:[UINib nibWithNibName:@"Cell" bundle:nil] forCellWithReuseIdentifier:@"Cell"];
        
        _collectionView = collectionView;
    }
    
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
#if 0
    //瀑布流必须重写下面4个方法
    //1.重新布局（reloadData会触发）
    - (void)prepareLayout;
    
    //2.返回指定范围的item信息
    - (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect;
    
    //3.返回自定indexPath的item信息
    - (nullable UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath;
    
    //4.返回当前collectionView的contentSize
    - (CGSize)collectionViewContentSize;
#endif

    [self collectionView];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.imageView.image = self.images[indexPath.item];
    
    return cell;
}

/**
 *  点击每个item会触发
 *
 *  @param collectionView <#collectionView description#>
 *  @param indexPath      <#indexPath description#>
 */
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
