//
//  MainViewController.m
//  collection_second_list
//
//  Created by admin on 15/10/16.
//  Copyright © 2015年 admin. All rights reserved.
//



#import "MainViewController.h"
#import "CustomCollectionViewCell.h"
#import "HeadHideReusableView.h"
#import "HeadShowReusableView.h"
#import "HeadShowModel.h"


static NSString *CELL_IDENTIFIER = @"collectionCellID";
static NSString *HEAD_SHOW_IDENTIFIER = @"headerShowIdentifier";
static NSString *HEAD_HIDE_IDENTIFIER = @"headHideIdentifier";

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, HeadShowReusableViewDelegate, HeadHideReusableViewDelegate>

@property(nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic, strong)NSArray *headShowModels;

@end

@implementation MainViewController

-(UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 100) collectionViewLayout:layout];
    }
    return _collectionView;
}

-(NSArray *)headShowModels
{
    if (_headShowModels == nil) {
        _headShowModels = [HeadShowModel headModelList];
    }
    return _headShowModels;
}

-(void)loadView
{
    [super loadView];
    
    [self.collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:CELL_IDENTIFIER];
    [self.collectionView registerClass:[HeadShowReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEAD_SHOW_IDENTIFIER];
    [self.collectionView registerClass:[HeadHideReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HEAD_HIDE_IDENTIFIER];
    _collectionView.backgroundColor = [UIColor whiteColor];
    //水平滑动
    _collectionView.alwaysBounceVertical = YES;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    //return 2;
    return self.headShowModels.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return 2000;
    
    HeadShowModel *headShowModel = _headShowModels[section];
    
    return headShowModel.isOpen ? 2 : 0;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    cell.label.text = @"123";
    cell.contentView.backgroundColor = [UIColor darkGrayColor];
    
    return cell;
}

// The view that is returned must be retrieved from a call to -dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeadShowModel *headModel = _headShowModels[indexPath.section];
    
    NSUInteger height = headModel.isOpen ? 40 : 80;
    NSLog(@"the size is %lu", (unsigned long)height);
    
    if (headModel.isOpen == NO) {
        HeadShowReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HEAD_SHOW_IDENTIFIER forIndexPath:indexPath];
        //view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height);
        view.section = indexPath.section;
        view.delegate = self;
        return view;
    }else{
        HeadHideReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HEAD_HIDE_IDENTIFIER forIndexPath:indexPath];
        //view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, height);
        view.section = indexPath.section;
        view.delegate = self;
        return view;
    }
    
    
//    view.backgroundColor = [UIColor redColor];
//    
//    
    //view.section = indexPath.section;
//    if ([headModel.name isEqualToString:@"test----"])  {
//        view.label.text = headModel.nameOpen;
//    }else{
//        view.label.text = headModel.name;
//    }
//    view.delegate = self;
//    return view;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(70, 90);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return  UIEdgeInsetsMake(10, 0, 10, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 12;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}

//返回头headerView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    HeadShowModel *model = _headShowModels[section];
    CGSize heigh40 = {0, 40};
    CGSize heigh80 = {0, 80};
    
    CGSize size = model.isOpen ? heigh40 : heigh80;
    NSLog(@"the size is %@", NSStringFromCGSize(size));
    
    return model.isOpen ? heigh40 : heigh80;
}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)customShowCellClick : (HeadShowReusableView *)customCell sectionIndex : (NSUInteger)section
{
    NSLog(@">>>>> the section is %lu", (unsigned long)section);
    HeadShowModel *headShowModel = _headShowModels[section];
    if (headShowModel.isOpen == NO) {
        //当前处于打开状态
        //在以下代码设置打开状态的HeadView
        headShowModel.isOpen = YES;
        //headShowModel.name = headShowModel.nameClose;
    }
    
//    }else{
//        //当前处于关闭状态
//        //在以下代码设置关闭状态的HeadView
//        headShowModel.isOpen = NO;
//        headShowModel.name = headShowModel.nameOpen;
//    }
//    
//    //NSLog(@"section is %lu", (unsigned long)section);
    //进行刷新操作
    [_collectionView reloadData];
}

- (void)customHideCellClick : (HeadHideReusableView *)customCell sectionIndex : (NSUInteger)section
{
    NSLog(@">>>>> the section is %lu", (unsigned long)section);
    HeadShowModel *headShowModel = _headShowModels[section];
//    if (headShowModel.isOpen == NO) {
//        //当前处于打开状态
//        //在以下代码设置打开状态的HeadView
//        headShowModel.isOpen = YES;
//        headShowModel.name = headShowModel.nameClose;
//        
//    }else{
//        //当前处于关闭状态
//        //在以下代码设置关闭状态的HeadView
//        headShowModel.isOpen = NO;
//        headShowModel.name = headShowModel.nameOpen;
//    }
    
    if (headShowModel.isOpen == YES) {
        //当前处于关闭状态
        //在以下代码设置关闭状态的HeadView
        headShowModel.isOpen = NO;
        headShowModel.name = headShowModel.nameOpen;
    }
    
    //NSLog(@"section is %lu", (unsigned long)section);
    //进行刷新操作
    [_collectionView reloadData];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





































@end
