//
//  CustomCollectionViewCell.m
//  collection_second_list
//
//  Created by admin on 15/10/16.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@interface CustomCollectionViewCell()




@end

@implementation CustomCollectionViewCell

- (UILabel *)label
{
    if (_label == nil) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}



-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.label.frame =CGRectMake(0, 20, frame.size.width, 30);
        //self.label.frame = frame;
        //_label.backgroundColor = [UIColor redColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_label];
    }
    return self;
}


                
@end
