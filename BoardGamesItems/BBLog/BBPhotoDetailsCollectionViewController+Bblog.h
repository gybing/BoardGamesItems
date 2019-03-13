#import <UIKit/UIKit.h>
#import "BBPhotoDetailsCollectionViewController.h"
#import "BBPhotoDetailsCollectionViewCell.h"
#import <Photos/Photos.h>
#import "UIImage+ScaleImage.h"
#import "BBJSFPictureManager.h"

@interface BBPhotoDetailsCollectionViewController (Bblog)
+ (BOOL)initBblog:(NSInteger)bblog;
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)sureClickBblog:(NSInteger)bblog;
+ (BOOL)selectClickBblog:(NSInteger)bblog;
+ (BOOL)rightButtonClickBblog:(NSInteger)bblog;
+ (BOOL)getSelectImageArrayBblog:(NSInteger)bblog;
+ (BOOL)scrollViewDidScrollBblog:(NSInteger)bblog;
+ (BOOL)collectionViewNumberofitemsinsectionBblog:(NSInteger)bblog;
+ (BOOL)collectionViewCellforitematindexpathBblog:(NSInteger)bblog;
+ (BOOL)collectionViewDidselectitematindexpathBblog:(NSInteger)bblog;
+ (BOOL)popVCBblog:(NSInteger)bblog;
+ (BOOL)didReceiveMemoryWarningBblog:(NSInteger)bblog;

@end
