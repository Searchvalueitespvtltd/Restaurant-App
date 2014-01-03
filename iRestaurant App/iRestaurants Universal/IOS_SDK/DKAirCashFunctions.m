//
//  DKAirCashFunctions.m
//  IOS_SDK
//
//  Created by u3237 on 13/06/25.
//
//

#import "DKAirCashFunctions.h"
#import <sys/time.h>
#import <StarIO/SMPort.h>

@implementation DKAirCashFunctions

/**
 * This function opens the DK-AirCash.
 * This function just send the byte 0x07 to the DK-AirCash which is the open Cash Drawer command
 * portName - Port name to use for communication. This should be (TCP:<IPAddress>)
 * portSettings - Should be blank
 */
+ (void)OpenCashDrawerWithPortname:(NSString *)portName portSettings:(NSString *)portSettings drawerNumber:(NSUInteger)drawerNumber
{
    unsigned char opencashdrawer_command = 0x00;
    
    if (drawerNumber == 1) {
        opencashdrawer_command = 0x07; //BEL
    }
    else if (drawerNumber == 2) {
        opencashdrawer_command = 0x1a; //SUB
    }
    
    NSData *commands = [NSData dataWithBytes:&opencashdrawer_command length:1];
    [self sendCommand:commands portName:portName portSettings:portSettings timeoutMillis:10000];
}

/**
 * This function checks the status of the printer.
 * The check status function can be used for both portable and non portable printers.
 * portName - Port name to use for communication. This should be (TCP:<IPAddress>)
 * portSettings - Should be blank
 */
+ (void)CheckStatusWithPortname:(NSString *)portName portSettings:(NSString *)portSettings
{
    SMPort *starPort = nil;
    @try
    {
        starPort = [SMPort getPort:portName :portSettings :10000];
        if (starPort == nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fail to Open Port"
                                                            message:@""
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            
            
           
            return;
            
            
        }
        
        StarPrinterStatus_2 status;
        [starPort getParsedStatus:&status :2];
        
        NSString *onlineStatus;
        if (status.offline == SM_TRUE) {
            onlineStatus = @"The drawer is offline";
        } else {
            onlineStatus = @"The drawer is online";
        }

        NSString *compulsionSwStatus;
        if (status.compulsionSwitch == SM_FALSE) {
            compulsionSwStatus = @"Cash Drawer: Close";
        } else {
            compulsionSwStatus = @"Cash Drawer: Open";
        }
        
        NSString *message = [NSString stringWithFormat:@"%@\n%@", onlineStatus, compulsionSwStatus];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Drawer Status"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
        return;
    }
    @catch (PortException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Printer Error"
                                                        message:@"Get status failed."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    @finally
    {
        [SMPort releasePort:starPort];
    }
}

#pragma mark Common

+ (void)sendCommand:(NSData *)commandsToPrint portName:(NSString *)portName portSettings:(NSString *)portSettings timeoutMillis:(u_int32_t)timeoutMillis
{
    int commandSize = [commandsToPrint length];
    unsigned char *dataToSentToPrinter = (unsigned char *)malloc(commandSize);
    [commandsToPrint getBytes:dataToSentToPrinter];
    
    SMPort *starPort = nil;
    @try
    {
        starPort = [SMPort getPort:portName :portSettings :timeoutMillis];
        if (starPort == nil)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fail to Open Port"
                                                            message:@""
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
            
            [prefs setObject:NULL forKey:@"DrawerPortName"];
            return;
        }
        
        StarPrinterStatus_2 status;
        [starPort beginCheckedBlock:&status :2];
        if (status.offline == SM_TRUE) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Printer is offline"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            return;
        }
        
        struct timeval endTime;
        gettimeofday(&endTime, NULL);
        endTime.tv_sec += 30;
        
        int totalAmountWritten = 0;
        while (totalAmountWritten < commandSize)
        {
            int remaining = commandSize - totalAmountWritten;
            int amountWritten = [starPort writePort:dataToSentToPrinter :totalAmountWritten :remaining];
            totalAmountWritten += amountWritten;
            
            struct timeval now;
            gettimeofday(&now, NULL);
            if (now.tv_sec > endTime.tv_sec)
            {
                break;
            }
        }
        
        if (totalAmountWritten < commandSize)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Printer Error"
                                                            message:@"Write port timed out"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
        
        [starPort endCheckedBlock:&status :2];
        if (status.offline == SM_TRUE) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Printer is offline"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            [alert release];
            return;
        }
    }
    @catch (PortException *exception)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Printer Error"
                                                        message:@"Write port timed out"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    @finally
    {
        free(dataToSentToPrinter);
        [SMPort releasePort:starPort];
    }
}
@end
