#import "UITableView+JSCustom.h"
#import <objc/runtime.h>
#import "Masonry.h"
#import "ReactiveObjC.h"
#import "SMPageStyle.h"
@implementation UITableView (JSCustom)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL systemSel = @selector(awakeFromNib);
        SEL swizzSel = @selector(app_awakeFromNib);
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
- (void)app_awakeFromNib {
    [self app_awakeFromNib];
    @weakify(self);
    [[self rac_valuesAndChangesForKeyPath:@"mj_header" options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
        @strongify(self);
        id header = [self valueForKey:@"mj_header"];
        if(header){
            UILabel* label = [header valueForKey:@"stateLabel"];
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = SMPlaceHolder;
            [header setTitle:@"玩命加载中..." forState:3];
            UILabel* timeLabel = [header valueForKey:@"lastUpdatedTimeLabel"];
            timeLabel.textColor = SMPlaceHolder;
            timeLabel.font = [UIFont systemFontOfSize:12];
        }
        [[x.first rac_signalForSelector:@selector(endRefreshing)] subscribeNext:^(RACTuple * _Nullable x) {
            @strongify(self);
        }];
    }];
    if (!self.closeEmptyHandel){
        [self checkEmpty];
    }
    [[self rac_valuesAndChangesForKeyPath:@"mj_footer" options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
        @strongify(self);
        id footer = [self valueForKey:@"mj_footer"];
        if(footer){
            UILabel* label = [footer valueForKey:@"stateLabel"];
            label.textColor = SMPlaceHolder;
            label.font = [UIFont systemFontOfSize:12];
            [footer setTitle:@"---- 到底了,别拽了 ----" forState:5];
            [footer setTitle:@"玩命加载中..." forState:3];
        }
        [[x.first rac_signalForSelector:@selector(endRefreshing)] subscribeNext:^(RACTuple * _Nullable x) {
            @strongify(self);
            if (!self.closeEmptyHandel){
                [self checkEmpty];
            }
        }];
        [[x.first rac_signalForSelector:@selector(endRefreshingWithNoMoreData)] subscribeNext:^(RACTuple * _Nullable x) {
            @strongify(self);
            if (!self.closeEmptyHandel){
                [self checkEmpty];
            }
        }];
    }];
    if([self.superview respondsToSelector:@selector(unCustomTableView)]){
        if([self.superview performSelector:@selector(unCustomTableView)]){
            return;
        }
    }
    if([self isKindOfClass:[UITableView class]]){
        self.backgroundColor = SMColorFromRGB(0xF0F4F7);
        self.separatorColor = SMSeparator;
        self.separatorInset = UIEdgeInsetsMake(0, 12, 0, 12);
        if(![self.superview isKindOfClass:NSClassFromString(@"SMOrderCountView")]){
            self.tableFooterView = [UIView new];
        }
    }
}
-(void)showEmptyView
{
    if(![self viewWithTag:8888]){
        [self prepareEmptyView];
    }
    [self viewWithTag:8888].hidden = NO;
}
-(void)hideEmptyView
{
    [self viewWithTag:8888].hidden = YES;
}
-(void)checkEmpty
{
    WS(wSelf);
    if([self isEmpty]){
        dispatch_async(dispatch_get_main_queue(), ^{
            if([wSelf isEmpty]){
                if(![wSelf viewWithTag:8888]){
                    [wSelf prepareEmptyView];
                }
                [wSelf viewWithTag:8888].hidden = NO;
                if([wSelf valueForKey:@"mj_footer"]){
                    ((UIView*)[wSelf valueForKey:@"mj_footer"]).hidden = YES;
                }
            }else{
                ((UIView*)[wSelf valueForKey:@"mj_footer"]).hidden = NO;
            }
        });
    }else{
        [self viewWithTag:8888].hidden = YES;
        if([self valueForKey:@"mj_footer"]){
            ((UIView*)[self valueForKey:@"mj_footer"]).hidden = NO;
        }
    }
}
-(BOOL)isEmpty
{
    BOOL isEmpty = YES;
    NSInteger sections = 1;
    id<UITableViewDataSource> dataSource = self.dataSource;
    if([dataSource respondsToSelector:@selector(numberOfSectionsInTableView:)]){
        sections = [dataSource numberOfSectionsInTableView:self]-1;
    }
    for (NSInteger i=0;i<=sections;i++) {
        NSInteger rows = [dataSource tableView:self numberOfRowsInSection:i];
        if(rows){
            isEmpty = NO;
        }
    }
    return isEmpty;
}
-(void)prepareEmptyView
{
    [self setEmptyViewStatus:self.emptyType];
    UIView* placeHolder = [[UIView alloc]initWithFrame:CGRectZero];
    placeHolder.tag = EmptyMsgViewTag;
    UILabel* textLabel = [[UILabel alloc]initWithFrame:CGRectZero];
    textLabel.tag = EmptyMsgTag;
    textLabel.text = self.emptyMsg;
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textColor = SMColorFromRGB(0x808080);
    textLabel.textColor = [UIColor lightGrayColor];
    textLabel.textAlignment = NSTextAlignmentCenter;
    UIImage* image = [UIImage imageNamed:self.emptyImage inBundle:[NSBundle bundleForClass:NSClassFromString(@"BBJS3DImageViewController")]  compatibleWithTraitCollection:nil];
    UIImageView* placeHolderImage = [[UIImageView alloc]initWithImage:image];
    placeHolderImage.contentMode = UIViewContentModeScaleAspectFit;
    [placeHolder addSubview:placeHolderImage];
    [placeHolder addSubview:textLabel];
    placeHolderImage.tag =EmptyIconTag;
    placeHolder.hidden = YES;
    [self addSubview:placeHolder];
    [self sendSubviewToBack:placeHolder];
    [placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [placeHolderImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointMake(self.center.x, self.center.y/1.3));
    }];
    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.equalTo(placeHolderImage.mas_bottom).offset(15);
    }];
}
- (void)setEmptyViewStatus:(SMTBEmptyType)type
{
    self.emptyImage = NSLocalizedString(@"nodata", nil);
    self.emptyMsg = @"";
}
- (void)setCloseEmptyHandel:(BOOL)closeEmptyHandel{
    objc_setAssociatedObject(self, _closeEmptyHandel, @(closeEmptyHandel), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (BOOL)closeEmptyHandel{
    NSNumber * tmp = objc_getAssociatedObject(self, _closeEmptyHandel);
    if (tmp.integerValue == 0) {
        return NO;
    }
    else {
        return YES;
    }
}
- (void)setEmptyMsg:(NSString *)emptyMsg
{
    objc_setAssociatedObject(self, _emptyMsg, emptyMsg, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString*)emptyMsg
{
    return objc_getAssociatedObject(self, _emptyMsg);
}
- (void)setEmptyImage:(NSString *)emptyImage
{
    objc_setAssociatedObject(self, _emptyImage, emptyImage, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (NSString*)emptyImage
{
    return objc_getAssociatedObject(self, _emptyImage);
}
- (void)setEmptyType:(SMTBEmptyType)emptyType
{
    objc_setAssociatedObject(self, _emptyType, @(emptyType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setEmptyViewStatus:emptyType];
}
- (SMTBEmptyType)emptyType
{
    SMTBEmptyType type = (SMTBEmptyType)[objc_getAssociatedObject(self, _emptyType) integerValue];
    return type;
}
@end
