#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
@interface BBAllAlbumViewController : UIViewController
@property (nonatomic, strong) PHAssetCollection *album;
@property (nonatomic,assign) NSInteger selectCount;
@end
