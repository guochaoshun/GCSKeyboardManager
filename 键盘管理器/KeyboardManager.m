//
//  KeyboardManager.m
//  键盘管理器
//
//  Created by 郭朝顺 on 2018/6/25星期一.
//  Copyright © 2018年 乐乐. All rights reserved.
//

#import "KeyboardManager.h"
#import "NSArray+log.h"
@implementation KeyboardManager

+ (instancetype)sharedManager {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc]init];
    });
    return _sharedInstance ;
}

- (instancetype)init {
    
    
    if (self = [super init]) {
        
        
        self.keyboardDistanceFromTextField = 10.0 ;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
        
    }
    
    return self ;
    
}

- (void)keyboardWillShow:(NSNotification *)noti {
    
    NSDictionary *userInfo = noti.userInfo;
    UIView * inputView =  [self getFirstResponder] ;
    NSTimeInterval time = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];
    CGRect keboard = [userInfo[@"UIKeyboardBoundsUserInfoKey"] CGRectValue];
    CGFloat kbHeight = keboard.size.height;
    
    UIViewController * vc = [self getViewControllerWithInputView:inputView];

    CGPoint point =  [vc.view convertPoint:inputView.origin fromView:inputView.superview];

    CGFloat inputViewMaxY = inputView.height + point.y ;
    CGFloat keyboardMinY = Screen_Height - kbHeight - self.keyboardDistanceFromTextField ;
    if (inputViewMaxY < keyboardMinY ) {
        return ;
    }
    
    // 被盖住的高度
    CGFloat moveHeight = inputViewMaxY  - keyboardMinY ;
    
    UIScrollView * superScrollView = [self getInputSuperView:inputView];
    if (superScrollView) {
        moveHeight -= superScrollView.contentOffset.y;
    }
    NSLog(@"%@ -- %@ -- %@ ",vc,vc.view,superScrollView);
    
    [UIView animateWithDuration:time animations:^{
        if (superScrollView) {
            CGPoint oldPoint = superScrollView.contentOffset;
            [superScrollView setContentOffset:CGPointMake(oldPoint.x, oldPoint.y+moveHeight)];
        } else {
            vc.view.y = -moveHeight ;
        }
    }];
}
- (void)keyboardDidShow:(NSNotification *)noti {
    
}
- (void)keyboardWillHide:(NSNotification *)noti {
    NSDictionary *userInfo = noti.userInfo;
    UIView * inputView =  [self getFirstResponder] ;

    NSTimeInterval time = [userInfo[@"UIKeyboardAnimationDurationUserInfoKey"] doubleValue];

    UIViewController * vc = [self getViewControllerWithInputView:inputView];
    
    UIScrollView * superScrollView = [self getInputSuperView:inputView];

    [UIView animateWithDuration:time animations:^{
        if (superScrollView) {
            // 好像不用做什么处理,系统会自动给处理到一个合适的高度,超出部分会自动回弹
        } else {
            vc.view.y = 0 ;
        }
    }];
    
}
- (void)keyboardDidHide:(NSNotification *)noti {
    
}

// 找到第一响应 , textfield  textview
- (UIView *)getFirstResponder {
    UIWindow * window =  [UIApplication sharedApplication].keyWindow ;
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    UIView * inputView = [window performSelector:@selector(firstResponder)];
#pragma clang diagnostic pop
    
    NSLog(@"%@",inputView);
    return inputView ;

}
// 显示textfield  textview的ViewController
-(UIViewController*)getViewControllerWithInputView:(UIView *)inputView
{
    UIResponder *nextResponder = inputView;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder);
    
    return nil;
}


- (UIScrollView *)getInputSuperView:(UIView *)inputView {
    while (inputView.superview) {
        if ([inputView.superview isKindOfClass:[UIScrollView class]]) {
            return (UIScrollView *)inputView.superview;
        }
        inputView = inputView.superview;
    }
    return nil;
}



@end
