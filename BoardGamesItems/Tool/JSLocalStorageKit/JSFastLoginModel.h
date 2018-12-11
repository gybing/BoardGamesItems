//
//  JSFastLoginModel.h
//  MatchingPlatform
//
//  Created by nuomi on 2016/12/19.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSFastLoginModel : NSObject<NSCoding>

/*!
 日记图片名称
 */
@property(copy,nonatomic) NSString * class_image;
/*!
 添加时间年月
 */
@property(copy,nonatomic) NSString* class_year;

/*!
 添加时间日
 */
@property(copy,nonatomic) NSString* class_day;

/*!
 添加时间小时分钟
 */
@property(copy,nonatomic) NSString* class_hour;

/*!
 添加时间周
 */
@property(copy,nonatomic) NSString* class_week;
/*!
 添加内容
 */
@property(copy,nonatomic) NSString* class_number;
/*!
 x游戏名称
 */
@property(copy,nonatomic) NSString* class_name;
/*!
 x备注
 */
@property(copy,nonatomic) NSString* class_note;
/*!
 x是否是加分
 */
@property(copy,nonatomic) NSString* class_isAdd;


- (instancetype)init;
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (instancetype)initWithCoder:(NSCoder *)aDecoder;

@end
