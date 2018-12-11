//
//  JSClassModel.h
//  JSHeartDiary
//
//  Created by 锋子 on 2018/12/3.
//  Copyright © 2018 锋子. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSFastLoginModel.h"
#import "JSLocalStorageKit.h"

@interface JSClassModel : NSObject

@property (strong, nonatomic) NSMutableArray <JSFastLoginModel *> * userInfoArray;

/*!
游戏名称
 */
@property(copy,nonatomic) NSString * class_name;
/*!
 游戏简介
 */
@property(copy,nonatomic) NSString * class_describe;
/*!
 游戏选择
 */
@property(copy,nonatomic) NSString * class_isSelect;
/*!
游戏图片名称
 */
@property(copy,nonatomic) NSString * class_image;

/*!
 游戏分数信息
 */
@property(strong,nonatomic) NSMutableArray<JSFastLoginModel*> * numberArr;


- (instancetype)init;

- (void)encodeWithCoder:(NSCoder *)aCoder;

- (instancetype)initWithCoder:(NSCoder *)aDecoder;



@end

