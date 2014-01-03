//
//  iRestaurantsAppDelegate.h
//  iRestaurants Universal
//
//  Created by Dex on 13/12/12.
//  Copyright (c) 2012 Dex Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "iRestaurantsLoginViewController.h"
//#import "iRestaurantsHomeViewController.h"


#import "iRestaurantsLoginViewController.h"
@interface iRestaurantsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) iRestaurantsLoginViewController * irestaurantsLoginViewController;
@property (strong, nonatomic) UINavigationController * navController;
+ (NSString *)getPortName;
+ (void)setPortName:(NSString *)m_portName;
+ (NSString*)getPortSettings;
+ (void)setPortSettings:(NSString *)m_portSettings;

+ (NSString *)getDrawerPortName;
+ (void)setDrawerPortName:(NSString *)portName;

+ (void)setButtonArrayAsOldStyle:(NSArray *)buttons;

+ (NSString *)HTMLCSS;
@end
