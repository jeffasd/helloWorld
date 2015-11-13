//
//  HeadShowReusableView.m
//  collection_second_list
//
//  Created by admin on 15/10/16.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "HeadShowReusableView.h"

@interface HeadShowReusableView()

@property(nonatomic, strong)UIButton *btn;


@end

@implementation HeadShowReusableView


- (UIButton *)btn
{
    if (_btn == nil) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _btn;
}

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
        //NSLog(@"the frame is %@", NSStringFromCGRect(frame));
        
        self.btn.frame = self.bounds;
        _btn.backgroundColor = [UIColor cyanColor];
        [self addSubview:_btn];
        
        NSUInteger y = frame.size.height / 3.3;
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, y, frame.size.width, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
        //_label.backgroundColor = [UIColor redColor];
        //        NSLog(@"the text is %@",_headModel.name);
        [self addSubview:_label];
        
        [_btn addTarget:self action:@selector(doSelected) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSLog(@"sfsdf");
    
}

- (void)doSelected
{
    //[self.delegate respondsToSelector:@selector(customCellClick:sectionIndex:)];
    if ([self.delegate respondsToSelector:@selector(customShowCellClick:sectionIndex:)]) {
        [self.delegate customShowCellClick:self sectionIndex:_section];
    }
}

















@end
