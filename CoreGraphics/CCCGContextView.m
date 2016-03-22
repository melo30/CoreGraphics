//
//  CCCGContextView.m
//  CoreGraphics
//
//  Created by 陈诚 on 16/3/22.
//  Copyright © 2016年 test. All rights reserved.
//  CoreGraphics,也称为Quartz 2D 是UIKit下的主要绘图系统

#import "CCCGContextView.h"

@implementation CCCGContextView

//初始化Frame
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

//View绘制触发方法
- (void)drawRect:(CGRect)rect
{
    //由于像素是依赖于目标的,所以2D绘图斌不能操作单独的像素,我们可以从上下文(Context)读取它.使用它
    //CGContextRef ctx = UIGraphicsGetCurrentContext();
    //之后我们需要通过以下:
    //CGContextSetFillColorWithColor(<#CGContextRef  _Nullable c#>, <#CGColorRef  _Nullable color#>);
    //CGContextFillPath(<#CGContextRef  _Nullable c#>) 来完成和UIBezierPath一样的绘制.
    
    [self drawNameLabel];//标题
    [self drawCircleAtx];//绘制圆 脸
    [self drawEllipseAtX];//绘制椭圆 眼睛
    [self drawTriangle];//绘制三角形 帽子
    [self drawQuadCurve];//绘制不规则的形状(一个牵引点) 耳朵
    [self drawCurve];//绘制不规则的形状(两个牵引点) 鼻子
    [self drawQuadCurve2];//绘制不规则的形状(一个牵引点) 嘴巴
}

- (void)drawNameLabel
{
    UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(120, 40, 200, 100)];
    nameLabel.text = @"CoreGraphics";
    nameLabel.font = [UIFont systemFontOfSize:25];
    [self addSubview:nameLabel];
    
    UILabel *authorLabel = [[UILabel alloc]initWithFrame:CGRectMake(250, 600, 200, 100)];
    authorLabel.text = @"by:cc 2016.3.22";
    authorLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:authorLabel];
}
- (void)drawRectangle
{
    CGRect rectangle = CGRectMake(80, 200, 160, 60);//定义举行的rect
    CGContextRef ctx = UIGraphicsGetCurrentContext();//设置上下文来操作
    
    CGContextAddRect(ctx, rectangle);//add矩形
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
}

- (void)drawCircleAtx
{
    //脸
    CGContextRef ctx = UIGraphicsGetCurrentContext();//设置上下文
    CGFloat x = self.bounds.size.width/2;
    CGFloat y = self.bounds.size.height/2;
    CGContextAddArc(ctx, x, y, 150, 0, 2 * M_PI, 1);
    //加阴影效果,在这里加阴影,它除了会在本身边缘部分绘制阴影以外,还会在有子控件的地方绘制阴影
    CGContextSetShadowWithColor(ctx, CGSizeMake(10, 10), 20.0f, [[UIColor grayColor]CGColor]);//参数:图形上下文,偏移量,模糊值,阴影颜色
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
}

- (void)drawEllipseAtX
{
    //左边眼睛
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat x = self.bounds.size.width/2 - 80;
    CGFloat y = self.bounds.size.height/2 - 60;
    CGRect rectangle = CGRectMake(x , y , 60, 30);
    CGContextAddEllipseInRect(ctx, rectangle);
    CGContextSetFillColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextFillPath(ctx);
    
    //右边眼睛
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    CGFloat x2 = self.bounds.size.width/2 + 40;
    CGFloat y2 = self.bounds.size.height/2 - 60;
    CGRect rectangle2 = CGRectMake(x2 , y2 , 60, 30);
    CGContextAddEllipseInRect(ctx2, rectangle2);
    CGContextSetFillColorWithColor(ctx2, [UIColor redColor].CGColor);
    CGContextFillPath(ctx2);
}
- (void)drawTriangle
{
    //帽子
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 190, 155);
    CGContextAddLineToPoint(ctx, 220, 185);
    CGContextAddLineToPoint(ctx, 160, 185);
    CGContextClosePath(ctx);
    
    CGContextSetFillColorWithColor(ctx, [UIColor blackColor].CGColor);
    CGContextFillPath(ctx);
}
- (void)drawQuadCurve
{
    //左边耳朵
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, 100, 210);//上下文,起始点x,起始点y
    CGContextAddQuadCurveToPoint(ctx, 50, 150, 75, 260);//参数:上下文,控制点x,控制点y,终点x,终点y;
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextStrokePath(ctx);
    
    //右边耳朵
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx2);
    CGContextMoveToPoint(ctx2, 250, 200);//上下文,起始点x,起始点y
    CGContextAddQuadCurveToPoint(ctx2, 300, 150, 275, 250);//参数:上下文,控制点x,控制点y,终点x,终点y;
    CGContextSetLineWidth(ctx2, 10);
    CGContextSetStrokeColorWithColor(ctx2, [UIColor brownColor].CGColor);
    CGContextStrokePath(ctx2);

}
- (void)drawCurve
{
    //鼻子
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    
    CGContextMoveToPoint(ctx, 190, 280);
    CGContextAddCurveToPoint(ctx, 180, 360, 250, 360, 180, 400);
    
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor brownColor].CGColor);
    CGContextStrokePath(ctx);
}
- (void)drawQuadCurve2
{
    //嘴巴(上嘴唇)
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx);
    CGContextMoveToPoint(ctx, self.frame.size.width / 2 - 40, 420);
    CGContextAddQuadCurveToPoint(ctx, 190, 440, self.frame.size.width / 2 + 40, 420);
    
    CGContextSetLineWidth(ctx, 5);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx);
    
    //嘴巴(下嘴唇)--->和上嘴唇比较起始点和终点不变,只需调整牵引点的y即可.
    CGContextRef ctx2 = UIGraphicsGetCurrentContext();
    CGContextBeginPath(ctx2);
    CGContextMoveToPoint(ctx2, self.frame.size.width / 2 - 40, 420);
    CGContextAddQuadCurveToPoint(ctx2, 190, 460, self.frame.size.width / 2 + 40, 420);
    
    CGContextSetLineWidth(ctx2, 5);
    CGContextSetStrokeColorWithColor(ctx2, [UIColor redColor].CGColor);
    CGContextStrokePath(ctx2);
    
}
@end
