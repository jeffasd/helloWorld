//
//  HeadHideReusableView.h
//  collection_second_list
//
//  Created by admin on 15/10/16.
//  Copyright © 2015年 admin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "HeadShowModel.h"

//delegate
@class HeadHideReusableView;
@protocol HeadHideReusableViewDelegate <NSObject>

@optional
- (void)customHideCellClick : (HeadHideReusableView *)customCell sectionIndex : (NSUInteger)section;

@end


@interface HeadHideReusableView : UICollectionReusableView

@property(nonatomic, strong)id<HeadHideReusableViewDelegate> delegate;
@property(nonatomic, strong)HeadShowModel *headShowModel;
@property(nonatomic, assign)NSUInteger section;

@end
