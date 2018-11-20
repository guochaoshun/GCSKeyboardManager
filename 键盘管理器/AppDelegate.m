//
//  AppDelegate.m
//  键盘管理器
//
//  Created by 郭朝顺 on 2018/6/25星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "AppDelegate.h"
#import "KeyboardManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window.backgroundColor = [UIColor orangeColor] ;

    [KeyboardManager sharedManager] ;
    
    


    return YES;
}


@end
