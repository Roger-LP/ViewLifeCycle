//
//  ViewController.m
//  ViewLifeCycle
//
//  Created by 罗平 on 2019/4/17.
//  Copyright © 2019 Roger. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"
@interface ViewControllerA ()

@end

@implementation ViewControllerA

//创建或加载一个View并把它复制给UIViewController的view的属性
-(void)loadView{
    [super loadView];
     NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}

//此时整个视图层次(view hierarchy)已经放到内存中，可以移除一些视图，修改约束，加载数据等
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
    NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}

//视图加载完成，并即将显示在屏幕上。还没设置动画，可以改变当前屏幕方向或者状态栏的风格
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}

//视图已经展示在屏幕上，可以对视图做一些关于展示效果方面的修改
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
     NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}

//视图即将消失
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}

//视图已经消失
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}

//视图销户的时候调用
-(void)dealloc{
    NSLog(@"ViewControllerA--------%s", __PRETTY_FUNCTION__);
}


-(void)configUI{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setTitle:@"跳转" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnClick:(UIButton *)sender {
    ViewControllerB *vc1 = [[ViewControllerB alloc]init];
    [self.navigationController pushViewController:vc1 animated:YES];
//    [self presentViewController:vc1 animated:YES completion:nil];
}

@end
