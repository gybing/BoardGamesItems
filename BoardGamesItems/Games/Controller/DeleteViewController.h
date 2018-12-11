//
//  DeleteViewController.h
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DeleteViewController : UIViewController

@property (nonatomic,strong) JSFastLoginModel * model;

typedef void (^ReturnDeleteBlock) (void);

@property(nonatomic, copy) ReturnDeleteBlock returnDeleteBlock;

@end

NS_ASSUME_NONNULL_END