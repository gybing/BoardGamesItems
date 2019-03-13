#import "BBJSFPictureManager.h"
#import "BBGroupTableViewController.h"
@implementation BBJSFPictureManager
+ (BBJSFPictureManager *)sharedManager {
    static BBJSFPictureManager * sharedManager = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}
+ (void)shareGetPicture:(getPictureBlock)block {
        BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
            getPicture.pictureBlock = block;
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(kALERTTITLE, nil)  message:nil preferredStyle: UIAlertControllerStyleActionSheet];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:cancelAction];
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        {
            UIAlertAction *CameraAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"相机", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *CameraAction){
                [getPicture openCamera];
            }];
            [alertController addAction:CameraAction];
        }
        UIAlertAction *ImageAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"相册", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *ImageAction){
            [getPicture openAlbum];
        }];
        [alertController addAction:ImageAction];
        UIAlertAction *galleryAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"多媒体", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction *ImageAction){
            [getPicture openGallery];
        }];
        [alertController addAction:galleryAction];
        [AppRootViewController presentViewController:alertController animated:YES completion:nil];
}
- (void)getPictureFromCamera :(getPictureBlock)block{
    dispatch_queue_t queue = dispatch_queue_create("getCameraImage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
        });
        [self openCamera];
    });
}
- (void)getPictureFromAlbum:(getPictureBlock)block{
    dispatch_queue_t queue = dispatch_queue_create("getAlbumImage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
        });
        [self openAlbum];
    });
}
- (void)getPictureFromGallery:(getPictureBlock)block{
    dispatch_queue_t queue = dispatch_queue_create("getGalleryImage", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
        dispatch_async(dispatch_get_main_queue(), ^{
            getPicture.pictureBlock = block;
        });
        [self openGallery];
    });
}
#pragma mark - Camera
- (void)openCamera {
    BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus ==AVAuthorizationStatusDenied)
    {
        [getPicture showAlertViewWithTitel:NSLocalizedString(kNOTSUPPORTCAMERAL, nil)];
    }else{
        [getPicture setImagePickerControllerWith:UIImagePickerControllerSourceTypeCamera];
    }
}
#pragma mark - Album
- (void)openAlbum {
    BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusDenied || status == PHAuthorizationStatusRestricted) {
        [getPicture showAlertViewWithTitel:NSLocalizedString(kNOTSUPPORTALBUM, nil)];
    }else{
        [getPicture setImagePickerControllerWith:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }
}
#pragma mark - Gallery
- (void)openGallery {
    BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
    {
        [getPicture showAlertViewWithTitel:NSLocalizedString(kNOTSUPPORTGALLERY, nil)];
    }else{
        [getPicture setImagePickerControllerWith:UIImagePickerControllerSourceTypePhotoLibrary];
    }
}
#pragma mark - ImagePickerController
- (void)setImagePickerControllerWith:(UIImagePickerControllerSourceType)type {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = [BBJSFPictureManager sharedManager];
    imagePicker.sourceType = type;
    imagePicker.allowsEditing = YES;
    [AppRootViewController presentViewController:imagePicker animated:YES completion:nil];
}
#pragma mark - showAlertView
- (void)showAlertViewWithTitel:(NSString *)title{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"提示", nil) message:title preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
    }];
    [alertController addAction:cancelAction];
    [AppRootViewController presentViewController:alertController animated:YES completion:nil];
}
#pragma mark - image picker delegte
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
    [picker dismissViewControllerAnimated:YES completion:^{}];
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    [getPicture pictureBlock](image);
}
- (void)getMultiplePictureInViewController:(__weak UIViewController *)controller count:(NSInteger)count block:(getMultiplePictureBlock)block{
    BBJSFPictureManager * getPicture = [BBJSFPictureManager sharedManager];
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    if (author == ALAuthorizationStatusRestricted || author == ALAuthorizationStatusDenied)
    {
        [getPicture showAlertViewWithTitel:kNOTSUPPORTGALLERY];
        block(nil,@"无法访问图片库");
    }else{
        self.multiplePictureBlock = block;
        BBGroupTableViewController * albumControl = [[BBGroupTableViewController alloc] init];
        albumControl.selectCount = count;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:albumControl];
        [controller presentViewController:nav animated:YES completion:nil];
    }
}
@end
