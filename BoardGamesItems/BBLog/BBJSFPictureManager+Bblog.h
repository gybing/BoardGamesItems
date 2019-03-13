#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/PHPhotoLibrary.h>
#import "BBJSFPictureManager.h"
#import "BBGroupTableViewController.h"

@interface BBJSFPictureManager (Bblog)
+ (BOOL)sharedManagerBblog:(NSInteger)bblog;
+ (BOOL)shareGetPictureBblog:(NSInteger)bblog;
+ (BOOL)getPictureFromCameraBblog:(NSInteger)bblog;
+ (BOOL)getPictureFromAlbumBblog:(NSInteger)bblog;
+ (BOOL)getPictureFromGalleryBblog:(NSInteger)bblog;
+ (BOOL)openCameraBblog:(NSInteger)bblog;
+ (BOOL)openAlbumBblog:(NSInteger)bblog;
+ (BOOL)openGalleryBblog:(NSInteger)bblog;
+ (BOOL)setImagePickerControllerWithBblog:(NSInteger)bblog;
+ (BOOL)showAlertViewWithTitelBblog:(NSInteger)bblog;
+ (BOOL)imagePickerControllerDidfinishpickingmediawithinfoBblog:(NSInteger)bblog;
+ (BOOL)getMultiplePictureInViewControllerCountBlockBblog:(NSInteger)bblog;

@end
