#import <UIKit/UIKit.h>
@class BBAllAlbumCollectionViewCell;
@protocol AllAlbumCollectionViewCellDelegate <NSObject>
@optional
- (void)albumCollectionViewCellBtn:(UIButton *)button;
@end
@interface BBAllAlbumCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) UIImage *assetImage;
@property (nonatomic, strong) NSIndexPath *indexpath;
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic,weak) id<AllAlbumCollectionViewCellDelegate> delegate;
@end
