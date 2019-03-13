#define BundleImage(imageName)  [UIImage imageNamed:imageName inBundle:[NSBundle bundleForClass:[self class]] compatibleWithTraitCollection:nil]
#import "BBAllAlbumCollectionViewCell.h"
@interface BBAllAlbumCollectionViewCell()
@property (nonatomic, strong) UIImageView *assetImageView;
@end
@implementation BBAllAlbumCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *assetimageView = [[UIImageView alloc] init];
        assetimageView.frame = self.bounds;
        self.assetImageView = assetimageView;
        [self.contentView addSubview:assetimageView];
        UIButton *selectBtn = [[UIButton alloc] init];
        self.selectBtn = selectBtn;
        selectBtn.selected = NO;
        selectBtn.frame = CGRectMake(self.bounds.size.width-27, 0, 27, 27);
        [selectBtn setImage:BundleImage(@"def_picker") forState:UIControlStateNormal];
        [selectBtn setImage:BundleImage(@"sel_picker") forState:UIControlStateSelected];
        [selectBtn addTarget:self action:@selector(selectClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:selectBtn];
    }
    return self;
}
- (void)selectClick:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(albumCollectionViewCellBtn:)]) {
        [self.delegate albumCollectionViewCellBtn:sender];
    }
}
- (void)setAssetImage:(UIImage *)assetImage
{
    _assetImage = assetImage;
    self.assetImageView.image = assetImage;
    self.assetImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.assetImageView.clipsToBounds = YES;
    self.selectBtn.tag = self.indexpath.item;
    self.selectBtn.selected = NO;
    for (int i = 0; i < self.selectArray.count; i++) {
        if ([@(self.selectBtn.tag) isEqualToNumber:self.selectArray[i]]) {
            self.selectBtn.selected = YES;
        }
    }
}
@end
