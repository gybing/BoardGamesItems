#import "BBAllAlbumViewController.h"
#import "BBAllAlbumCollectionViewCell.h"
#import "BBPhotoDetailsCollectionViewController.h"
#import "BBJSFPictureManager.h"
@interface BBAllAlbumViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,AllAlbumCollectionViewCellDelegate>
{
    NSInteger count;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *fetchArray;
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic, strong) NSMutableArray *selectImageArray;
@property (nonatomic, strong) NSMutableArray *imageArray;
@property (nonatomic,assign) CGSize targetSize;
@property (nonatomic, strong) UIButton *determineBtn;
@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIButton *previewBtn;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) NSMutableArray * dataArr;
@end
@implementation BBAllAlbumViewController
static NSString *albumid = @"albumcellid";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createCollectionView];
    [self getSource];
    [self.collectionView registerClass:[BBAllAlbumCollectionViewCell class] forCellWithReuseIdentifier:albumid];
    [self.collectionView reloadData];
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:self.fetchArray.count-1 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionBottom animated:NO];
    count = self.selectCount;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectPreviewImages:) name:@"selectPreviewImagesNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(selectImagesCount:) name:@"selectImagesCountNotification" object:nil];
}
- (void)selectImagesCount:(NSNotification *)info
{
    self.selectCount = [[info.object objectForKey:@"selectCount"] integerValue];
}
- (void)selectPreviewImages:(NSNotification *)info
{
    NSMutableArray * array = info.object;
    [self.selectArray removeAllObjects];
    self.selectCount = count;
    for (NSInteger i=0; i<array.count; i++) {
        @autoreleasepool {
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:i inSection:0];
            BBAllAlbumCollectionViewCell * cell = (BBAllAlbumCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexpath];
            NSString * selectStr = array[i];
            if ([selectStr isEqualToString:@"select"]) {
                cell.selectBtn.selected = NO;
                [self judgeImageSelectedStateWithButton:cell.selectBtn];
            }else{
                if (cell.selectBtn.selected) {
                    cell.selectBtn.selected = YES;
                    [self judgeImageSelectedStateWithButton:cell.selectBtn];
                }
            }
        }
    }
}
- (void)createCollectionView
{
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.bottomView];
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, 0, self.bottomView.bounds.size.width, 1);
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.bottomView addSubview:lineView];
    [self.bottomView addSubview:self.previewBtn];
    [self.bottomView addSubview:self.determineBtn];
    [self.bottomView addSubview:self.coverView];
}
- (void)previewClick:(UIButton *)sender
{
    BBPhotoDetailsCollectionViewController *detailsControl = [[BBPhotoDetailsCollectionViewController alloc] init];
    detailsControl.assetArray = self.selectImageArray;
    detailsControl.item = 0;
    detailsControl.preview = @"preview";
    [self.navigationController pushViewController:detailsControl animated:YES];
}
- (void)determineClick:(UIButton *)sender
{
    [BBJSFPictureManager sharedManager].multiplePictureBlock(self.imageArray, nil);
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)getSource
{
    PHAssetCollection *album = self.album;
    PHFetchOptions *option = [[PHFetchOptions alloc] init];
    option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
    PHFetchResult *albumResult = [PHAsset fetchAssetsInAssetCollection:album options:option];
    for (int i = 0; i < albumResult.count; i++) {
        PHAsset *asset = albumResult[i];
        [self.fetchArray addObject:asset];
    }
}
- (void)getAllSource
{
    PHFetchResult *smartAlbums = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeMoment subtype:PHAssetCollectionSubtypeAny options:nil];
    for (NSInteger i = 0; i < smartAlbums.count; i++) {
        PHCollection *collection = smartAlbums[i];
        if ([collection isKindOfClass:[PHAssetCollection class]]) {
            PHAssetCollection *assetCollection = (PHAssetCollection *)collection;
            PHFetchOptions *option = [[PHFetchOptions alloc] init];
            option.predicate = [NSPredicate predicateWithFormat:@"mediaType == %ld", PHAssetMediaTypeImage];
            PHFetchResult *fetchResult = [PHAsset fetchAssetsInAssetCollection:assetCollection options:option];
            for (int i = 0; i < fetchResult.count; i++) {
                PHAsset *asset = fetchResult[i];
                [self.fetchArray addObject:asset];
            }
        }
    }
}
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.fetchArray.count;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BBAllAlbumCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:albumid forIndexPath:indexPath];
    PHAsset *asset = self.fetchArray[indexPath.item];
    PHImageManager *imageManager = [PHImageManager defaultManager];
    [imageManager requestImageForAsset:asset targetSize:self.targetSize contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        cell.indexpath = indexPath;
        cell.selectArray = self.selectArray;
        cell.assetImage = result;
        cell.delegate = self;
    }];
    return cell;
}
#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    BBPhotoDetailsCollectionViewController *detailsControl = [[BBPhotoDetailsCollectionViewController alloc] init];
    detailsControl.assetArray = self.fetchArray;
    detailsControl.item = indexPath.item;
    if (self.dataArr.count>0) {
        [self.dataArr removeAllObjects];
    }
    for (NSInteger i=0; i<self.fetchArray.count; i++) {
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:i inSection:0];
        BBAllAlbumCollectionViewCell * cell = (BBAllAlbumCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexpath];
        NSString * selectStr;
        if (cell.selectBtn.selected==NO) {
            selectStr = @"isSelect";
        }else{
            selectStr = @"select";
        }
        [self.dataArr addObject:selectStr];
    }
    detailsControl.dataArr = self.dataArr;
    detailsControl.selectCount = self.selectCount;
    detailsControl.count = count;
    [self.navigationController pushViewController:detailsControl animated:YES];
}
- (void)albumCollectionViewCellBtn:(UIButton *)button
{
    [self judgeImageSelectedStateWithButton:button];
}
- (void)judgeImageSelectedStateWithButton:(UIButton *)isSelectBtn
{
    if (isSelectBtn.selected) {
        isSelectBtn.selected = NO;
        for (int i = 0; i < self.selectArray.count; i++) {
            if ([@(isSelectBtn.tag) isEqualToNumber:self.selectArray[i]]) {
                [self.selectArray removeObjectAtIndex:i];
                self.selectCount--;
            }
        }
    }else if (!isSelectBtn.selected) {
        if (self.selectCount >= 9) {
            UIAlertController *alterControl = [UIAlertController alertControllerWithTitle:@"" message:@"最多只能够选择9张图片" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alterControl addAction:action];
            [self presentViewController:alterControl animated:YES completion:nil];
            return;
        }
        isSelectBtn.selected = YES;
        [self.selectArray addObject:@(isSelectBtn.tag)];
        self.selectCount++;
        for (int i = 0; i < self.selectArray.count-1; i++) {
            for (int j = 0; j < self.selectArray.count - i - 1; j++) {
                NSInteger firstIndex = [self.selectArray[j] integerValue];
                NSInteger secondIndex = [self.selectArray[j+1] integerValue];
                if (firstIndex > secondIndex) {
                    NSInteger tempIndex = [self.selectArray[j] integerValue];
                    self.selectArray[j] = self.selectArray[j+1];
                    self.selectArray[j+1]= @(tempIndex);
                }
            }
        }
    }
    self.selectImageArray = nil;
    self.imageArray = nil;
    for (int i = 0; i < self.selectArray.count; i++) {
        NSInteger index = [self.selectArray[i] integerValue];
        if (index < self.fetchArray.count) {
            PHAsset *asset = self.fetchArray[index];
            [self.selectImageArray addObject:asset];
            PHImageManager *imageManager = [PHImageManager defaultManager];
            [imageManager requestImageForAsset:asset targetSize:PHImageManagerMaximumSize contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
                if (result) {
                    [self.imageArray addObject:result];
                }
            }];
        }
    }
    if (self.selectArray.count > 0) {
        self.coverView.hidden = YES;
        [self.previewBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        NSString *str = [NSString stringWithFormat:@"(%ld)确定",(long)self.selectArray.count];
        [self.determineBtn setTitle:str forState:UIControlStateNormal];
        [self.determineBtn sizeToFit];
        self.determineBtn.center = CGPointMake(self.bottomView.bounds.size.width-(self.determineBtn.bounds.size.width/2+10), self.bottomView.bounds.size.height/2);
    }else
    {
        self.coverView.hidden = NO;
        [self.previewBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [self.determineBtn setTitle:@"确定" forState:UIControlStateNormal];
        [self.determineBtn sizeToFit];
        self.determineBtn.center = CGPointMake(self.bottomView.bounds.size.width-(self.determineBtn.bounds.size.width/2+10), self.bottomView.bounds.size.height/2);
    }
}
# pragma mark - 懒加载
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat margin = 4;
        CGFloat itemWH = (self.view.bounds.size.width - 5 * margin)/4;
        layout.itemSize = CGSizeMake(itemWH, itemWH);
        layout.minimumLineSpacing = margin;
        layout.minimumInteritemSpacing = margin;
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, 0, margin);
        self.targetSize = CGSizeMake(itemWH * 2, itemWH * 2);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64-50) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}
