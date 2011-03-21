//
//  AppDelegate_iPhone.h
//  drawTools
//
//  Created by 塚越 雅斗 on 11/03/21.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate_iPhone : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UIViewController *_viewCtl;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

