//
//  ZFTabBarController.m
//  Three
//
//  Created by michael on 2016/12/9.
//  Copyright © 2016年 Michael. All rights reserved.
//

#import "ZFTabBarController.h"
#import "ZFChatViewController.h"
#import "ZFFindViewController.h"
#import "ZFMeViewController.h"

@interface ZFTabBarController ()

@end

@implementation ZFTabBarController

+ (void)initialize {
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    
    NSMutableDictionary *selecetedAttrs = [NSMutableDictionary dictionary];
    selecetedAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    selecetedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selecetedAttrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupChild:[[ZFChatViewController alloc] init] title:@"Chat" image:@"tabBar_chat_icon" selectedImage:@"tabBar_chat_click_icon"];
    [self setupChild:[[ZFFindViewController alloc] init] title:@"Find" image:@"tabBar_find_icon" selectedImage:@"tabBar_find_click_icon"];
    [self setupChild:[[ZFMeViewController alloc] init] title:@"Me" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon"];
    
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar-light"]];
}

- (void)setupChild:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:image];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
