//
//  ProductCollectionViewController.m
//  day11-01Lottery
//
//  Created by labixiaoxin1019 on 16/3/1.
//  Copyright © 2016年 labixiaoxin1019. All rights reserved.
//

#import "ProductCollectionViewController.h"

#import "ProductCell.h"
#import "ProductModel.h"

@interface ProductCollectionViewController ()


@property (nonatomic,strong) NSMutableArray *products; // 从JSON得到的数据

@end

@implementation ProductCollectionViewController

#pragma mark - 重写init方法:
-(instancetype)init
{
    
    // 流布局
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置布局
    flowLayout.minimumLineSpacing = 10;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.itemSize = CGSizeMake(95, 95);
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 0, 0, 0);
    
    
    return [super initWithCollectionViewLayout:flowLayout];
    
}


#pragma mark - 懒加载得到JSON数据：
-(NSMutableArray *)products
{
    
    if (_products == nil) {
        
        _products = [NSMutableArray array];
        
        NSString *fileName = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:fileName];
        
        NSArray *jsonArr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
        for (NSDictionary *dict in jsonArr) {
            
            ProductModel *pModel = [ProductModel ProductModelWithDictionary:dict];
            
            [_products addObject:pModel];
            
        }
        
    }
    
    return _products;
}



#pragma mark - viewDidLoad方法：
static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置collectionView的背景颜色
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    

    
    // Register cell classes
    UINib *Nib = [UINib nibWithNibName:@"ProductCell" bundle:nil];
    
    [self.collectionView registerNib:Nib forCellWithReuseIdentifier:reuseIdentifier];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - CollectionView数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // cell.backgroundColor = [UIColor redColor];
    
    
    // 得到cell的数据模型
    ProductModel *pModel = self.products[indexPath.item];
    
    cell.proModel = pModel;
    
    return cell;
}

#pragma mark - CollectionView代理方法

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ProductModel *pModel = self.products[indexPath.item];

    NSLog(@"点了%@",pModel.title);
    
    // 跳转URL
    NSURL *url = [NSURL URLWithString:pModel.url];
    [[UIApplication sharedApplication] openURL:url];
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
