//
//  iRestaurantsGraphViewController.h
//  iRestaurants Universal
//
//  Created by Dex on 16/02/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iRestaurantsGraphViewController : UIViewController<NSXMLParserDelegate>
{

    
    NSMutableData *webData;
	NSMutableString *soapResults;
	NSXMLParser *xmlParser;
	UIActivityIndicatorView *indicator;
    UILabel *   stockdetail;
	NSMutableArray *idArray;
	NSMutableArray *textArray;
	NSURL * url ;
	NSString * choiceString;
    NSString * soapMessage;
    NSString * username;
    NSString *  password;
    BOOL IsSaleview;
    BOOL IsStockview;
  UILabel * SaleCityNamedateLable;
    int loopval;
    NSString * datesendtoparse;
    UIImageView * detailgraphbgimage;
     //NSMutableArray *IDarr;
     NSMutableArray *TOTALarr;
     NSMutableArray *NAMEarr;
    UIView * indicatorbgview;
     NSMutableArray *dayarr;
    UIImageView * weekdaybarbg;
UIImageView * MainFooterImg;
UIImageView * HeaderImg;
UILabel* SalesRevenuelbl;
UILabel* StockFGlbl;


UIImageView * BgImage;
UIScrollView *Salescroll ;
UIScrollView *stockscroll;
UIImageView * _CreaditorGrphImg;
UIImageView * _DebitorsGrphImg;
UIImageView * _CollectionGrphImg;


UIImageView * SaleBarGraphImage;
UIImageView * StockBarGraphImage;
UIImageView * SaleBarHighlighterImg;

UILabel * SaleScaleGraphBarLabel;
UILabel * StockScaleGraphBarLabel;
UILabel * saleValBarDisplaylbl;
UILabel * stockValBarDisplaylbl;
UILabel * SaleCityNameLable;
UILabel * StockCityNameLable;
UILabel*   SalesOVerStatusLbl ;
UILabel*   StockOVerStatusLbl ;
UILabel*   CreditorScaleGraphBarLabel ;
    UIActivityIndicatorView * activityIndicatoorallorder;
    UIImageView *  Poup_over_image_top ;

NSMutableArray * SaleValueArray;
NSMutableArray * SaleCityNameArray;
NSMutableArray * stockValueArray;    
NSMutableArray * stockCityArray;
  
    UIImageView *  Poup_over_image_top2 ;
    
    NSMutableArray * StockNameArr;
    NSMutableArray * StockTotalArr;
   
    
    NSMutableArray * salePriceArr;
    NSMutableArray * saleDateArr;
    NSMutableArray * saleDayArr;
      
    
    
NSInteger SaleBarGraphAnimationTagVal;
NSInteger StockBarGraphAnimationTagVal;
NSInteger SaleBarGraphHiddenBtnTagVal;
NSInteger StockBarGraphHiddenBtnTagVal;
NSInteger SaleBarGraphTagValDsplyTag;
NSInteger StockBarGraphTagValDsplyTag;


CGFloat SaleDefaultX;
CGFloat StockDefaultX;
CGFloat xPositionSaleBarGraph;
CGFloat xPositionSaleBarGraphHiddenBtn;
CGFloat xPositionStockBarGraph;
CGFloat xPositionStockBarGraphHiddenBtn;
CGFloat xPositionSaleValueDisplyBarGraphlbl;
CGFloat xPositionStockValueDisplyBarGraphlbl;


UIButton * SaleBarGraphHiddenBtn;
UIButton * StockBarGraphHiddenBtn;
UIButton * logoutbtn;

}
@property (strong, nonatomic) UIWebView * _SaleBlockView;
@property (strong, nonatomic)  UIImageView *SaleBarGraphImage;

@property (nonatomic, readwrite)   NSInteger SaleBarGraphAnimationTagVal;
@property (nonatomic, readwrite)  NSInteger value;
@property (nonatomic, readwrite) NSInteger StockBarGraphAnimationTagVal;
@property (nonatomic, readwrite) NSInteger SaleBarGraphHiddenBtnTagVal;
@property (nonatomic, readwrite) NSInteger SaleBarGraphTagValDsplyTag;
@property (nonatomic, readwrite) NSInteger StockBarGraphHiddenBtnTagVal;


-(void)AllArrayFunctions;
-(void)GenerateSaleViewBlockGraphFunction;
-(void)GenerateStockViewBlockGraphFunction;
-(void)SaleBarGraphWithAnimationFunction;
-(void)StockBarGraphWithAnimationFunction;
-(void)SaleBarGraphHiddenAnimationBtnFunction;
-(void)GenerateAllUIScrollViewInLandingView;
-(void)ChangeAndDisplayOnClicSaleStockCityValue;
-(void)GenerateAllGraphScaleDynamicFunction;
-(void)StockBarGraphHiddenAnimationBtnFunction;
-(void)SaleBarGraphEachBarValueDisplay;
-(void)StockBarGraphEachBarValueDisplay;



-(void)JUNKFUN1;
@end
