//
//  iRestaurantsHomeViewController.h
//  iRestaurants Universal
//
//  Created by Dex on 13/12/12.
//  Copyright (c) 2012 Dex Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iRestaurantsNewOrderViewController.h"
#import "GetiRestaurantsCatiteams.h"
#import "GetiRestaurantsCatsubIteam.h"
#import "iRestaurantsGraphViewController.h"
#import "ViewController.h"
#import "GMGridView.h"
#import <QuartzCore/QuartzCore.h>
#import "Demo1ViewController.h"

@protocol ViewAllCSCityViewDelegete;
@interface iRestaurantsHomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,GetCountryListDelegete,GetStatesListDelegete,NSXMLParserDelegate,UITextFieldDelegate,UIPrintInteractionControllerDelegate,GMGridViewDataSource, GMGridViewSortingDelegate, GMGridViewTransformationDelegate, GMGridViewActionDelegate>

{
    
       float ik;
    NSString *inStr;
    NSString * tempstore;
    NSInteger tempint;
    
    UITextField *  waiternametext;
    UITextField *  tblnotext;
    UILabel  * itemtotalprice1;
    UILabel  * itemtotalprice;
    NSMutableArray * tableiteamname;
     NSMutableArray * tableiteamnameprice;
     NSMutableArray * tblquantity;
    NSMutableArray * tblcommenttext;
    UIScrollView *categoryscrollview ;
    float allprice;
    float allprice1;
    UIView * tempView ;
   // UIView * myView;
    UIImageView *  puopbasebg;
    UIImageView *   iteambgimg;
    UIImageView *  loginareabg;
    UIImageView *  Bg;
    BOOL allorderupdatebool;
    BOOL iteampoup;
     BOOL iteampoup1;
    BOOL addsuccess;
    UIImageView * addlistbgimage;
    UITableView * tableview;
    NSMutableArray * qunatarr;
    UIImageView *   Bgimage3;
     UIImageView *   Bgimage4;
    UIButton * submitBtn ;
     UIButton * submitBtn1 ;
    UIImageView *   Bgimage1;
    UIView * HelpView;
    UIImageView * Poup_over_image;
    UIButton * closePoupbtn;
    UIImageView *   Poup_over_image_bottom;
    
    UIButton * catdescbtn;
    
    UIImageView *  Poup_over_image_top ;
    
    UITextField *   quntitynotextfield;
    UITextField *   remarktextfield;
    UIImageView *cattopimage ;
    
      UILabel *tblnodyn;
    UILabel *waiternm;
    UILabel *tblno;
    UILabel *  PoupHeaderLbl;
    UITableView * empNameTableView;
	UIActivityIndicatorView * activityIndicatoor;
    UIActivityIndicatorView * activityIndicatoorallorder;
    UIView * popUpView;
    UIImageView * popUpBgImage;
    UIButton * backButton;
       UILabel *waiternmdyn;
    NSMutableArray * countryNamesArray;
    NSMutableArray * idnamearray;
    NSMutableArray * statesNameArray;
    NSMutableArray * citynamesArray;
    NSMutableArray * pairentnamearr;
    UILabel * catdetailcatname;
    NSString * currentSelectedState;
    UIScrollView *  subcatscroll;
     NSMutableArray * idarrays;
    NSMutableArray * descArrays;
    NSMutableArray * preptimeArrays;
    NSMutableArray * priceArrays;
    NSMutableArray * tbliteamid;
     GetiRestaurantsCatsubIteam * statesList;
    
    NSString * tableno;
    NSString * watname;
    
    //temp webservice
     NSMutableArray * ordarstatusarr;
    NSMutableArray * tablenoarr;
    NSMutableArray * waiternamearr;
    NSMutableArray * ordernamearr;
    NSMutableArray * finalArray;
    BOOL  callfun;
    NSMutableArray * orderidarr;
    UILabel * cellpricelbl;
    NSMutableData * webData;
	NSMutableString * soapResults;
	NSXMLParser * xmlParser;
	UIActivityIndicatorView *indicator;
  //  UITableView * tableview;
    NSString * soapMessage;
   	NSURL * url ;
    NSString * stringval;
    
    NSMutableArray * orderidarr121;
    NSMutableArray * updateorderid;
    BOOL relodtbl;
     UILabel  * detailpoupquantity;
    UIButton * paymentbtn;
    //For store table cell data Purpose Urgent Develery app Jan 28 2013
    NSMutableArray * allpricearr;
    NSMutableArray * temptableiteamname;
    NSMutableArray *  temptableiteamnameprice;
    NSMutableArray *  temptblquantity ;
    NSMutableArray *  temptblcommenttext;
    NSMutableArray *   temptbliteamid;
    NSMutableArray *   tempupdateorderid;
   
    BOOL Card_Success;
    BOOL Cash_Sucees;
    //Payment puop parameter
    UIImageView *poupbgmain;
    UIImageView *smallpoupbg;
    UILabel * smallpouptitlemsg;
    UIButton * cardpaymentoptionbtn;
    UIButton * cashpaymentoptionbtn;
    UIButton * cancelpoupcornerbtn;
    UIButton * dininbtn;
    UIButton * takewaybtn;
    UIButton *cateringbtn;
    UIButton *smallQtyBtn;
    UIButton *mediumQtyBtn;
    UIButton *largeQtyBtn;
    
    
    UITextField * tokennotext;
    UILabel * ordertypelbl;
    UITextField *  recepttextfield;
    UIButton * cancelcardbtn;
    UITextField *  amtPaybalelbltxt;
    NSMutableArray * tokenarr;
    NSMutableArray *timearr;
    id <ViewAllCSCityViewDelegete> delegate;
    UIButton * printinactivebtn;
    UIImageView *roworder;
    UIButton * clickrowbtn;
    UIView *backgroundImage;
     UILabel * Timerlbl;
    
    
    
    
//grid view variables
     __gm_weak GMGridView *_gmGridView;
     __gm_weak NSMutableArray *_currentData;
}

- (void)callWebService1:(id)sender;


//@property(nonatomic, retain)UITableView * empNameTableView;
//@property(nonatomic, retain)UIActivityIndicatorView * activityIndicatoor;
@property(nonatomic, retain)id <ViewAllCSCityViewDelegete> delegate;
@property(nonatomic, retain) NSString * tablenoglob;
@property(nonatomic, assign) BOOL clickableBtn;
//-(void)backbuttonAction;

@end

//@protocol ViewAllCSCityViewDelegete
//-(void)cityNameHere:(NSString *)city stateIs:(NSString *)state;
//@end