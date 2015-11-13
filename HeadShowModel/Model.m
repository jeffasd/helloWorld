//
//  Model.m
//  test_02
//
//  Created by admin on 15/10/15.
//  Copyright © 2015年 admin. All rights reserved.
//

#import "Model.h"

@implementation Model

//// 合成指令，主动指定属性使用的成员变量名称
@synthesize image = _image;

- (UIImage *)image
{
    if (_image == nil) {
        _image = [UIImage imageNamed:self.nameOpen];
    }
    return _image;
}


- (instancetype)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
//        //用字典给属性赋值
        self.name = dict[@"name"];
        self.nameOpen = dict[@"nameOpen"];
        self.nameClose = dict[@"nameClose"];
        self.isOpen = [(NSNumber *)dict[@"isOpen"] boolValue];
//
//        //使用KVC赋值
//        [self setValue:dict[@"name"] forKeyPath:@"name"];
//        [self setValue:dict[@"isOpen"] forKeyPath:@"isOpen"];
        
 //       [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)headInfoWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

+ (NSArray *)modelList
{
//    NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"点击打开二级目录", @"name",NO,@"isOpen", nil];
//    NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"第2个", @"name",NO,@"isOpen", nil];
    
//    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil]];

   // [[NSBundle mainBundle] pathForResource:@"sectionHeadName.plist" ofType:nil]
    
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sectionHeadName.plist" ofType:nil]];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    //遍历数组，依次转模型
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self headInfoWithDict:dict]];
    }
    return arrayM;
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {name : %@, nameOpen : %@, nameClose : %@, isOpen : %d}", self.class, self,self.name, self.nameOpen, self.nameClose, self.isOpen];
}

@end
