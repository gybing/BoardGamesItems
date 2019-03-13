#import "UIButton+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"
const NSString* GlobleFont = @"isGlobleFont";
@implementation UIButton (CustomFont)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(willMoveToSuperview:);
        SEL swizzSel = @selector(myWillMoveToSuperview:);
        Method systemMethod = class_getInstanceMethod([self class], systemSel);
        Method swizzMethod = class_getInstanceMethod([self class], swizzSel);
        BOOL isAdd = class_addMethod(self, systemSel, method_getImplementation(swizzMethod), method_getTypeEncoding(swizzMethod));
        if (isAdd) {
            class_replaceMethod(self, swizzSel, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
        } else {
            method_exchangeImplementations(systemMethod, swizzMethod);
        }
    });
}
- (void)myWillMoveToSuperview:(UIView *)newSuperview
{
    [self myWillMoveToSuperview:newSuperview];
    if (self) {
        if ([UIFont fontNamesForFamilyName:SMGlobalFontName]){
            self.titleLabel.font  = [UIFont fontWithName:SMGlobalFontName size:self.titleLabel.font.pointSize];
        }
    }
}
#pragma mark - getter & setter
-(NSInteger)FontSize
{
    return self.titleLabel.font.pointSize;
}
-(void)setFontSize:(NSInteger)FontSize
{
    switch (FontSize) {
        case 30:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:30];
            break;
        case 24:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:24];
            break;
        case 18:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:18];
            break;
        case 15:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:15];
            break;
        case 13:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:13];
            break;
        case 12:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:12];
            break;
        case 10:
            self.titleLabel.font = [UIFont fontWithName:SMGlobalFontName size:10];
            break;
        default:
            break;
    }
}
-(NSInteger)FontColor
{
    return 0;
}
-(void)setFontColor:(NSInteger)FontColor
{
    switch (FontColor) {
        case 0://正文颜色
            [self setTitleColor:SMMainContent forState:UIControlStateNormal];
            break;
        case 1://说明类型颜色
            [self setTitleColor:SMDeclaratives forState:UIControlStateNormal];
            break;
        case 2://价格，状态颜色
            [self setTitleColor:SMPriceStatus forState:UIControlStateNormal];
            break;
        case 3://输入占位颜色
            [self setTitleColor:SMPlaceHolder forState:UIControlStateNormal];
            break;
        case 4://弹窗交互按钮颜色
            [self setTitleColor:SMConfirmButton forState:UIControlStateNormal];
            break;
        default:[self setTitleColor:SMMainContent forState:UIControlStateNormal];
            break;
    }
}
@end
