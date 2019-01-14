//
//  ViewController.m
//  BoardGamesItems
//
//  Created by 锋子 on 2018/12/10.
//  Copyright © 2018 锋子. All rights reserved.
//

#import "ViewController.h"
#import "KKIudgeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    IudgeViewController *cotent=[[IudgeViewController alloc]init];
//    //创建动画
//    CATransition *animation = [CATransition animation];
//    //设置运动轨迹的速度
////    animation.timingFunction = UIViewAnimationCurveEaseInOut;
//    //设置动画类型为立方体动画
////    animation.type = @"cube";
//    //设置动画时长
//    animation.duration =0.1f;
//    //设置运动的方向
//    animation.subtype =kCATransitionFade;
//    //控制器间跳转动画
//    [[UIApplication sharedApplication].keyWindow.layer addAnimation:animation forKey:nil];
//    [self presentViewController:cotent animated:NO completion:nil];
    KKIudgeViewController * iudgevc = [[KKIudgeViewController alloc]init];
    KEY_WINDOW.rootViewController = iudgevc;
    
}


@end
