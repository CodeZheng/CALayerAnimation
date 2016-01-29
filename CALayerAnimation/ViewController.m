//
//  ViewController.m
//  CALayerAnimation
//
//  Created by admin on 1/20/16.
//  Copyright © 2016 zhengxinxin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //初始化
    CALayer *kkLayer1 = [[CALayer alloc]init];
    kkLayer1.backgroundColor = [[UIColor grayColor]CGColor];
    kkLayer1.frame = CGRectMake(50, 50, 40, 40);
    // 设定它的frame
    kkLayer1.cornerRadius = 5;// 圆角处理
//    [self.view.layer addSublayer:kkLayer1]; // 增加到UIView的layer上面
    // 移动kkLayer的position
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:kkLayer1.position];
    CGPoint toPoint = kkLayer1.position; toPoint.x += 180;
    animation.toValue = [NSValue valueWithCGPoint:toPoint];
    animation.autoreverses = YES;
    animation.duration = 5;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = NSNotFound;
    
    CALayer *kkLayer2 = [[CALayer alloc]init];
    kkLayer2.backgroundColor = [[UIColor redColor]CGColor];
    kkLayer2.frame = CGRectMake(50, 100, 40, 40);
    // 设定它的frame
    kkLayer2.cornerRadius = 5;// 圆角处理
    [self.view.layer addSublayer:kkLayer2]; // 增加到UIView的layer上面
    // 以x轴进行旋转
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"]; rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:6.0 * M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.duration = 3;
    rotateAnimation.fillMode = kCAFillModeForwards;
    rotateAnimation.repeatCount = NSNotFound;
    
    CALayer *kkLayer3 = [[CALayer alloc]init];
    kkLayer3.backgroundColor = [[UIColor blueColor]CGColor];
    kkLayer3.frame = CGRectMake(50, 150, 40, 40);
    // 设定它的frame
    kkLayer3.cornerRadius = 5;// 圆角处理
    [self.view.layer addSublayer:kkLayer3]; // 增加到UIView的layer上面
    // 对kkLayer进行放大缩小
    CABasicAnimation *scaoleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"]; scaoleAnimation.duration = 3;
    scaoleAnimation.autoreverses = YES;
    scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaoleAnimation.toValue = [NSNumber numberWithFloat:2.5];
    scaoleAnimation.fillMode = kCAFillModeForwards;
    scaoleAnimation.repeatCount = NSNotFound;
    
    CALayer *animationLayer = [[CALayer alloc]init];
    animationLayer.backgroundColor = [[UIColor greenColor]CGColor];
    animationLayer.frame = CGRectMake(50, 200, 40, 40);
    // 设定它的frame
    animationLayer.cornerRadius = 5;// 圆角处理
    [self.view.layer addSublayer:animationLayer]; // 增加到UIView的layer上面
    // 把上面的动画组合起来
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.autoreverses = YES;
    // 完成后反向完成
    group.duration = 3.0;
    group.animations = [NSArray arrayWithObjects:animation,rotateAnimation, scaoleAnimation, nil]; group.repeatCount = NSNotFound;
    // PS:动画结束以后，他会返回到自己原来的frame，如果不想到原来frame我们需要设定
    group.fillMode = kCAFillModeForwards;
    
//    [kkLayer1 addAnimation:animation forKey:@"kkLayer1Move"];
    [kkLayer2 addAnimation:rotateAnimation forKey:@"kkLayer2Move"];
    [kkLayer3 addAnimation:scaoleAnimation forKey:@"kkLayer3Move"];
    [animationLayer addAnimation:group forKey:@"groupMove"];
    
    NSDate *date = [NSDate date];
    NSString *str = [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
    CGFloat f = [date timeIntervalSince1970];
    NSDate *dateN = [NSDate dateWithTimeIntervalSince1970:f];
    NSLog(@"%@---time =%@",str,dateN);

    [UIView animateWithDuration:0.5 animations:^{
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
