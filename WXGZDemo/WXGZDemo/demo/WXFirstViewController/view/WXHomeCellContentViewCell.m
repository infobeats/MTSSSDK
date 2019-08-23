//
//  WXHomeCellContentView.m
//  MTSSSecSDKDemo
//
//  Created by 谭建中 on 29/7/2019.
//  Copyright © 2019 谭建中. All rights reserved.
//

#import "WXHomeCellContentViewCell.h"
#import "WXItem.h"
#import "WXItemBtn.h"
@interface WXHomeCellContentViewCell()
@property (nonatomic, copy) void(^block)(WXItem * item);
@property (nonatomic, copy) NSArray *dataArray;
@end
@implementation WXHomeCellContentViewCell

- (void)setItem:(NSArray <WXItem *> *)array clickBlock:(void(^)(WXItem *))block;
{
    CGFloat margin = 8;
    NSInteger lineNum = 3;
    CGFloat itemW =  ([[UIScreen mainScreen] bounds].size.width - 6 * margin)/3.0;
    self.block = block;
    self.dataArray = array;
    [array enumerateObjectsUsingBlock:^(WXItem * _Nonnull obj, NSUInteger i, BOOL * _Nonnull stop) {
        // 所在行
        NSInteger row = i / lineNum;
        // 所在列
        NSInteger col = i % lineNum;
        // PointX
        CGFloat  X = margin * 2  + (itemW + margin) * col;
        // PointY
        CGFloat  Y = margin * 2  + (itemW + margin) * row;
        
        WXItemBtn *btn = [[WXItemBtn alloc] init];
        UIImage *image = [UIImage imageNamed:obj.imageName];
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        NSString *title = obj.title;
        [btn setImage:image forState:UIControlStateNormal];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:32/255.0 green:40/255.0 blue:49/255.0 alpha:1] forState:UIControlStateNormal];
        
        CGSize maxSize = CGSizeMake(itemW, MAXFLOAT);
        CGSize textSize = [self sizeWithString:title font:[UIFont systemFontOfSize:14] maxSize:maxSize];
        
        //设置图片偏移：向上偏移文字高度＋向右偏移文字宽度 （偏移量是根据［文字］大小来的，这点是关键）
        btn.imageEdgeInsets = UIEdgeInsetsMake(- textSize.height - 8 ,0,0,-textSize.width);
        //设置文字偏移：向下偏移图片高度＋向左偏移图片宽度 （偏移量是根据［图片］大小来的，这点是关键）
        btn.titleEdgeInsets = UIEdgeInsetsMake(image.size.height + 8, - image.size.width, 0, 0);
        
        btn.frame = CGRectMake(X, Y, itemW, itemW);
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }];
    
}
- (void)clickBtn:(UIButton *)btn
{
    if (self.block && self.dataArray[btn.tag]) {
        self.block(self.dataArray[btn.tag]);
    }
}
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName: font};
    CGSize textSize = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return textSize;
}

@end
