//
//  AddNumberViewController.h
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddNumberViewController : UIViewController

typedef void (^ReturnAddBlock) (JSFastLoginModel * addModel);

@property(nonatomic, copy) ReturnAddBlock returnAddBlock;

@end

NS_ASSUME_NONNULL_END
