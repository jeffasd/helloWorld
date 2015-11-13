//
//  HeadShowReusableView.h
//  collection_second_list
//
//  Created by admin on 15/10/16.
//  Copyright © 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeadShowModel.h"


//delegate
@class HeadShowReusableView;
@protocol HeadShowReusableViewDelegate <NSObject>

@optional
- (void)customShowCellClick : (HeadShowReusableView *)customCell sectionIndex : (NSUInteger)section;

@end


@interface HeadShowReusableView : UICollectionReusableView

@property(nonatomic, strong)HeadShowModel *headShowModel;
@property(nonatomic, assign)NSUInteger section;
@property(nonatomic, strong)UILabel *label;

@property(nonatomic,weak)id<HeadShowReusableViewDelegate> delegate;

@end
