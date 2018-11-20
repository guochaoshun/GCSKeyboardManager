//
//  NSArray+log.h
//  demo1
//
//  Created by ly on 16/9/1.
//  Copyright © 2016年 ly. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>


#define Screen_Width [UIScreen mainScreen].bounds.size.width
#define Screen_Height [UIScreen mainScreen].bounds.size.height

@interface NSArray (log)

@end

@interface NSDictionary (Log)

@property (nonatomic,readonly,copy) NSString * jsonDescription ;

@end



/**
 *  uiview 设置frame
 */

@interface UIView (Layout)


@property (assign, nonatomic) CGFloat    x;
@property (assign, nonatomic) CGFloat    y;
@property (assign, nonatomic) CGFloat    maxX;
@property (assign, nonatomic) CGFloat    maxY;
@property (assign, nonatomic) CGPoint    origin;

@property (assign, nonatomic) CGFloat    centerX;
@property (assign, nonatomic) CGFloat    centerY;

@property (assign, nonatomic) CGFloat    width;
@property (assign, nonatomic) CGFloat    height;
@property (assign, nonatomic) CGSize     size;

@property (assign, nonatomic) IBInspectable CGFloat cornerRadius ;

@end
