//
//  AppDelegate.h
//  IOS_SDK
//
//  Created by satsuki on 12/07/13.
//  Copyright 2012 - 2013 STAR MICRONICS CO., LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

+ (NSString *)getPortName;
+ (void)setPortName:(NSString *)m_portName;
+ (NSString*)getPortSettings;
+ (void)setPortSettings:(NSString *)m_portSettings;

+ (NSString *)getDrawerPortName;
+ (void)setDrawerPortName:(NSString *)portName;

+ (void)setButtonArrayAsOldStyle:(NSArray *)buttons;

+ (NSString *)HTMLCSS;

@end
