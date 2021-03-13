#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SpringBoard/SpringBoard.h>


@interface NSUserDefaults (Tweak_Category)
- (id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
- (void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end

@interface SBHomeScreenTodayViewController : UIViewController
@end

@interface SBHomeScreenOverlayController : NSObject
@end

@interface SBNestingViewController : UIViewController
@end

@interface SBHLibraryViewController : SBNestingViewController
@end

@interface SBIconController : UIViewController{
    SBHomeScreenTodayViewController* _todayViewController;
    SBHomeScreenOverlayController* _homeScreenOverlayController;
    SBHLibraryViewController* _libraryViewController;
}
@end



/*
%hook SpringBoard

-(void)applicationDidFinishLaunching:(id)application {

    %orig;
    UIWindow *foundWindow = nil;
    NSArray *windows = [[UIApplication sharedApplication]windows];
    for (UIWindow *window in windows) {
        if (window.isKeyWindow) {
            foundWindow = window;
            break;
        }
    }
    
    UIViewController *view = foundWindow.rootViewController;

        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {

                view = view.presentedViewController;

        }

    UIAlertController *alertController =

    [UIAlertController alertControllerWithTitle:@"ピカチュウ"

                                        message:@"ゲットだぜ！！"

                                 preferredStyle:UIAlertControllerStyleAlert];

    [alertController addAction:[UIAlertAction actionWithTitle:@"はい"

                                                        style:UIAlertActionStyleDefault

                                                      handler:^(UIAlertAction *action) {

        //ボタンが押された時の処理

    }]];

    [alertController addAction:[UIAlertAction actionWithTitle:@"いいえ"

                                                        style:UIAlertActionStyleDefault

                                                      handler:^(UIAlertAction *action) {

        //ボタンが押された時の処理

    }]];

    [view presentViewController:alertController animated:YES completion:nil];
    

}

%end
*/


%hook SBIconController
// Today Viewを消すコード
-(void)setTodayViewController:(SBHomeScreenTodayViewController *)arg1{
    %orig(nil);
}




// LibraryViewを消すコード
-(void)setLibraryViewController:(SBHLibraryViewController *)arg1{
 %orig(nil);
}

 
// TodayViewとLibraryView療法を消すコード
/*
-(void)setHomeScreenOverlayController:(SBHomeScreenOverlayController *)arg1{
    %orig(nil);
}
*/


/*
%hook _UIStatusBarStringView
- (void)setText:(NSString *)arg1 {
    NSString *text = @"YOASOBI";
    %orig(text);
}

*/
%end
