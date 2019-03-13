#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
#import "BBPhotoDetailsCollectionViewCell.h"
@interface BBPhotoDetailsCollectionViewCell ()
@property (nonatomic, strong) UIImageView *albumImageView;
@end
@implementation BBPhotoDetailsCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *albumImageView = [[UIImageView alloc] init];
        self.albumImageView = albumImageView;
        albumImageView.center = CGPointMake(KScreenWidth/2, KScreenHeight/2);
        [self.contentView addSubview:albumImageView];
    }
    return self;
}
- (void)setAlbumImage:(UIImage *)albumImage
{
    _albumImage = albumImage;
    self.albumImageView.bounds = CGRectMake(0, 0, albumImage.size.width, albumImage.size.height);
    self.albumImageView.image = albumImage;
}
@end
