//
//  DKAirCashFunctions.h
//  IOS_SDK
//
//  Created by u3237 on 13/06/25.
//
//

#import <Foundation/Foundation.h>

@interface DKAirCashFunctions : NSObject

#pragma mark Open Cash Drawer

+ (void)OpenCashDrawerWithPortname:(NSString *)portName
                      portSettings:(NSString *)portSettings
                      drawerNumber:(NSUInteger)drawerNumber;

#pragma mark Check Status

+ (void)CheckStatusWithPortname:(NSString *)portName
                   portSettings:(NSString *)portSettings;

@end
