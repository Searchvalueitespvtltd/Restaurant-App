//
//  GetiRestaurantsCatiteams.h
//  iRestaurants Universal
//
//  Created by Dex on 03/01/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol GetCountryListDelegete;

@interface GetiRestaurantsCatiteams : NSObject<NSXMLParserDelegate>{
    NSMutableData * webData;
    NSString * currentData;
    NSMutableArray * localCountriesArray;
    NSMutableArray * localCountriesArray1;
    id <GetCountryListDelegete> delegate;

}
//@end

@property(nonatomic, retain)id <GetCountryListDelegete> delegate;
-(void)callWebService;
-(void)startParshing:(NSData *)myData;

@end
@protocol GetCountryListDelegete

//-(void) GetName:(NSString *) name getAge:(int) age;
-(void)countryListHere:(NSMutableArray *)allCountries  getID:(NSMutableArray *)idarray  status:(BOOL)value;
@end


//
//@protocol GetCountryListDelegete;
//
//@interface GetCountryList : NSObject<NSXMLParserDelegate>{
//	
//    NSMutableData * webData;
//    NSString * currentData;
//    
//    NSMutableArray * localCountriesArray;
//	id <GetCountryListDelegete> delegate;
//    
//}
//
//@property(nonatomic, retain)id <GetCountryListDelegete> delegate;
//
//-(void)callWebService;
//-(void)startParshing:(NSData *)myData;
//
//
//@end
//
//@protocol GetCountryListDelegete
//-(void)countryListHere:(NSMutableArray *)allCountries status:(BOOL)value;
//@end
