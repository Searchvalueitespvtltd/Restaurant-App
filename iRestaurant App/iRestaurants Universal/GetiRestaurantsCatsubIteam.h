//
//  GetiRestaurantsCatsubIteam.h
//  iRestaurants Universal
//
//  Created by Dex on 03/01/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol GetStatesListDelegete;

@interface GetiRestaurantsCatsubIteam : NSObject<NSXMLParserDelegate>{
	
    NSMutableData * webData;
    NSString * currentData;
    
    NSMutableArray * localStatesArray;
    NSMutableArray * localpriceStatesArray;
    NSMutableArray * localdescrStatesArray;
    NSMutableArray * localidStatesArray;
    NSMutableArray * localpreptimeStatesArray;
    NSMutableArray * localpairentcatname;
    
	id <GetStatesListDelegete> delegate;
    
}

@property(nonatomic, retain)id <GetStatesListDelegete> delegate;

-(void)callWebService:(NSInteger )country;
-(void)startParshing:(NSData *)myData;


@end

@protocol GetStatesListDelegete
-(void)stateListHere:(NSMutableArray *)allStates  getID:(NSMutableArray *)idarray getdesc:(NSMutableArray *)descArray getprepTime:(NSMutableArray *)preptimeArray getPrice:(NSMutableArray *)priceArray getpairentname:(NSMutableArray *)pairentname  status:(BOOL)value;
@end
