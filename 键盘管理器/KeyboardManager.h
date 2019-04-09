//
//  KeyboardManager.h
//  键盘管理器
//
//  Created by 郭朝顺 on 2018/6/25星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyboardManager : NSObject

+ (instancetype) sharedManager ;

@property (nonatomic,assign) CGFloat keyboardDistanceFromTextField ;


@end
