#import "BBJSUserInfo.h"
#import "BBJSLocalStorageKit.h"
#import "BBJSFastLoginModel.h"
#define gamesUserNameArray @"gamesUserNameArray"
#define User_Token @"User_Token"
#define User_nickName @"User_nickName"
#define User_signature @"User_signature"
#define User_Image @"User_Image"
@interface BBJSUserInfo()
@end
@implementation BBJSUserInfo
+(id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    static BBJSUserInfo* userInfo = nil;
    dispatch_once(&onceToken, ^{
        userInfo = [super allocWithZone:zone];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(networkStatusChange:) name:@"JSNetworkStatusChangeNotification" object:nil];
    });
    return userInfo;
}
+(BBJSUserInfo*)shareManager
{
    return [[self alloc]init];
}
#pragma mark - save & queue
-(id)getUserDefaultByKey:(NSString*)key
{
    return [BBJSLocalStorageKit queryForKey:key localStorageType:JSLocalStorageTypeUserDefault];
}
-(void)saveUserDefaultByKey:(NSString*)key result:(id)value
{
    [BBJSLocalStorageKit save:value forKey:key localStorageType:JSLocalStorageTypeUserDefault];
}
- (NSArray *)sortedArrayUsingComparatorByPaymentTimeWithDataArr:(NSArray<BBJSFastLoginModel*> *)dataArr{
    NSMutableArray *sortArray = [dataArr sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        BBJSFastLoginModel *model1 = obj1;
        BBJSFastLoginModel *model2 = obj2;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat: @"yyyy.MM.dd HH:mm:ss"];
        NSString * time1 = [NSString stringWithFormat:@"%@.%@ %@",model1.class_year,model1.class_day,model1.class_hour];
        NSString * time2 = [NSString stringWithFormat:@"%@.%@ %@",model2.class_year,model2.class_day,model2.class_hour];
        NSDate *date1= [dateFormatter dateFromString:time1];
        NSDate *date2= [dateFormatter dateFromString:time2];
        if (date1 == [date1 earlierDate: date2]) { 
            return NSOrderedDescending;
        }else if (date1 == [date1 laterDate: date2]) {
            return NSOrderedAscending;
        }else{
            return NSOrderedSame;
        }
    }];
    return sortArray;
}
#pragma mark - getter & setter
-(void)setGamesArray:(NSMutableArray<BBJSClassModel *> *)gamesArray{
    if (gamesArray == nil) {
        return;
    }
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:gamesArray];
    [userdefaults setObject:data forKey:gamesUserNameArray];
}
-(NSMutableArray<BBJSClassModel *> *)gamesArray
{
    NSUserDefaults * userdefaults = [NSUserDefaults standardUserDefaults];
    NSData * tmp = [userdefaults objectForKey:gamesUserNameArray];
    if (tmp == nil) {
        return  [[NSMutableArray alloc]init];
    }
    else {
        return  [NSKeyedUnarchiver unarchiveObjectWithData: tmp];
    }
}
-(void)setNickName:(NSString *)nickName{
    [self saveUserDefaultByKey:User_nickName result:nickName];
}
- (NSString *)nickName{
    return [self getUserDefaultByKey:User_nickName];
}
-(void)setSignature:(NSString *)signature{
    [self saveUserDefaultByKey:User_signature result:signature];
}
- (NSString *)signature{
    return [self getUserDefaultByKey:User_signature];
}
-(void)setHeader_image:(UIImage *)header_image{
    [self saveUserDefaultByKey:User_Image result:header_image];
}
- (UIImage *)header_image{
    return [self getUserDefaultByKey:User_Image];
}
-(void)setToken:(NSString *)token{
    [self saveUserDefaultByKey:User_Token result:token];
}
- (NSString *)token{
    return [self getUserDefaultByKey:User_Token];
}
@end
