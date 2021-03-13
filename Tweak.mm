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


%hook SBIconController
/*
// Today Viewを消すコード
-(void)setTodayViewController:(SBHomeScreenTodayViewController *)arg1{
    %orig(nil);
}

// LibraryViewを消すコード
-(void)setLibraryViewController:(SBHLibraryViewController *)arg1{
 %orig(nil);
}
*/

// TodayViewとLibraryViewの両方を消すコード
-(void)setHomeScreenOverlayController:(SBHomeScreenOverlayController *)arg1{
    %orig(nil);
}

%end
