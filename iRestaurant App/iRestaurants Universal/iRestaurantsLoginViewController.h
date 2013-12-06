//
//  iRestaurantsLoginViewController.h
//  iRestaurants Universal
//
//  Created by Dex on 13/12/12.
//  Copyright (c) 2012 Dex Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iRestaurantsHomeViewController.h"
@interface iRestaurantsLoginViewController : UIViewController< UITextFieldDelegate ,NSXMLParserDelegate>

{
    UITextField *   waiternametext;
    UITextField *   tblnotext;
    
    NSMutableData *webData;
	NSMutableString *soapResults;
	NSXMLParser *xmlParser;
	UIActivityIndicatorView *indicator;
    
	NSMutableArray *idArray;
	NSMutableArray *textArray;
	NSURL * url ;
	NSString * choiceString;
    NSString * soapMessage;
    NSString * username;
    NSString *  password;
    BOOL userloginstatus;
    

}

@property (strong, nonatomic) iRestaurantsHomeViewController * irestaurantsHomeViewController;

@end