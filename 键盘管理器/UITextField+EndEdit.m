//
//  UITextField+EndEdit.m
//  MeiYeC
//
//  Created by 郭朝顺 on 2018/4/27星期五.
//  Copyright © 2018年 ZWYLian. All rights reserved.
//

#import "UITextField+EndEdit.h"


@implementation UIToolbar (EndEditView)

+ (UIToolbar *) defaultEndEditViewToolbar {
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 0, 40)];
    [topView setBarStyle:UIBarStyleDefault];//设置为默认的风格白色
    UIBarButtonItem * helloButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:topView action:@selector(gcs_dismissKeyBoard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:helloButton,btnSpace,doneButton,nil];
    [topView setItems:buttonsArray];
    return topView ;
}

- (void)gcs_dismissKeyBoard {
    [ UIApplication.sharedApplication.keyWindow  endEditing:YES];
}


@end

@implementation UITextField (EndEdit)

- (void)setShowToolView:(BOOL)showToolView {
    if (showToolView) {
        
        [self setInputAccessoryView: [UIToolbar defaultEndEditViewToolbar] ];//键盘上加这个视图

    } else {
        self.inputAccessoryView = nil ;
    }
    
    
}

- (BOOL)showToolView {
    
    if (self.inputAccessoryView) {
        return YES ;
    } else {
        return NO ;
    }
    
    
}




@end



@implementation UITextView (EndEdit)

- (void)setShowToolView:(BOOL)showToolView {
    if (showToolView) {
        
        [self setInputAccessoryView: [UIToolbar defaultEndEditViewToolbar] ];//键盘上加这个视图
    } else {
        self.inputAccessoryView = nil ;
    }
    
    
}

- (BOOL)showToolView {
    
    if (self.inputAccessoryView) {
        return YES ;
    } else {
        return NO ;
    }
    
}


@end




