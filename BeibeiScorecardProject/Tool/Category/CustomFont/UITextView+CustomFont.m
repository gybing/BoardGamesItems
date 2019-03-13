#import "UITextView+CustomFont.h"
#import <objc/runtime.h>
#import "SMPageStyle.h"
const NSString* TextViewPlaceHolder = @"TextViewPlaceHolder";
@implementation UITextView (CustomFont)
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
        [self setupTextView];
        if ([UIFont fontNamesForFamilyName:SMGlobalFontName]){
            self.font  = [UIFont fontWithName:SMGlobalFontName size:self.font.pointSize];
        }
    }
}
- (void)setupTextView
{
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"请输入内容";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = [UIColor colorWithRed:0.769 green:0.769 blue:0.769 alpha:1.00];
    [placeHolderLabel sizeToFit];
    [placeHolderLabel setFont:[UIFont systemFontOfSize:13]];
    placeHolderLabel.tag = 10088;
    [self addSubview:placeHolderLabel];
    [self setValue:placeHolderLabel forKey:@"_placeholderLabel"];
}
#pragma mark - getter & setter
-(NSString*)PlaceHolder
{
    return objc_getAssociatedObject(self, &TextViewPlaceHolder);
}
-(void)setPlaceHolder:(NSString *)PlaceHolder
{
    UILabel* label = [self viewWithTag:10088];
    label.text = PlaceHolder;
    objc_setAssociatedObject(self, &TextViewPlaceHolder, PlaceHolder, OBJC_ASSOCIATION_COPY);
}
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
@end