-(UIView *)bottomView
{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.frame = CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), self.view.bounds.size.width, 50);
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
-(UIButton *)previewBtn
{
    if (!_previewBtn) {
        _previewBtn = [[UIButton alloc] init];
        [_previewBtn setTitle:@"预览" forState:UIControlStateNormal];
        _previewBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_previewBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_previewBtn sizeToFit];
        _previewBtn.center = CGPointMake(10 + _previewBtn.bounds.size.width/2, self.bottomView.bounds.size.height/2);
        [_previewBtn addTarget:self action:@selector(previewClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _previewBtn;
}
- (UIButton *)determineBtn
{
    if (!_determineBtn) {
        _determineBtn = [[UIButton alloc] init];
        [_determineBtn setTitle:@"确定" forState:UIControlStateNormal];
        _determineBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [_determineBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [_determineBtn sizeToFit];
        _determineBtn.center = CGPointMake(self.bottomView.bounds.size.width-(_determineBtn.bounds.size.width/2+10), self.bottomView.bounds.size.height/2);
        [_determineBtn addTarget:self action:@selector(determineClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _determineBtn;
}
-(UIView*)coverView
{
    if (!_coverView) {
        _coverView = [[UIView alloc] init];
        _coverView.frame = self.bottomView.bounds;
        _coverView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
    }
    return _coverView;
}
- (NSMutableArray *)fetchArray
{
    if (_fetchArray == nil) {
        _fetchArray = [NSMutableArray array];
    }
    return _fetchArray;
}
- (NSMutableArray *)selectArray
{
    if (_selectArray == nil) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}
- (NSMutableArray *)selectImageArray
{
    if (_selectImageArray == nil) {
        _selectImageArray = [NSMutableArray array];
    }
    return _selectImageArray;
}
- (NSMutableArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NSMutableArray array];
    }
    return _imageArray;
}
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
@end
