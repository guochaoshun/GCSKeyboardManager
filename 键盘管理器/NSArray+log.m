//
//  NSArray+log.m
//  demo1
//
//  Created by ly on 16/9/1.
//  Copyright © 2016年 ly. All rights reserved.
//

#import "NSArray+log.h"

/**
 *  集合类型打log
 */
@implementation NSArray (log)

- (NSString *)description{
    return [self descriptionWithLocale:nil];
}

- (NSString *)descriptionWithLocale:(id)locale{
    NSMutableString * string = [[NSMutableString alloc]init];
    [string appendString:@"[\n"];
    for (int i = 0; i < self.count; i++) {
        [string appendFormat:@"\t第%d个 -- %@ \n",i,self[i] ];
    }
    [string stringByAppendingString:@"]\n"];
    return string;
}


@end



@implementation NSDictionary (Log)

- (NSString *)jsonDescription {
    // 参考了此博客 https://www.jianshu.com/p/f14b4cb1435b .
    // NSString默认使用的是UTF-16,转出UTF-8就能打印了
    NSError * error = nil ;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {
        NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
        [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            [strM appendFormat:@"\t%@ = %@ ;\n", key, obj];
        }];
        [strM appendString:@"}\n"];
        return strM;
        
    }
    
    NSString *newString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    newString = [newString stringByReplacingOccurrencesOfString:@"\\" withString:@""] ;
    return newString ;
}

- (NSString *)description{
    return [self descriptionWithLocale:nil];
}

- (NSString *)descriptionWithLocale:(id)locale
{

    
    // 原来的写法,格式上有点问题,但是转中文是没问题的
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];

    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@ ;\n", key, obj];
    }];

    [strM appendString:@"}\n"];

    return strM;
}

@end




/**
 *  uiview  frame 设置
 */


@implementation UIView (Layout)


@dynamic width;
@dynamic height;

@dynamic size;

@dynamic x;
@dynamic y;

@dynamic maxX;
@dynamic maxY;



- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setX:(CGFloat)value
{
    CGRect frame = self.frame;
    frame.origin.x = value;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setY:(CGFloat)value
{
    CGRect frame = self.frame;
    frame.origin.y = value;
    self.frame = frame;
}
- (CGFloat)maxX
{
    return self.frame.origin.x + self.frame.size.width ;
}
- (void)setMaxX:(CGFloat)maxX {
    CGRect frame = self.frame;
    frame.origin.x = maxX-frame.size.width;
    self.frame = frame;
}

- (CGFloat)maxY
{
    return self.frame.origin.y + self.frame.size.height;
}
- (void)setMaxY:(CGFloat)maxY {
    CGRect frame = self.frame;
    frame.origin.y = maxY-frame.size.height;
    self.frame = frame;

}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
    
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setCornerRadius:(CGFloat)cornerRadius
{
    self.layer.cornerRadius = cornerRadius ;
    self.clipsToBounds = YES ;   
}


- (CGFloat)cornerRadius
{
    return self.layer.cornerRadius;
}



@end
