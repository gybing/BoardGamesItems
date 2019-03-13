#import <UIKit/UIKit.h>
@interface BBPhotoDetailsCollectionViewController : UICollectionViewController
@property (nonatomic,assign) NSInteger selectCount;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, strong) NSMutableArray *assetArray;
@property (nonatomic, strong) NSMutableArray * dataArr;
@property (nonatomic,assign) NSInteger item;
@property (nonatomic, copy) NSString * preview;
@end
