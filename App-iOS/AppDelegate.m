#import "AppDelegate.h"
#import "WebController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    WebController* webController = [[WebController alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = webController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
