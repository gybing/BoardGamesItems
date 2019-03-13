#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import "BBAllAlbumViewController.h"
#import "BBAllAlbumCollectionViewCell.h"
#import "BBPhotoDetailsCollectionViewController.h"
#import "BBJSFPictureManager.h"

@interface BBAllAlbumViewController (Bblog)
+ (BOOL)viewDidLoadBblog:(NSInteger)bblog;
+ (BOOL)selectImagesCountBblog:(NSInteger)bblog;
+ (BOOL)selectPreviewImagesBblog:(NSInteger)bblog;
+ (BOOL)createCollectionViewBblog:(NSInteger)bblog;
+ (BOOL)previewClickBblog:(NSInteger)bblog;
+ (BOOL)determineClickBblog:(NSInteger)bblog;
+ (BOOL)getSourceBblog:(NSInteger)bblog;
+ (BOOL)getAllSourceBblog:(NSInteger)bblog;
+ (BOOL)collectionViewNumberofitemsinsectionBblog:(NSInteger)bblog;
+ (BOOL)collectionViewCellforitematindexpathBblog:(NSInteger)bblog;
+ (BOOL)collectionViewDidselectitematindexpathBblog:(NSInteger)bblog;
+ (BOOL)albumCollectionViewCellBtnBblog:(NSInteger)bblog;
+ (BOOL)judgeImageSelectedStateWithButtonBblog:(NSInteger)bblog;
+ (BOOL)collectionViewBblog:(NSInteger)bblog;
+ (BOOL)bottomViewBblog:(NSInteger)bblog;
+ (BOOL)previewBtnBblog:(NSInteger)bblog;
+ (BOOL)determineBtnBblog:(NSInteger)bblog;
+ (BOOL)coverViewBblog:(NSInteger)bblog;
+ (BOOL)fetchArrayBblog:(NSInteger)bblog;
+ (BOOL)selectArrayBblog:(NSInteger)bblog;
+ (BOOL)selectImageArrayBblog:(NSInteger)bblog;
+ (BOOL)imageArrayBblog:(NSInteger)bblog;
+ (BOOL)dataArrBblog:(NSInteger)bblog;

@end
