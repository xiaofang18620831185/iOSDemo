//
//  ViewController.m
//  MediumFont
//
//  Created by 杜晓星 on 2017/5/1.
//  Copyright © 2017年 杜晓星. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lableLContraint;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat fontSize = 60;
    
    NSString *text = @"Google";
    UILabel *normalLabel = [self labelWithFont:[UIFont systemFontOfSize:fontSize] text:text];
    UILabel *boldLabel = [self labelWithFont:[self boldFont:fontSize] text:text];
    UILabel *mediumLabel = [self labelWithFont:[self mediumFont:fontSize] text:text];
    
    UIView *contentView = self.view;
    
    [contentView addSubview:normalLabel];
    [contentView addSubview:boldLabel];
    [contentView addSubview:mediumLabel];
    
    
    CGFloat x = 80;
    self.lableLContraint.constant = x;
    normalLabel.frame = CGRectMake(x, x*1, 0, 0);
    mediumLabel.frame = CGRectMake(x, x*2, 0, 0);
    boldLabel.frame = CGRectMake(x, x*3, 0, 0);
    
    [normalLabel sizeToFit];
    [boldLabel sizeToFit];
    [mediumLabel sizeToFit];
    
}

// 设置 MediumFont
- (UIFont*)mediumFont:(CGFloat)size {
#warning UIFontWeightMedium NS_AVAILABLE_IOS(8_2)
    UIFont *font = [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    return font;
//    CGFloat systemVersion = [UIDevice currentDevice].systemVersion.floatValue;
//    if (systemVersion >= 9.0f) {
//#warning UIFontWeightMedium NS_AVAILABLE_IOS(8_2)
//        UIFont *font = [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
//        return font;
//    }else{
//        /*
//         Helvetica-Bold,
//         Helvetica,
//         Helvetica-LightOblique,
//         Helvetica-Oblique,
//         Helvetica-BoldOblique,
//         Helvetica-Light
//        */
//        UIFont *font =  [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
//        return font;
//    }
}

// 设置 BoldFont
- (UIFont*)boldFont:(CGFloat)size {
    UIFont *font = [UIFont boldSystemFontOfSize:size];
    return font;
}

- (UILabel *)labelWithFont:(UIFont*)font text:(NSString*)text {
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectZero];
    label.text = text;
    label.font = font;
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor greenColor];
    return label;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
