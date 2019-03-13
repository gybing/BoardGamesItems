#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])
#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])
#define kALERTTITLE @"设置图像"
#define kNOTSUPPORTCAMERAL @"设备不支持访问相机，请在设置->隐私->相机中进行设置！"
#define kNOTSUPPORTALBUM @"设备不支持访问相册，请在设置->隐私->照片中进行设置！"
#define kNOTSUPPORTGALLERY @"设备不支持访问图片库，请在设置->隐私->照片中进行设置！"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/PHPhotoLibrary.h>
typedef void (^getPictureBlock)(UIImage *image);
typedef void (^getMultiplePictureBlock)(NSMutableArray <UIImage *>*images,NSString *errorStr);
@interface BBJSFPictureManager : NSObject<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,copy)getPictureBlock pictureBlock;
@property (nonatomic,copy)getMultiplePictureBlock multiplePictureBlock;
+ (BBJSFPictureManager *)sharedManager;
+ (void)shareGetPicture:(getPictureBlock)block;
- (void)getPictureFromCamera :(getPictureBlock)block;
- (void)getPictureFromAlbum:(getPictureBlock)block;
- (void)getPictureFromGallery:(getPictureBlock)block;
- (void)getMultiplePictureInViewController:(__weak UIViewController *)controller count:(NSInteger)count block:(getMultiplePictureBlock)block;
@end
