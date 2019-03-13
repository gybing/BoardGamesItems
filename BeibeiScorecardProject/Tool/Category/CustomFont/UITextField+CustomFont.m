#import "UITextField+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"
@implementation UITextField (CustomFont)
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
        SEL systemSel2 = @selector(didMoveToWindow);
        SEL swizzSel2 = @selector(myDidMoveToWindow);
        Method systemMethod2 = class_getInstanceMethod([self class], systemSel2);
        Method swizzMethod2 = class_getInstanceMethod([self class], swizzSel2);
        BOOL isAdd2 = class_addMethod(self, systemSel2, method_getImplementation(swizzMethod2), method_getTypeEncoding(swizzMethod2));
        if (isAdd2) {
            class_replaceMethod(self, swizzSel2, method_getImplementation(systemMethod2), method_getTypeEncoding(systemMethod2));
        } else {
            method_exchangeImplementations(systemMethod2, swizzMethod2);
        }
    });
}
- (void)myWillMoveToSuperview:(UIView *)newSuperview
{
    [self myWillMoveToSuperview:newSuperview];
    if (self) {
        [self setValue:SMPlaceHolder forKeyPath:@"_placeholderLabel.textColor"];
        if ([UIFont fontNamesForFamilyName:SMGlobalFontName]){
            self.font  = [UIFont fontWithName:SMGlobalFontName size:self.font.pointSize];
        }
    }
}
- (void)myDidMoveToWindow
{
    [self myDidMoveToWindow];
    if (@available(iOS 11, *)) {
        NSString *keyPath = @"textContentView.provider";
        @try {
            if (self.window) {
                id provider = [self valueForKeyPath:keyPath];
                if (!provider && self) {
                    [self setValue:self forKeyPath:keyPath];
                }
            } else {
                [self setValue:nil forKeyPath:keyPath];
            }
        } @catch (NSException *exception) {
            NSLog(@"%@", exception);
        }
    }
}
#pragma mark - getter & setter
-(NSInteger)FontSize
{
    return self.font.pointSize;
}
-(void)setFontSize:(NSInteger)FontSize
{
    switch (FontSize) {
        case 30:
            self.font = [UIFont fontWithName:SMGlobalFontName size:30];
            break;
        case 24:
            self.font = [UIFont fontWithName:SMGlobalFontName size:24];
            break;
        case 18:
            self.font = [UIFont fontWithName:SMGlobalFontName size:18];
            break;
        case 15:
            self.font = [UIFont fontWithName:SMGlobalFontName size:15];
            break;
        case 13:
            self.font = [UIFont fontWithName:SMGlobalFontName size:13];
            break;
        case 12:
            self.font = [UIFont fontWithName:SMGlobalFontName size:12];
            break;
        case 10:
            self.font = [UIFont fontWithName:SMGlobalFontName size:10];
            break;
        default:
            break;
    }
}
-(NSInteger)FontColor
{
    return self.FontColor;
}
-(void)setFontColor:(NSInteger)FontColor
{
    switch (FontColor) {
        case 0://正文颜色
            self.textColor = SMMainContent;
            break;
        case 1://说明类型颜色
            self.textColor = SMDeclaratives;
            break;
        case 2://价格，状态颜色
            self.textColor = SMPriceStatus;
            break;
        case 3://输入占位颜色
            self.textColor = SMPlaceHolder;
            break;
        case 4://弹窗交互按钮颜色
            self.textColor = SMConfirmButton;
            break;
        default:self.textColor = SMMainContent;
            break;
    }
}
@end
