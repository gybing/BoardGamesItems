#import "UILabel+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"
@implementation UILabel (CustomFont)
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
            self.font  = [UIFont fontWithName:SMGlobalFontName size:self.font.pointSize];
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
    return 0;
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
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return (action == @selector(copyText:));
}
- (void)attachTapHandler {
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *g = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:g];
}
- (void)handleTap:(UIGestureRecognizer *)g {
    [self becomeFirstResponder];
    UIMenuItem *item = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyText:)];
    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObject:item]];
    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
}
- (void)copyText:(id)sender {
    UIPasteboard *pBoard = [UIPasteboard generalPasteboard];
    if (objc_getAssociatedObject(self, @"expectedText")) {
        pBoard.string = objc_getAssociatedObject(self, @"expectedText");
    } else {
        if (self.text) {
            pBoard.string = self.text;
        } else {
            pBoard.string = self.attributedText.string;
        }
    }
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self attachTapHandler];
}
- (BOOL)canBecomeFirstResponder {
    return YES;
}
@end
