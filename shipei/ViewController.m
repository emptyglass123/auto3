
//
//  ViewController.m
//  autolayoutDemo
//
//  Created by Mac on 15-6-30.
//  Copyright (c) 2015年 朱辉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 
 viewDidLoad 方法中简单实现了两个view的 autolayout使用
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  greenColor];
    
    UIView  *firstView = [[UIView alloc] init];
    firstView.backgroundColor = [UIColor redColor];
    firstView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:firstView];
    
    
    UIView *secondView = [[UIView alloc] init];
    secondView.backgroundColor = [UIColor blueColor];
    secondView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view  addSubview:secondView];
    
    
    //为firstView 添加约束
    /**
     
     1.添加firstView的高度约束
     翻译:firstView 的高度 == 40 不依赖于其他控件
     
     */
    NSLayoutConstraint *firstView_Height = [NSLayoutConstraint constraintWithItem:firstView
                                                                        attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:40.0];
    [firstView addConstraint:firstView_Height];
    
    /**
     2.添加firstView的宽度约束
     翻译:firstView 的宽度 == 200 不依赖于其他控件
     */
    NSLayoutConstraint *firstView_Weight = [NSLayoutConstraint constraintWithItem:firstView
                                                                        attribute:
                                            NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200.0];
    [firstView addConstraint:firstView_Weight];
    
    /**
     
     3.添加firstView的水平约束
     翻译:firstView 的款度 == 70 依赖于(相对于)self.view
     
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:firstView
                                                          attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view     attribute:NSLayoutAttributeLeft multiplier:2.0 constant:70]];
    /**
     
     4.添加firstView的垂直方向约束
     翻译:firstView 的款度 == 60 依赖于(相对于)self.view
     
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:firstView
                                                          attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view     attribute:NSLayoutAttributeLeft multiplier:2.0 constant:60]];
    
    
    /**
     
     5.添加firstView的右边约束
     翻译:firstView 右边 == 60 依赖于(相对于)self.view
     
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:firstView
                                                          attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view     attribute:NSLayoutAttributeRight multiplier:1.0 constant:-60]];
    
    
    
    
    
    //为secondView 添加约束
    
    /**
     
     1.添加secondView的宽度约束
     翻译:secondView 的款度 == 200 不依赖于其他控件
     
     */
    
    [secondView addConstraint:[NSLayoutConstraint constraintWithItem:secondView
                                                           attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200]];
    /**
     
     2.添加secondView的高度约束
     翻译:secondView 的款度 == 30 不依赖于其他控件
     
     */
    
    [secondView addConstraint:[NSLayoutConstraint constraintWithItem:secondView
                                                           attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30]];
    /**
     
     3.添加secondView的 相对约束
     翻译: secondView的右边 到 firstView的右边 距离是0
     
     */
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:secondView
                                                          attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:firstView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0]];
    
    
    /**
     4.让红色高度 == 蓝色高度
     */
    NSLayoutConstraint *redHeight = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:firstView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0.0];
    [self.view addConstraint:redHeight];
    
    /**
     5.让红色顶部 == 蓝色底部 + 间距
     */
    NSLayoutConstraint *redTop = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:firstView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:1];
    [self.view addConstraint:redTop];
    
    /**
     6.让红色宽度 == 蓝色宽度 * 0.5
     */
    NSLayoutConstraint *redWidth = [NSLayoutConstraint constraintWithItem:secondView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:firstView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0.0];
    [self.view addConstraint:redWidth];
    
    
    
    
}
/**
 实现了autolayout的另外一种写法
 
 
 **/
-(void)autolayoutTwo
{
    
    
    //添加第一个按钮
    UIButton *btn1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btn1 setTitle:@"Click Me" forState:UIControlStateNormal];
    
    [btn1 setTranslatesAutoresizingMaskIntoConstraints:NO];
    btn1.backgroundColor = [UIColor  redColor];
    //标记是否自动布局
    [self.view addSubview:btn1];
    
    
    //添加第二个按钮
    UIButton *btn2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btn2 setTitle:@"Click Me Please" forState:UIControlStateNormal];
    
    [btn2 setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    btn2.backgroundColor = [UIColor  greenColor];
    //标记是否自动布局
    [self.view addSubview:btn2];
    
    
    
    NSDictionary *views=NSDictionaryOfVariableBindings(btn1,btn2);
    
    
    
    
    
    
    [self.view addConstraints:
     // H=Horizontal，水平方向，同时设定控件宽度
     // X= 0, 宽度 = 200
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(==20)-[btn1(200)]"
      
                                             options:0
                                             metrics:nil
                                               views:views]];
    
    [self.view addConstraints:
     // V=Vertical,垂直方向，同时设定控件高度
     // Y= 60 高度 = 30
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(==60)-[btn1(30)]"
                                             options:0
                                             metrics:nil
                                               views:views]];
    
    [self.view addConstraints:
     
     [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(30)-[btn2(==200)]"
                                             options:0
                                             metrics:nil
                                               views:views]];
    
    
    [self.view addConstraints:
     
     [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=120)-[btn2(==btn1)]"                             options:0
      
                                             metrics:nil
      
                                               views:views] ];
    
    //注意AddConstraints和AddConstraint之间的区别，一个添加的参数是(NSArray *)，一个是(NSLayoutConstraint *)
    
    [self.view addConstraint:
     [NSLayoutConstraint constraintWithItem:btn2
      
                                  attribute:NSLayoutAttributeLeft
      
                                  relatedBy:NSLayoutRelationEqual
      
                                     toItem:btn1
      
                                  attribute:NSLayoutAttributeRight
      
                                 multiplier:9
      
                                   constant:200]];
    //
    //    [self.view addConstraint:
    //
    //     [NSLayoutConstraint constraintWithItem:btn2
    //
    //                                  attribute:NSLayoutAttributeTop
    //
    //      //要设定的属性
    //
    //                                  relatedBy:NSLayoutRelationGreaterThanOrEqual
    //
    //      //大于还是小于相对的View的值
    //
    //                                     toItem:btn1
    //
    //      //相对于某个View或者控件
    //
    //                                  attribute:NSLayoutAttributeTop
    //
    //      //指定要设定的关联View的属性
    //
    //                                 multiplier:1   //因子值
    //
    //                                   constant:0]];
    
    
    
    NSLog(@"hah ");
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
