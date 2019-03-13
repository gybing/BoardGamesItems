#define iOS8Later ([UIDevice currentDevice].systemVersion.floatValue >= 8.0f)
#import "BBGroupTableViewController.h"
#import <Photos/Photos.h>
#import "BBGroupTableViewCell.h"
#import "BBAllAlbumViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
@interface BBGroupTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *fetchArray;
@property (nonatomic, strong) NSMutableArray *videoArray;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) PHAssetCollection *allAlbum;
@end
@implementation BBGroupTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    self.title = @"相簿";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self getSource];
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(authorizationStateChange) userInfo:nil repeats:YES];
    self.timer = timer;
}
- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)getSource
{
    PHFetchResult * albumsFetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    for (NSInteger i = 0; i < albumsFetchResult.count; i++) {
        PHCollection * collection = albumsFetchResult[i];
        if ([collection isKindOfClass:[PHAssetCollection class]]) {
            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
            if ([assetCollection.localizedTitle isEqualToString:@"Videos"]) {
                [self.videoArray addObject:assetCollection];
                continue;
            }
            if ([assetCollection.localizedTitle isEqualToString:@"All Photos"]) {
                self.allAlbum = assetCollection;
            }
            PHFetchOptions *option = [[PHFetchOptions alloc] init];
            option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:option];
            if (fetchResult.count > 0) {
                [self.fetchArray addObject:assetCollection];
            }
        }
    }
    PHFetchResult * ownAlbumsFetchResult = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum subtype:PHAssetCollectionSubtypeAny options:nil];
    for (NSInteger i = 0; i < ownAlbumsFetchResult.count; i++) {
        PHCollection * collection = ownAlbumsFetchResult[i];
        if ([collection isKindOfClass:[PHAssetCollection class]]) {
            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
            if ([assetCollection.localizedTitle isEqualToString:@"Videos"]) {
                [self.videoArray addObject:assetCollection];
                continue;
            }
            PHFetchOptions *option = [[PHFetchOptions alloc] init];
            option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:option];
            if (fetchResult.count > 0) {
                [self.fetchArray addObject:assetCollection];
            }
        }
    }
}
- (void)authorizationStateChange
{
    if ([self authorizationStateAuthorized]) {
        [self.timer invalidate];
        self.timer = nil;
        if (self.fetchArray.count == 0) {
            [self getSource];
        }
        [self.tableView reloadData];
    }
}
- (BOOL)authorizationStateAuthorized {
    if (iOS8Later) {
        if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) return YES;
    } else {
        if ([ALAssetsLibrary authorizationStatus] == ALAuthorizationStatusAuthorized) return YES;
    }
    return NO;
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellid = @"albumTableCell";
    BBGroupTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[BBGroupTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    PHAssetCollection *album = self.fetchArray[indexPath.row];
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    PHFetchResult *albumResult = [PHAsset fetchAssetsInAssetCollection:album options:option];
    NSString *title = [self getchineseAlbum:album.localizedTitle];
    NSUInteger albumCount = albumResult.count;
    cell.nameTitle = [NSString stringWithFormat:@"%@(%ld)",title,(long)albumCount];
    PHAsset *firstAsset = [albumResult firstObject];
    PHImageManager *imageManager = [PHImageManager defaultManager];
    [imageManager requestImageForAsset:firstAsset targetSize:CGSizeMake(160, 160) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.nameImage = result;
    }];
    return cell;
}
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    PHAssetCollection *album = self.fetchArray[indexPath.row];
    BBAllAlbumViewController *albumControl = [[BBAllAlbumViewController alloc] init];
    albumControl.album = album;
    albumControl.selectCount = self.selectCount;
    [self.navigationController pushViewController:albumControl animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}
- (NSString *)getchineseAlbum:(NSString *)name
{
    NSString *newName;
    if ([name rangeOfString:@"Roll"].location != NSNotFound)         newName = @"相机胶卷";
    else if ([name rangeOfString:@"Stream"].location != NSNotFound)  newName = @"我的照片流";
    else if ([name rangeOfString:@"Added"].location != NSNotFound)   newName = @"最近添加";
    else if ([name rangeOfString:@"Selfies"].location != NSNotFound) newName = @"自拍";
    else if ([name rangeOfString:@"shots"].location != NSNotFound)   newName = @"截屏";
    else if ([name rangeOfString:@"Videos"].location != NSNotFound)  newName = @"视频";
    else if ([name rangeOfString:@"Panoramas"].location != NSNotFound)  newName = @"全景照片";
    else if ([name rangeOfString:@"Favorites"].location != NSNotFound)  newName = @"个人收藏";
    else if ([name rangeOfString:@"All Photos"].location != NSNotFound)  newName = @"所有照片";
    else newName = name;
    return newName;
}
# pragma mark - 懒加载
- (NSMutableArray *)fetchArray
{
    if (_fetchArray == nil) {
        _fetchArray = [NSMutableArray array];
    }
    return _fetchArray;
}
- (NSMutableArray *)videoArray
{
    if (_videoArray == nil) {
        _videoArray = [NSMutableArray array];
    }
    return _videoArray;
}
@end
