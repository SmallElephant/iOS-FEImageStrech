//
//  ViewController.m
//  iOS-FEImageStrechDemo
//
//  Created by keso on 16/1/13.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadImageFromAssets];
    [self loadImageBeforeIOS5];
    [self loadImageIOS5];
    [self loadImageAfterIOS6];
    [self loadPersonInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buttonPressed:(UIButton *)sender{
    NSLog(@"博客园-FlyElephant");
    NSLog(@"原文链接:http://www.cnblogs.com/xiaofeixiang/");
}

#pragma mark - UIImageStrech
//Asset中设置拉伸区域
-(void)loadImageFromAssets{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(80, 100, 100, 40)];
    UIImage *buttonImage = [UIImage imageNamed:@"Question"];
    [button setTitle:@"默认" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents: UIControlEventTouchUpInside];
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self.view addSubview:button];
}
//iOS5以前设置拉伸图片
-(void)loadImageBeforeIOS5{
    //35*30
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 180, 100, 40)];
    [nextButton setTitle:@"iOS5之前" forState:UIControlStateNormal];
    nextButton.layer.borderColor=[[UIColor redColor] CGColor];
    nextButton.layer.borderWidth=1.0f;
    UIImage *image = [UIImage imageNamed:@"Question"];
    // 设置左边端盖宽度  rightCap=width - leftCapWidth - 1
    NSInteger leftCapWidth = image.size.width * 0.5;
    // 设置上边端盖高度  bottom=height - topCapWidth - 1
    NSInteger topCapHeight = image.size.height * 0.5;
    UIImage *newImage = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    [nextButton setBackgroundImage:newImage forState:UIControlStateNormal];
    [self.view addSubview:nextButton];
}
//iOS5 拉伸图片
-(void)loadImageIOS5{
     UIImage *image = [UIImage imageNamed:@"Question"];
    UIButton  *resizableButton=[[UIButton alloc]initWithFrame:CGRectMake(80, 250, 100, 40)];
    [resizableButton setTitle:@"iOS5" forState:UIControlStateNormal];
    // 设置端盖的值
    CGFloat top = image.size.height * 0.5;
    CGFloat left = image.size.width * 0.5;
    CGFloat bottom = image.size.height * 0.5;
    CGFloat right = image.size.width * 0.5;
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(top, left, bottom, right);
    
    // 拉伸图片
    UIImage *edgeImage = [image resizableImageWithCapInsets:edgeInsets];
    
    // 设置按钮的背景图片
    [resizableButton setBackgroundImage:edgeImage forState:UIControlStateNormal];
    [self.view addSubview:resizableButton];
}
//iOS6 拉伸图片
-(void)loadImageAfterIOS6{
    UIImage *image = [UIImage imageNamed:@"Question"];
    UIButton  *resizableButtonMode=[[UIButton alloc]initWithFrame:CGRectMake(80, 320, 180, 40)];
    [resizableButtonMode setTitle:@"iOS6" forState:UIControlStateNormal];
    [resizableButtonMode addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    // 设置上左下右边距
    CGFloat topMode= image.size.height * 0.5;
    CGFloat leftMode= image.size.width * 0.5;
    CGFloat bottomMode= image.size.height * 0.5;
    CGFloat rightMode= image.size.width * 0.5;
    
    UIEdgeInsets edgeInsetsMode= UIEdgeInsetsMake(topMode, leftMode, bottomMode, rightMode);
    
    // 拉伸图片
    UIImage *edgeModeImage = [image resizableImageWithCapInsets:edgeInsetsMode resizingMode:UIImageResizingModeStretch];
//    UIImage *edgeModeImage = [image resizableImageWithCapInsets:edgeInsetsMode resizingMode:UIImageResizingModeTile];
    
    //设置图片
    [resizableButtonMode setBackgroundImage:edgeModeImage forState:UIControlStateNormal];
    [self.view addSubview:resizableButtonMode];
}

-(void)loadPersonInfo{
    UILabel  *label=[[UILabel alloc]initWithFrame:CGRectMake(80, 380, 300, 20)];
    [label setFont:[UIFont systemFontOfSize:14]];
    [label setText:@"博客园-FlyElephant"];
    [self.view addSubview:label];
    
    UILabel  *urlLabel=[[UILabel alloc]initWithFrame:CGRectMake(80, 400, 300, 30)];
    [urlLabel setFont:[UIFont systemFontOfSize:14]];
    [urlLabel setText:@"http://www.cnblogs.com/xiaofeixiang/"];
    [self.view addSubview:urlLabel];
}

@end
