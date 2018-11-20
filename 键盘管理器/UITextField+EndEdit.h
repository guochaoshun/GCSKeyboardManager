//
//  UITextField+EndEdit.h
//  MeiYeC
//
//  Created by 郭朝顺 on 2018/4/27星期五.
//  Copyright © 2018年 ZWYLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIToolbar (EndEditView)

+ (UIToolbar *) defaultEndEditViewToolbar ;

@end


@interface UITextField (EndEdit)

@property (nonatomic, assign) IBInspectable BOOL showToolView;

@end

@interface UITextView (EndEdit)

@property (nonatomic, assign) IBInspectable BOOL showToolView;

@end
