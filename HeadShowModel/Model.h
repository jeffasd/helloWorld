//
//  Model.h
//  test_02
//
//  Created by admin on 15/10/15.
//  Copyright © 2015年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface Model : NSObject

//每个Section的标题
/**
 @property
 
 1. 生成getter方法
 2. 生成setter方法
 3. 生成带下划线的成员变量（记录属性内容）
 
 readonly的属性不会生成带下划线的成员变量！
 */


@property(nonatomic, copy)NSString *name;
@property(nonatomic, copy)NSString *nameOpen;
@property(nonatomic, copy)NSString *nameClose;

@property(nonatomic, strong, readonly)UIImage *image;

//第一级目录的闭合与打开控制标志
@property(nonatomic, assign)BOOL isOpen;

+ (NSArray *)modelList;

@end
