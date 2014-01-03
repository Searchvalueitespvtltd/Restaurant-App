//
//  iRestaurantsHomeViewController.m
//  iRestaurants Universal
//
//  Created by Dex on 13/12/12.
//  Copyright (c) 2012 Dex Consulting. All rights reserved.
//

#import "iRestaurantsHomeViewController.h"
#import "iRestaurantsLoginViewController.h"
#import "DKAirCashFunctions.h"
#import "rasterPrinting.h"
#import "MiniPrinterFunctions.h"
#import "PrinterFunctions.h"
NSString * waitername;
NSString * currentwaitername;

NSInteger currenttblname;
BOOL stopdoublselection;
NSString * updatepaymentIDval;
NSString * billingpriceall;
NSInteger updatepricetag;
BOOL Is_Cashier;
NSString * actualpriceupdatebigpoup;
BOOL IShidden;

#define MAX_LENGTH 2
#define COLUMN 3
#define WIDTH 120
#define HEIGHT 100
#define MARGIN 20

#define COLUMNd 3
#define WIDTHd 120
#define HEIGHTd 100
#define MARGINd 18



@interface iRestaurantsHomeViewController ()

@end

@implementation iRestaurantsHomeViewController

@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    tempint=1;
    //inStr = @"1.00";
    //temp service
    ordarstatusarr = [[NSMutableArray alloc] init];
    tablenoarr = [[NSMutableArray alloc] init];
	waiternamearr = [[NSMutableArray alloc] init];
    tokenarr = [[NSMutableArray alloc] init];
    timearr= [[NSMutableArray alloc] init];
    ordernamearr = [[NSMutableArray alloc] init];
    finalArray = [[NSMutableArray alloc] init];
    orderidarr = [[NSMutableArray alloc] init];
    allpricearr = [[NSMutableArray alloc] init];
    orderidarr121 = [[NSMutableArray alloc] init];
    
    tableiteamname = [[NSMutableArray alloc] init];
    tableiteamnameprice = [[NSMutableArray alloc] init];
    tblquantity = [[NSMutableArray alloc] init];
    tblcommenttext = [[NSMutableArray alloc] init];
    tbliteamid = [[NSMutableArray alloc] init];
    updateorderid = [[NSMutableArray alloc] init];
    // priceArrays = [[NSMutableArray alloc] init];
    
    
    //Temporary store data
    temptableiteamname = [[NSMutableArray alloc] init];
    temptableiteamnameprice = [[NSMutableArray alloc] init];
    temptblquantity = [[NSMutableArray alloc] init];
    temptblcommenttext = [[NSMutableArray alloc] init];
    temptbliteamid = [[NSMutableArray alloc] init];
    tempupdateorderid = [[NSMutableArray alloc] init];
    
    
    
    //    tablenoglob,waitername
    
    
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    //self.view.backgroundColor = [UIColor lightGrayColor];
    
    Bg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 1024, 768)];
    [Bg setImage:[UIImage imageNamed:@"main-bg"]];
    Bg.opaque = YES;
    Bg.userInteractionEnabled=TRUE;
    [self.view addSubview:Bg];
    
    
    
    
    
    //    waiternm = [[UILabel alloc] initWithFrame:CGRectMake(480,25,200,25)];
    //    waiternm.text =@"Waiter Name: ";
    //    // waiternm = UITextAlignmentCenter;
    //    waiternm.backgroundColor = [UIColor clearColor];
    //    waiternm.textColor =[UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    //    waiternm.font=[UIFont fontWithName:@"Arial" size:(22)];
    //    [Bg addSubview:waiternm];
    
    
    //    waiternmdyn = [[UILabel alloc] initWithFrame:CGRectMake(620,25,250,25)];
    //    waiternmdyn.text =[NSString stringWithFormat:@"%@",waitername ];
    //    // waiternm = UITextAlignmentCenter;
    //    waiternmdyn.backgroundColor = [UIColor clearColor];
    //    waiternmdyn.textColor =[UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    //    waiternmdyn.font=[UIFont fontWithName:@"Arial" size:(20)];
    //    [Bg addSubview:waiternmdyn];
    
    
    
    
    //    tblno = [[UILabel alloc] initWithFrame:CGRectMake(850,25,130,25)];
    //    tblno.text =@"Table No: ";
    //    // waiternm = UITextAlignmentCenter;
    //    tblno.backgroundColor = [UIColor clearColor];
    //    tblno.textColor =[UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    //    tblno.font=[UIFont fontWithName:@"Arial" size:(22)];
    //    [Bg addSubview:tblno];
    
    //
    //    tblnodyn = [[UILabel alloc] initWithFrame:CGRectMake(949,25,70,25)];
    //    tblnodyn.text =[NSString stringWithFormat:@"%@",tablenoglob ];
    //    // waiternm = UITextAlignmentCenter;
    //    tblnodyn.backgroundColor = [UIColor clearColor];
    //    tblnodyn.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    //    tblnodyn.font=[UIFont fontWithName:@"Arial" size:(20)];
    //    [Bg addSubview:tblnodyn];
    
    
    
    
    iteambgimg = [[[UIImageView alloc] init]autorelease] ;
    iteambgimg.Frame=CGRectMake(452,72, 565.5,600.5);
    [iteambgimg setImage:[UIImage imageNamed:@"iteambg.png"]];
    iteambgimg.opaque = YES;
    // iteambgimg.hidden=TRUE
    iteambgimg.userInteractionEnabled=TRUE;
    [Bg addSubview:iteambgimg];
    
    
    CGRect scrollRect =  CGRectMake(0, 78, 565.5, 500.5);
    subcatscroll = [[[UIScrollView alloc] initWithFrame:scrollRect]autorelease];
    subcatscroll.contentSize = CGSizeMake(565.5, 830);
    // categoryscrollview.hidden=FALSE;
    [iteambgimg addSubview:subcatscroll];
    
    UIImageView * allorderbglogo = [[[UIImageView alloc] initWithFrame:CGRectMake(422,15,150,40)]
                                    autorelease];
    [allorderbglogo setImage:[UIImage imageNamed:@"logo.png"]];
    allorderbglogo.opaque = YES;
    [Bg addSubview:allorderbglogo];
    
    UIButton * settingbtn_printer =[UIButton buttonWithType:UIButtonTypeCustom];
	settingbtn_printer.frame=CGRectMake(834,18,37.5,38.5);
    [settingbtn_printer setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"PrinterSetting-icon" ofType:@"png"]] forState:UIControlStateNormal];
	[settingbtn_printer addTarget:self action:@selector(printerSettings) forControlEvents:UIControlEventTouchUpInside];
	[Bg addSubview:settingbtn_printer];
    
    
    UIButton * settingbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	settingbtn.frame=CGRectMake(890,18,37.5,38.5);
    [settingbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"setting-icon" ofType:@"png"]] forState:UIControlStateNormal];
	[settingbtn addTarget:self action:@selector(placeNewOrder) forControlEvents:UIControlEventTouchUpInside];
	[Bg addSubview:settingbtn];
    
    
    
    
    UIButton * listbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	listbtn.frame=CGRectMake(946,18,37.5,38.5);
    [listbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"list-icon" ofType:@"png"]] forState:UIControlStateNormal];
  	[listbtn addTarget:self action:@selector(graphview) forControlEvents:UIControlEventTouchUpInside];
	[Bg addSubview:listbtn];
    
    
    activityIndicatoor = [[[UIActivityIndicatorView alloc]init]autorelease] ;
    activityIndicatoor.frame=CGRectMake(210, 260,40, 40);
    activityIndicatoor.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [activityIndicatoor setColor:[UIColor blackColor]];
	activityIndicatoor.hidesWhenStopped = YES;
    
    activityIndicatoorallorder = [[[UIActivityIndicatorView alloc]init]autorelease] ;
    activityIndicatoorallorder.frame=CGRectMake(210, 260,40, 40);
    activityIndicatoorallorder.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [ activityIndicatoorallorder setColor:[UIColor blackColor]];
    activityIndicatoorallorder.hidesWhenStopped = YES;
    
    
    
    //Call method for display only main category iteam
    
    [self category_view_method];
    
    
    //Call method for display only table add order list
    [self add_order_list_method];
    
    UILabel * catdetailItems;
    catdetailItems = [[[UILabel alloc] initWithFrame:CGRectMake(7,22,80,30)] autorelease];
    catdetailItems.text = @"Items:";
    catdetailItems.textAlignment = 0;
    catdetailItems.backgroundColor = [UIColor clearColor];
    catdetailItems.font=[UIFont fontWithName:@"Arial" size:(27)];
    catdetailItems.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [iteambgimg addSubview:catdetailItems];
    
    
    
    catdetailcatname = [[[UILabel alloc] initWithFrame:CGRectMake(87,24,480,30)] autorelease];
    catdetailcatname.text = @"";
    catdetailcatname.textAlignment = 0;
    catdetailcatname.backgroundColor = [UIColor clearColor];
    catdetailcatname.font=[UIFont fontWithName:@"Arial" size:(24)];
    catdetailcatname.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [iteambgimg addSubview:catdetailcatname];
    
    
#pragma Click to go All Order Poup View
    
    UIButton * AllorderBtn =[UIButton buttonWithType:UIButtonTypeCustom];
	AllorderBtn.frame=CGRectMake(35,718,174, 47);
    [AllorderBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"all-orders" ofType:@"png"]] forState:UIControlStateNormal];
    AllorderBtn.tag=121;
  	[AllorderBtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
	[Bg addSubview:AllorderBtn];
    
#pragma Call Method Delegate for get Category iteams with ID
    
    GetiRestaurantsCatiteams * gcl = [[GetiRestaurantsCatiteams alloc] init];
    gcl.delegate = self;
    [gcl callWebService];
    [activityIndicatoor startAnimating];
    
    
    
    // Initialization code
    
    NSString * aa;
    aa=[NSString stringWithFormat:
        @"121"];
    [self callWebService1:Nil];
    
    
    
    
  	// Do any additional setup after loading the view.
}


-(void)printerSettings
{
    ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
    
}

-(void)graphview{
    
    
    iRestaurantsGraphViewController * graphview=[[iRestaurantsGraphViewController alloc]init];
    [self.navigationController pushViewController:graphview animated:YES];
    [graphview release];
    
}



//Temporary call webservice

-(void)callWebService1:(id)sender{
    NSInteger popupTag = ((UIButton *)sender).tag;
    
    
    NSLog(@"dheerajsingh %d",popupTag);
    
    if (popupTag==121 || popupTag==0) {
        callfun=TRUE;
        waiternmdyn.hidden=TRUE;
        tblnodyn.hidden=TRUE;
        waiternm.hidden=TRUE;
        tblno.hidden=TRUE;
        
        if(ordarstatusarr)
            [ordarstatusarr removeAllObjects];
        if(tablenoarr)
            [tablenoarr removeAllObjects];
        if(tokenarr)
            [tokenarr removeAllObjects];
        if(waiternamearr)
            [waiternamearr removeAllObjects];
        if(ordernamearr)
            [ordernamearr removeAllObjects];
        if(timearr)
            [timearr removeAllObjects];
        
        //Start setup area for all order before load parsing data
        
        categoryscrollview.hidden=TRUE;
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0,68,1024,700)] ;
        tempView.opaque = YES;
        tempView.hidden=FALSE;
        tempView.backgroundColor=[UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
        [Bg addSubview:tempView];
        
        UIImageView * allorderbg = [[[UIImageView alloc] initWithFrame:CGRectMake(0,1, 1025,614)]
                                    autorelease];
        [allorderbg setImage:[UIImage imageNamed:@"allordertable-bg.png"]];
        allorderbg.opaque = YES;
        [tempView addSubview:allorderbg];
        
        
        //        UIImageView * allorderbglogo = [[[UIImageView alloc] initWithFrame:CGRectMake(425,-45,150,40)]
        //                                    autorelease];
        //        [allorderbglogo setImage:[UIImage imageNamed:@"logo.png"]];
        //        allorderbglogo.opaque = YES;
        //        [allorderbg addSubview:allorderbglogo];
        
        //        //DISPLAY LABEL VALUE WHEN SALE BAR GRAPH TOUCHED
        //        UILabel *  navbartoplbl = [ [UILabel alloc ] initWithFrame:CGRectMake(375,-10,305,40)];
        //        navbartoplbl.textAlignment =  UITextAlignmentLeft;
        //        navbartoplbl.textColor = [UIColor lightGrayColor];
        //        navbartoplbl.numberOfLines=1;
        //        navbartoplbl.text = @"Restaurant Operating System";
        //        navbartoplbl.backgroundColor = [UIColor clearColor];
        //        navbartoplbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:(18.0)];
        //        [allorderbg addSubview:navbartoplbl];
        
        
        
        
        
        
        
        UILabel *allordertitle;
        allordertitle = [[[UILabel alloc] initWithFrame:CGRectMake(75,15,200,36)]autorelease];
        allordertitle.text = @"Order List";
        allordertitle.textAlignment =0;
        allordertitle.backgroundColor = [UIColor clearColor];
        allordertitle.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
        allordertitle.font=[UIFont fontWithName:@"Arial-BoldMT" size:(22.0f)];
        [allorderbg addSubview:allordertitle];
        
        UIImageView *allorderheadbar = [[[UIImageView alloc] initWithFrame:CGRectMake(8,74, 1008,55)]autorelease];
        [allorderheadbar setImage:[UIImage imageNamed:@"heading-top.png"]];
        allorderheadbar.opaque = YES;
        [allorderbg addSubview:allorderheadbar];
        
        UILabel *allorderdetailrow;
        allorderdetailrow = [[[UILabel alloc] initWithFrame:CGRectMake(0,15,1020,30)]autorelease];
        allorderdetailrow.text = @"  Waiter/Cashier Name            Table/Token Number            Order Status            Time            Payment            Print Detail";
        allorderdetailrow.textAlignment = 0;
        allorderdetailrow.backgroundColor = [UIColor clearColor];
        allorderdetailrow.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
        allorderdetailrow.font=[UIFont fontWithName:@"Arial-BoldMT" size:(18.0f)];
        [allorderheadbar addSubview:allorderdetailrow];
        
        UIButton * AllOrderhiddenBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        AllOrderhiddenBtn.frame=CGRectMake(35,653,174, 47);
        [AllOrderhiddenBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"all-orders" ofType:@"png"]] forState:UIControlStateNormal];
        [AllOrderhiddenBtn addTarget:self action:@selector(all_order_Hidden_Action) forControlEvents:UIControlEventTouchUpInside];
        [tempView addSubview:AllOrderhiddenBtn];
        
        
        activityIndicatoorallorder.frame=CGRectMake(495, 300,40, 40);
        [activityIndicatoorallorder startAnimating];
        [tempView addSubview:activityIndicatoorallorder];
        
        
        if([orderidarr count] < 1) { stringval= @"";
            
        }
        else
            stringval= [orderidarr objectAtIndex:0];
        
        soapMessage = [NSString stringWithFormat:
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                       "<soap:Body>"
                       // "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?details\"/>"
                       "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?details&utype=1\"/>"
                       "</soap:Body>"
                       "</soap:Envelope>"];
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?details&utype=1"]];
    }
#pragma Webservice for Add/Submit Order to server
    else if (popupTag==212){
        
        if(temptableiteamname){[temptableiteamname removeAllObjects];}
        if(temptableiteamnameprice){[temptableiteamnameprice removeAllObjects];}
        if(temptblquantity){[temptblquantity removeAllObjects];}
        if(temptblcommenttext){[temptblcommenttext removeAllObjects];}
        if(temptbliteamid){[temptbliteamid removeAllObjects];}
        
        temptableiteamname=[tableiteamname mutableCopy];
        temptableiteamnameprice=[tableiteamnameprice mutableCopy];
        temptblquantity=[tblquantity mutableCopy];
        temptblcommenttext=[tblcommenttext mutableCopy];
        temptbliteamid=[tbliteamid mutableCopy];
        
        
        NSLog(@"temptableiteamname %@",temptableiteamname);
        
        
        //Set boolean value mean when first time submit record on table to server than submit change to update
        allorderupdatebool=TRUE;
        
        UIButton * addtoservertblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        addtoservertblbtn.frame=CGRectMake(400, 550,138.5, 30);
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"update" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=213;
        if([tableiteamname count]>0){
            
            [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
        }
        else{
            
            [addtoservertblbtn addTarget:self action:@selector(NullmsgAlert) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [addlistbgimage addSubview:addtoservertblbtn];
        
        
        
        [activityIndicatoor startAnimating];
        
        if(finalArray){
            [finalArray removeAllObjects];
        }
        
        for(int a=0; a<[tableiteamnameprice count]; a++){
            
            [finalArray addObject:[NSString stringWithFormat:@"%@,%@,%@",[tbliteamid objectAtIndex:a],[tblquantity objectAtIndex:a],[tblcommenttext objectAtIndex:a],nil]];
        }
        
        
        NSLog(@"Submit %@",finalArray);
          NSLog(@"tablenoglob %@",self.tablenoglob);
        
        NSString *newString  =[finalArray componentsJoinedByString:@";"];
        stringval=@"";
        stringval= [newString stringByReplacingOccurrencesOfString:@" " withString:@":::"];
        
        NSLog(@"stringval--- %@",stringval);
        
        if (Is_Cashier) {
            Is_Cashier=FALSE;
            soapMessage = [NSString stringWithFormat:
                           @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                           "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                           "<soap:Body>"
                           "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%@&wname=%@&token=1/\"/>"
                           "</soap:Body>"
                           "</soap:Envelope>",stringval,self.tablenoglob,waitername];
            
            
            
            url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%@&wname=%@&token=1",stringval,self.tablenoglob,waitername]];
            
            
            
        }
        else{
            
            soapMessage = [NSString stringWithFormat:
                           @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                           "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                           "<soap:Body>"
                           "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%@&wname=%@&token=0/\"/>"
                           "</soap:Body>"
                           "</soap:Envelope>",stringval,self.tablenoglob,waitername];
            
            
            
            url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%@&wname=%@&token=0",stringval,self.tablenoglob,waitername]];
        }
        
        NSLog(@"Token, %@",url);
        
    }
    else if (popupTag==213){
        //When table bottom is UPDATE CONDITION
        
        if(temptableiteamname){[temptableiteamname removeAllObjects];}
        if(temptableiteamnameprice){[temptableiteamnameprice removeAllObjects];}
        if(temptblquantity){[temptblquantity removeAllObjects];}
        if(temptblcommenttext){[temptblcommenttext removeAllObjects];}
        if(temptbliteamid){[temptbliteamid removeAllObjects];}
        
        temptableiteamname=[tableiteamname mutableCopy];
        temptableiteamnameprice=[tableiteamnameprice mutableCopy];
        temptblquantity=[tblquantity mutableCopy];
        temptblcommenttext=[tblcommenttext mutableCopy];
        temptbliteamid=[tbliteamid mutableCopy];
        //tempupdateorderid
        
        
        if(finalArray){
            [finalArray removeAllObjects];
        }
        
        
        
        for(int a=0; a<[tableiteamnameprice count]; a++){
            
            [finalArray addObject:[NSString stringWithFormat:@"%@,%@,%@",[tbliteamid objectAtIndex:a],[tblquantity objectAtIndex:a],[tblcommenttext objectAtIndex:a],nil]];
        }
        NSString * updateitmorderid;
        
        updateitmorderid=[updateorderid objectAtIndex:0];
        
        if(tempupdateorderid){
            [tempupdateorderid removeAllObjects];
        }
        
        tempupdateorderid=[updateorderid mutableCopy];
        
        
        
        NSLog(@"updateitmorderidupdateorderid--- %@",updateitmorderid);
        
        NSLog(@"FFFFFFFF--- %@",finalArray);
        
        NSString *newString  =[finalArray componentsJoinedByString:@";"];
        stringval=@"";
        stringval= [newString stringByReplacingOccurrencesOfString:@" " withString:@":::"];
        
        NSLog(@"stringval--- %@,updateitmorderid%@",stringval,updateitmorderid);
        
        
        
        soapMessage = [NSString stringWithFormat:
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                       "<soap:Body>"
                       "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%d&wname=%@&id=%@&token=1/\"/>"
                       "</soap:Body>"
                       "</soap:Envelope>",stringval,currenttblname,currentwaitername,updateitmorderid];
        
        
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%d&wname=%@&id=%@&token=1",stringval,currenttblname,currentwaitername,updateitmorderid]];
        
        NSLog(@"Update url %@",url);
        
    }
    
  	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
	
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
	[theRequest setHTTPMethod:@"POST"]; //Method
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
	
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
	
	NSLog(@"con Soap MSG %@",soapMessage);
	
	if( theConnection )	{
        
        if(tablenoarr){
            [tablenoarr removeAllObjects];
        }
        if(tableiteamname){
            [tableiteamname removeAllObjects];
        }
        if(tblquantity){
            [tblquantity removeAllObjects];
        }
        if(tblcommenttext){
            [tblcommenttext removeAllObjects];
        }
        if(updateorderid){
            [updateorderid removeAllObjects];
        }
        if(tbliteamid){
            [tbliteamid removeAllObjects];
        }
        if(allpricearr){
            [allpricearr removeAllObjects];
        }
        if(orderidarr121){
            [orderidarr121 removeAllObjects];
        }
        if(tableiteamnameprice){
            [tableiteamnameprice removeAllObjects];
        }
        if(timearr){
            [timearr removeAllObjects];
        }
        
        
        
		webData = [[NSMutableData data] retain];
    }
	else
    {
        NSLog(@"theConnection is NULL");
    }
	
    
    
    
    tableiteamname=[temptableiteamname mutableCopy];
    tableiteamnameprice=[temptableiteamnameprice mutableCopy];
    tblquantity=[temptblquantity mutableCopy];
    tblcommenttext=[temptblcommenttext mutableCopy];
    tbliteamid=[temptbliteamid mutableCopy];
    
    NSLog(@"theConnectiowsL %@",tableiteamname);
    
    [tableview reloadData];
    
    activityIndicatoor.frame=CGRectMake(270, 140,40, 40);
    [activityIndicatoor startAnimating];
    [tableview addSubview:activityIndicatoor];
    
    
    
}

-(void)serviceclickallordercell:(id)sender{
    
    
    if ([sender tag] !=999999) {
        [sender setSelected:YES];
        
        backgroundImage=[[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width)];
        [backgroundImage setBackgroundColor:[UIColor grayColor]];
        [backgroundImage setAlpha:0.5];
        [backgroundImage setHidden:NO];
        [self.view addSubview:backgroundImage];
        activityIndicatoorallorder.frame=CGRectMake(495, 358,40, 40);
        [activityIndicatoorallorder startAnimating];
        [self.view  addSubview:activityIndicatoorallorder];
        
        allorderupdatebool=TRUE;
        NSInteger temptag = ((UIButton *)sender).tag;
        temptag=temptag-100;
        NSLog(@"serviceclickallordercell %@",[orderidarr121 objectAtIndex:temptag]);
        
        
        //Used condion for categores item double click block / multiple btn selection
        if(!stopdoublselection){
            stopdoublselection=TRUE;
            
            // if(popupTag==101){
            NSInteger orderidtemp= [[orderidarr121 objectAtIndex:temptag] integerValue];
            currentwaitername =[waiternamearr objectAtIndex:temptag];
            currenttblname=[[tablenoarr objectAtIndex:temptag] integerValue];
            
            UIButton * addtoservertblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
            addtoservertblbtn.frame=CGRectMake(400, 550,138.5, 30);
            if(allorderupdatebool){
                
                [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"update" ofType:@"png"]] forState:UIControlStateNormal];
                addtoservertblbtn.tag=213;
                if([tableiteamname count]>0){
                    
                    [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
                }
                else{
                    
                    [addtoservertblbtn addTarget:self action:@selector(NullmsgAlert) forControlEvents:UIControlEventTouchUpInside];
                }
                
                
            }
            else{
                [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-order" ofType:@"png"]] forState:UIControlStateNormal];
                addtoservertblbtn.tag=212;
                
                [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
            }
            
            
            
            [addlistbgimage addSubview:addtoservertblbtn];
            
            
            
            //  tablenoglob=currenttblname;
            
            NSLog(@"allorder item click id:-  %d", currenttblname=[[tablenoarr objectAtIndex:temptag] integerValue]);
            
            
            relodtbl=TRUE;
            
            if(tablenoarr){
                [tablenoarr removeAllObjects];
            }
            if(tableiteamname){
                [tableiteamname removeAllObjects];
            }
            if(tblquantity){
                [tblquantity removeAllObjects];
            }
            if(tblcommenttext){
                [tblcommenttext removeAllObjects];
            }
            if(tbliteamid){
                [tbliteamid removeAllObjects];
            }
            if(updateorderid){
                [updateorderid removeAllObjects];
            }
            if(allpricearr){
                [allpricearr removeAllObjects];
            }
            if(orderidarr121){
                [orderidarr121 removeAllObjects];
            }
            if(tableiteamnameprice){
                [tableiteamnameprice removeAllObjects];
            }
            if (timearr) {
                [timearr removeAllObjects];
            }
            
            soapMessage = [NSString stringWithFormat:
                           @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                           "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                           "<soap:Body>"
                           "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?id=%d&status/\"/>"
                           "</soap:Body>"
                           "</soap:Envelope>",orderidtemp];
            
            
            url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?id=%d&status",orderidtemp]];
            
            NSLog(@"URL %@",url);
            
            // }
            
            NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
            NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
            
            [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
            [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
            [theRequest setHTTPMethod:@"POST"]; //Method
            [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
            
            NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
            
            NSLog(@"con Soap MSG %@",soapMessage);
            
            if( theConnection )	{
                webData = [[NSMutableData data] retain];}
            else	{
                NSLog(@"theConnection is NULL");}
            
        }
        
        

    }
    
    
}


////////

#pragma update cardpayment receipt or cash payment record service

-(void)callwebserviceforupdatepayment:(id)sender{
    NSInteger Paymenttag = ((UIButton *)sender).tag;
    NSLog(@"dheerajsinghff %d",Paymenttag);
    
    if (Paymenttag==222 ) {
        
        stringval= recepttextfield.text;
        
        soapMessage = [NSString stringWithFormat:
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                       "<soap:Body>"
                       // "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?details\"/>"
                       "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?id=%@&MAC=1&payamt=%@&paytype=CreditCard\"/>"
                       "</soap:Body>"
                       "</soap:Envelope>",updatepaymentIDval,stringval];
        
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?id=%@&MAC=1&payamt=%@&paytype=CreditCard",updatepaymentIDval,stringval]];
        
        
    	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
        [theRequest setHTTPMethod:@"POST"]; //Method
        [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
        
        NSLog(@"con Soap MSG %@",soapMessage);
        
        if( theConnection )	{
            Card_Success=TRUE;
            [self cancelpaymentpoupaction:Nil];
            webData = [[NSMutableData data] retain];}
        else	{
            NSLog(@"theConnection is NULL");}
    }
    else if (Paymenttag==333 ) {
        
        stringval= amtPaybalelbltxt.text;
        
        soapMessage = [NSString stringWithFormat:
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                       "<soap:Body>"
                       "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?id=%@&MAC=1&payamt=%@&paytype=CashPayment\"/>"
                       "</soap:Body>"
                       "</soap:Envelope>",updatepaymentIDval,stringval];
        
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?id=%@&MAC=1&payamt=%@&paytype=CashPayment",updatepaymentIDval,stringval]];
        
        
    	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
        [theRequest setHTTPMethod:@"POST"]; //Method
        [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
        
        NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
        
        NSLog(@"con Soap MSG %@",soapMessage);
        
        if( theConnection )	{
            Cash_Sucees=TRUE;
            [self cancelpaymentpoupaction:Nil];
            webData = [[NSMutableData data] retain];}
        else	{
            NSLog(@"theConnection is NULL");}
        
        
        
    }
    
    NSLog(@"RUPPE %@",url);
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[webData setLength:0];  //when connection resieve data than set length 0 mean reset
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	
	[webData appendData:data]; //when connection start than  append data to webdata
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error //when connection fail
{
    [indicator stopAnimating];
	NSLog(@"ERROR with the Conenction");
	[connection release]; //relese because connection destroy
	[webData release];    // because containing data may be damage
	
	UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
							initWithTitle:@""
							message:@"Could not make connection"
							delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
	
	[message show]; //msg show
	[message release];//msg release
	
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection //when connection done to recieve data
{
	
    stopdoublselection=FALSE;
    [backgroundImage setHidden:YES];
    [activityIndicatoorallorder stopAnimating];
	[clickrowbtn setSelected:NO];
    [activityIndicatoor stopAnimating];
    
    NSLog(@"DONE. Received Bytes: %d", [webData length]);
	
	//incoding data
	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"the xml %@", theXML);
	[theXML release];
	
	if(xmlParser) //if xml parser contain previous values than release it
	{
		[xmlParser release];
		xmlParser = NULL;
	}
	xmlParser = [[NSXMLParser alloc] initWithData: webData]; //assign incoding webdata in to xmlparser
	[xmlParser setDelegate: self];
	[xmlParser setShouldResolveExternalEntities: YES];
	[xmlParser parse];
    //  [tblView reloadData];
    if(relodtbl==TRUE){
        relodtbl=FALSE;
        allprice=0.0;
        
        for (int k=0; k<[tableiteamnameprice count]; k++) {
            allprice=allprice + [[tableiteamnameprice  objectAtIndex:k] floatValue];
            
        }
        itemtotalprice1.text =[NSString stringWithFormat:@"$%.2f", allprice];
        itemtotalprice.text =[NSString stringWithFormat:@"$%.2f", allprice];
        //unknown
        [tableview reloadData];
        
        [self all_order_Hidden_Action];
        [self poup_additeam_test];
        
        
        
    }
    
    else if (callfun==TRUE){
        callfun=FALSE;
        
        
        [self all_order_Action];
        
    }
    else if(callfun==FALSE){
        
        [connection release]; //relese because connection destroy
        [webData release];    // because containing data may be damage
        
        if(Card_Success){
            Card_Success=FALSE;
            UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                                    initWithTitle:@"Success Message"
                                    message:@"Card Paymend Receipt Added!"
                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [message show]; //msg show
        }
        else if (Cash_Sucees){
            Cash_Sucees=FALSE;
            UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                                    initWithTitle:@"Success Message"
                                    message:@"Cash Paymend Added!"
                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [message show]; //msg show
            
            
        }
        else if(allorderupdatebool){
            UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                                    initWithTitle:@"Success Message"
                                    message:@"Your Order Updated successfully!"
                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [message show]; //msg show
        }else{
            UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                                    initWithTitle:@"Success Message"
                                    message:@"Your Order added successfully!"
                                    delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [message show]; //msg show
        }
        
    }
    
    
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementName isEqualToString:@"table_no"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    else if ([elementName isEqualToString:@"status"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    else if ([elementName isEqualToString:@"item_name"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    
    else if ([elementName isEqualToString:@"waiter"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    else if ([elementName isEqualToString:@"order_id"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    else if ([elementName isEqualToString:@"item_price"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    else if ([elementName isEqualToString:@"quantity"]) {
		soapResults = [[NSMutableString alloc]init];
	}
    else if ([elementName isEqualToString:@"details"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"price"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"order_item_id"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"token"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    else if ([elementName isEqualToString:@"timestamp"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	[soapResults appendString:string];
	
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    
	if ([elementName isEqualToString:@"table_no"]) {
		//[tblquantity addObject:soapResults];
        [tablenoarr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    else if ([elementName isEqualToString:@"status"]) {
		
        [ordarstatusarr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    else if ([elementName isEqualToString:@"timestamp"]) {
		
        [timearr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    else if ([elementName isEqualToString:@"quantity"]) {
		[tblquantity addObject:soapResults];
        // [ordarstatusarr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    
    else if ([elementName isEqualToString:@"item_name"]) {
		[tableiteamname addObject:soapResults];
        [ordernamearr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    else if ([elementName isEqualToString:@"waiter"]) {
		//[tblquantity addObject:soapResults];
        [waiternamearr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    else if ([elementName isEqualToString:@"token"]) {
		//[tblquantity addObject:soapResults];
        [tokenarr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }

    else if ([elementName isEqualToString:@"item_price"]) {
		[tableiteamnameprice addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    
    else if ([elementName isEqualToString:@"details"]) {
		[tblcommenttext addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    else if ([elementName isEqualToString:@"price"]) {
		[allpricearr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
    }
    
    
    
    else if ([elementName isEqualToString:@"order_id"]) {
		
        if(orderidarr){
            
            [updateorderid removeAllObjects];
            [orderidarr removeAllObjects];
        }
        
        
        if(allorderupdatebool){
            [updateorderid addObject:soapResults];
            NSLog(@"updateorderidupdateorderid %@",updateorderid);
        }
        else{
            
            //because orid id works some place as item id but not in update case
            [tbliteamid addObject:soapResults];
        }
        
        [orderidarr121 addObject:soapResults];
        [orderidarr addObject:soapResults];
        [soapResults release];
		soapResults = nil;
        
    }
    
    
    else if ([elementName isEqualToString:@"order_item_id"]) {
        
        if(orderidarr){
            [orderidarr removeAllObjects];
        }
        
        if(allorderupdatebool){
            [tbliteamid addObject:soapResults];
        }
        else{
            
            //because orid id works some place as item id but not in update case
            [tbliteamid addObject:soapResults];
        }
        
        [orderidarr121 addObject:soapResults];
        [orderidarr addObject:soapResults];
        [soapResults release];
        soapResults = nil;
        NSLog(@"orderidarr %@",orderidarr);
        NSLog(@"orderidarr %@",orderidarr121);
        
    }
    
    
    
}






//end service

//Open poup for update new order
-(void)placeNewOrder{
    puopbasebg = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0,1024,768)] autorelease];
    [puopbasebg setImage:[UIImage imageNamed:@"poup1024x768"]];
    puopbasebg.opaque = YES;
    puopbasebg.userInteractionEnabled=TRUE;
    [self.view addSubview:puopbasebg];
    
    
    loginareabg = [[[UIImageView alloc] init]autorelease];
    loginareabg.frame=CGRectMake(200,200,620,300);
    [loginareabg setImage:[UIImage imageNamed:@"poup996x909.png"]];
    loginareabg.opaque = YES;
    loginareabg.hidden=TRUE;
    loginareabg.userInteractionEnabled=TRUE;
    [puopbasebg addSubview:loginareabg];
    
    
    
    
    ordertypelbl = [[[UILabel alloc] initWithFrame:CGRectMake(0,40,620,40)] autorelease];
    ordertypelbl.text =@"Select Order Type";
    ordertypelbl.textAlignment =1;
    ordertypelbl.numberOfLines=2;
    ordertypelbl.backgroundColor = [UIColor clearColor];
    ordertypelbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    ordertypelbl.font=[UIFont fontWithName:@"Arial" size:(38)];
    [loginareabg  addSubview:ordertypelbl];
    
    
    
    dininbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	//dininbtn.frame=CGRectMake(135,150,167,43);
    dininbtn.frame=CGRectMake(28.5,150,150,43);
    [dininbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"take-away" ofType:@"png"]] forState:UIControlStateNormal];
	[dininbtn addTarget:self action:@selector(dineinOrderAction) forControlEvents:UIControlEventTouchUpInside];
	[loginareabg addSubview:dininbtn];
    
    
    takewaybtn =[UIButton buttonWithType:UIButtonTypeCustom];
	//takewaybtn.frame=CGRectMake(355,150,167,43);
    takewaybtn.frame=CGRectMake(235.5,150,150,43);
    [takewaybtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"dine-in" ofType:@"png"]] forState:UIControlStateNormal];
	[takewaybtn addTarget:self action:@selector(takeawayOrderaction) forControlEvents:UIControlEventTouchUpInside];
	[loginareabg addSubview:takewaybtn];
    
    
    cateringbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    cateringbtn.frame=CGRectMake(442.5,150,150,43);
    [cateringbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"catering" ofType:@"png"]] forState:UIControlStateNormal];
	[cateringbtn addTarget:self action:@selector(cateringOrderaction) forControlEvents:UIControlEventTouchUpInside];
	[loginareabg addSubview:cateringbtn];

    
    [NSTimer scheduledTimerWithTimeInterval:0.1  target:self  selector:@selector(bgloginaction)  userInfo:nil repeats:NO];
    
    
    
}

-(void)cateringOrderaction
{
    dininbtn.hidden=TRUE;
    takewaybtn.hidden=TRUE;
    cateringbtn.hidden=TRUE;
    ordertypelbl.font=[UIFont fontWithName:@"Arial" size:(30)];
    ordertypelbl.text =@"Order Type:  Catering";
    
    UILabel * Orderidlbl = [[[UILabel alloc] initWithFrame:CGRectMake(170, 112-25, 200,45)] autorelease];
    Orderidlbl.text =@"Select Quantity";
    Orderidlbl.textAlignment = 0;
    Orderidlbl.numberOfLines=2;
    Orderidlbl.backgroundColor = [UIColor clearColor];
    Orderidlbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    Orderidlbl.font=[UIFont fontWithName:@"Arial" size:(20)];
    [loginareabg  addSubview:Orderidlbl];
    
    smallQtyBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    smallQtyBtn.frame=CGRectMake(170,142,25,25);
    [smallQtyBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"light-off3" ofType:@"png"]] forState:UIControlStateNormal];
    [smallQtyBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"light-on3" ofType:@"png"]] forState:UIControlStateSelected];
    smallQtyBtn.tag=1;
    smallQtyBtn.hidden=FALSE;
    [smallQtyBtn addTarget:self action:@selector(radio_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:smallQtyBtn];

    UILabel *smallOrderlbl = [[[UILabel alloc] initWithFrame:CGRectMake(210, 132, 200,45)] autorelease];
    smallOrderlbl.text =@"Small";
    smallOrderlbl.textAlignment = 0;
    smallOrderlbl.numberOfLines=2;
    smallOrderlbl.backgroundColor = [UIColor clearColor];
    smallOrderlbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    smallOrderlbl.font=[UIFont fontWithName:@"Arial" size:(20)];
    [loginareabg  addSubview:smallOrderlbl];
    
    
    mediumQtyBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    mediumQtyBtn.frame=CGRectMake(170,142+40,25,25);
    [mediumQtyBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"light-off3" ofType:@"png"]] forState:UIControlStateNormal];
    [mediumQtyBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"light-on3" ofType:@"png"]] forState:UIControlStateSelected];
    mediumQtyBtn.tag=2;
    mediumQtyBtn.hidden=FALSE;
    [mediumQtyBtn addTarget:self action:@selector(radio_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:mediumQtyBtn];
    
    
    UILabel * mediumOrderlbl = [[[UILabel alloc] initWithFrame:CGRectMake(210, 132+40, 200,45)] autorelease];
    mediumOrderlbl.text =@"Medium";
    mediumOrderlbl.textAlignment = 0;
    mediumOrderlbl.numberOfLines=2;
    mediumOrderlbl.backgroundColor = [UIColor clearColor];
    mediumOrderlbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    mediumOrderlbl.font=[UIFont fontWithName:@"Arial" size:(20)];
    [loginareabg  addSubview:mediumOrderlbl];
    
    
    largeQtyBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    largeQtyBtn.frame=CGRectMake(170,142+80,25,25);
    [largeQtyBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"light-off3" ofType:@"png"]] forState:UIControlStateNormal];
    [largeQtyBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"light-on3" ofType:@"png"]] forState:UIControlStateSelected];
    largeQtyBtn.tag=3;
    largeQtyBtn.hidden=FALSE;
    [largeQtyBtn addTarget:self action:@selector(radio_btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:largeQtyBtn];
    
    
    UILabel * largeOrderlbl = [[[UILabel alloc] initWithFrame:CGRectMake(210, 132+80, 200,45)] autorelease];
    largeOrderlbl.text =@"Large";
    largeOrderlbl.textAlignment = 0;
    largeOrderlbl.numberOfLines=2;
    largeOrderlbl.backgroundColor = [UIColor clearColor];
    largeOrderlbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    largeOrderlbl.font=[UIFont fontWithName:@"Arial" size:(20)];
    [loginareabg  addSubview:largeOrderlbl];
    
    UIButton * canceltokenmode =[UIButton buttonWithType:UIButtonTypeCustom];
    canceltokenmode.frame=CGRectMake(370,240, 100.5,30);
    canceltokenmode.hidden=FALSE;
    [canceltokenmode setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
    [canceltokenmode addTarget:self action:@selector(closepoup) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:canceltokenmode];
    
    UIButton * donetblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    donetblbtn.frame=CGRectMake(500,240, 100.5,30);
    donetblbtn.hidden=FALSE;
    [donetblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-button" ofType:@"png"]] forState:UIControlStateNormal];
    [donetblbtn addTarget:self action:@selector(updateTable_Waitername) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:donetblbtn];
}



    
   
-(void)radio_btnAction:(id)sender
{
    
        switch ([sender tag]) {
            case 1:
                
                [largeQtyBtn setSelected:NO];
                [mediumQtyBtn setSelected:NO];
                [smallQtyBtn setSelected:YES];
              
                
                break;
            case 2:
                
                [mediumQtyBtn setSelected:YES];
                [largeQtyBtn setSelected:NO];
                [smallQtyBtn setSelected:NO];
               
                break;
                
            case 3:
                [mediumQtyBtn setSelected:NO];
                [largeQtyBtn setSelected:YES];
                [smallQtyBtn setSelected:NO];
               
                break;
            default:
                break;
        }
        
        
}


-(void)dineinOrderAction{
    dininbtn.hidden=TRUE;
    takewaybtn.hidden=TRUE;
    cateringbtn.hidden=TRUE;
    Is_Cashier=TRUE;
    ordertypelbl.font=[UIFont fontWithName:@"Arial" size:(30)];
    ordertypelbl.text =@"Order Type:   Take Away";
    UILabel * Orderidlbl = [[[UILabel alloc] initWithFrame:CGRectMake(170, 112, 200,45)] autorelease];
    Orderidlbl.text =@"Token No:";
    Orderidlbl.textAlignment = 0;
    Orderidlbl.numberOfLines=2;
    Orderidlbl.backgroundColor = [UIColor clearColor];
    Orderidlbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    Orderidlbl.font=[UIFont fontWithName:@"Arial" size:(25)];
    [loginareabg  addSubview:Orderidlbl];
    
    
    UIImageView* tablebgimg;
    tablebgimg = [[[UIImageView alloc] initWithFrame:CGRectMake(305,115,180,43.5)]autorelease];
    [tablebgimg setImage:[UIImage imageNamed:@"text-field.png"]];
    tablebgimg.userInteractionEnabled=TRUE;
    tablebgimg.opaque = YES;
    tablebgimg.hidden=FALSE;
    [loginareabg addSubview:tablebgimg];
    
    
    //Input UserName Text field Area tokennotext
    tblnotext = [[[UITextField  alloc] initWithFrame:CGRectMake(5, 6, 170,30) ] autorelease];
    tblnotext.borderStyle = UITextBorderStyleNone;
	tblnotext.font = [UIFont fontWithName:@"ArialMT" size:(28.0)];
    tblnotext.textColor=[UIColor grayColor];
	tblnotext.placeholder=@"000";
    tblnotext.backgroundColor=[UIColor clearColor];
	tblnotext.delegate = self;
    tblnotext.keyboardType= UIKeyboardTypeNumberPad;
    tblnotext.returnKeyType = UIReturnKeyGo;
    [tablebgimg addSubview:tblnotext];
    
    
    
    
    UIButton * canceltokenmode =[UIButton buttonWithType:UIButtonTypeCustom];
    canceltokenmode.frame=CGRectMake(210,220, 100.5,30);
    canceltokenmode.hidden=FALSE;
    [canceltokenmode setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
    [canceltokenmode addTarget:self action:@selector(closepoup) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:canceltokenmode];
    
    UIButton * donetoken =[UIButton buttonWithType:UIButtonTypeCustom];
    donetoken.frame=CGRectMake(350,220, 100.5,30);
    donetoken.hidden=FALSE;
    [donetoken setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-button" ofType:@"png"]] forState:UIControlStateNormal];
    [donetoken addTarget:self action:@selector(updateTable_Waitername) forControlEvents:UIControlEventTouchUpInside];
    [loginareabg addSubview:donetoken];
    
    
}


-(void)takeawayOrderaction{
    
    
//    dininbtn.hidden=TRUE;
//    takewaybtn.hidden=TRUE;
//    cateringbtn.hidden=TRUE;
//    
//    ordertypelbl.font=[UIFont fontWithName:@"Arial" size:(30)];
//    ordertypelbl.text =@"Order Type:  Dine-In";
//    UILabel * Orderidlbl = [[[UILabel alloc] initWithFrame:CGRectMake(170, 112, 200,45)] autorelease];
//    Orderidlbl.text =@"Table No:";
//    Orderidlbl.textAlignment = 0;
//    Orderidlbl.numberOfLines=2;
//    Orderidlbl.backgroundColor = [UIColor clearColor];
//    Orderidlbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
//    Orderidlbl.font=[UIFont fontWithName:@"Arial" size:(25)];
//    [loginareabg  addSubview:Orderidlbl];
//    
//    
//    UIImageView* tablebgimg;
//    tablebgimg = [[[UIImageView alloc] initWithFrame:CGRectMake(305,115,180,43.5)] autorelease];
//    [tablebgimg setImage:[UIImage imageNamed:@"text-field.png"]];
//    tablebgimg.userInteractionEnabled=TRUE;
//    tablebgimg.opaque = YES;
//    tablebgimg.hidden=FALSE;
//    [loginareabg addSubview:tablebgimg];
//    
//    //Input UserName Text field Area
//    tblnotext = [[[UITextField  alloc] initWithFrame:CGRectMake(5, 5, 170,30) ]autorelease];
//    tblnotext.borderStyle = UITextBorderStyleNone;
//	tblnotext.font = [UIFont fontWithName:@"ArialMT" size:(28.0)];
//    tblnotext.textColor=[UIColor grayColor];
//	tblnotext.placeholder=@"00";
//    tblnotext.backgroundColor=[UIColor clearColor];
//	tblnotext.delegate = self;
//    tblnotext.keyboardType= UIKeyboardTypeNumberPad;
//    tblnotext.returnKeyType = UIReturnKeyGo;
//    [tablebgimg addSubview:tblnotext];
//    
//    
//    
//    UIButton * canceltokenmode =[UIButton buttonWithType:UIButtonTypeCustom];
//    canceltokenmode.frame=CGRectMake(210,220, 100.5,30);
//    canceltokenmode.hidden=FALSE;
//    [canceltokenmode setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
//    [canceltokenmode addTarget:self action:@selector(closepoup) forControlEvents:UIControlEventTouchUpInside];
//    [loginareabg addSubview:canceltokenmode];
//    
//    UIButton * donetblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
//    donetblbtn.frame=CGRectMake(350,220, 100.5,30);
//    donetblbtn.hidden=FALSE;
//    [donetblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-button" ofType:@"png"]] forState:UIControlStateNormal];
//    [donetblbtn addTarget:self action:@selector(updateTable_Waitername) forControlEvents:UIControlEventTouchUpInside];
//    [loginareabg addSubview:donetblbtn];
//    NSInteger spacing = INTERFACE_IS_PAD ? 10 : 15;
//    
//    GMGridView *gmGridView = [[GMGridView alloc] initWithFrame:CGRectMake(0, 0, 640, 480)];
//    gmGridView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//    gmGridView.backgroundColor = [UIColor clearColor];
//    [self.view addSubview:gmGridView];
//    
//    _gmGridView = gmGridView;
//    
//    _gmGridView.style = GMGridViewStyleSwap;
//    _gmGridView.itemSpacing = spacing;
//    _gmGridView.minEdgeInsets = UIEdgeInsetsMake(spacing, spacing, spacing, spacing);
//    _gmGridView.centerGrid = YES;
//    _gmGridView.actionDelegate = self;
//    _gmGridView.sortingDelegate = self;
//    _gmGridView.transformDelegate = self;
//    _gmGridView.dataSource = self;
//   _gmGridView.mainSuperView = self.view;
    
    Demo1ViewController *demo=[[Demo1ViewController alloc] init];
    [self.navigationController pushViewController:demo animated:YES];
    [demo release];
    
    
}


//////////////////////////////////////////////////////////////
#pragma mark GMGridViewDataSource
//////////////////////////////////////////////////////////////

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return [_currentData count];
}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (INTERFACE_IS_PAD)
    {
      
        
        if (UIInterfaceOrientationIsLandscape(orientation))
        {
            return CGSizeMake(285, 205);
        }
        else
        {
            return CGSizeMake(230, 175);
        }
    }
    else
    {
        if (UIInterfaceOrientationIsLandscape(orientation))
        {
            return CGSizeMake(170, 135);
        }
        else
        {
            return CGSizeMake(140, 110);
        }
       
    }
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    //NSLog(@"Creating view indx %d", index);
    
    CGSize size = [self GMGridView:gridView sizeForItemsInInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    
    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    if (!cell)
    {
        cell = [[GMGridViewCell alloc] init];
        cell.deleteButtonIcon = [UIImage imageNamed:@"close_x.png"];
        cell.deleteButtonOffset = CGPointMake(-15, -15);
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        view.backgroundColor = [UIColor redColor];
        view.layer.masksToBounds = NO;
        view.layer.cornerRadius = 8;
        
        cell.contentView = view;
    }
    
    [[cell.contentView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:cell.contentView.bounds];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.text = (NSString *)[_currentData objectAtIndex:index];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.highlightedTextColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:20];
    [cell.contentView addSubview:label];
    
    return cell;
}


- (BOOL)GMGridView:(GMGridView *)gridView canDeleteItemAtIndex:(NSInteger)index
{
    return YES; //index % 2 == 0;
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewActionDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    NSLog(@"Did tap at index %d", position);
}

- (void)GMGridViewDidTapOnEmptySpace:(GMGridView *)gridView
{
    NSLog(@"Tap on empty space");
}

- (void)GMGridView:(GMGridView *)gridView processDeleteActionForItemAtIndex:(NSInteger)index
{
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Confirm" message:@"Are you sure you want to delete this item?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Delete", nil];
//    
//    [alert show];
//    
//    _lastDeleteItemIndexAsked = index;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
//    if (buttonIndex == 1)
//    {
//        [_currentData removeObjectAtIndex:_lastDeleteItemIndexAsked];
//        [_gmGridView removeObjectAtIndex:_lastDeleteItemIndexAsked withAnimation:GMGridViewItemAnimationFade];
//    }
}

//////////////////////////////////////////////////////////////
#pragma mark GMGridViewSortingDelegate
//////////////////////////////////////////////////////////////

- (void)GMGridView:(GMGridView *)gridView didStartMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor orangeColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     }
                     completion:nil
     ];
}

- (void)GMGridView:(GMGridView *)gridView didEndMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor redColor];
                         cell.contentView.layer.shadowOpacity = 0;
                     }
                     completion:nil
     ];
}

- (BOOL)GMGridView:(GMGridView *)gridView shouldAllowShakingBehaviorWhenMovingCell:(GMGridViewCell *)cell atIndex:(NSInteger)index
{
    return YES;
}

- (void)GMGridView:(GMGridView *)gridView moveItemAtIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex
{
    NSObject *object = [_currentData objectAtIndex:oldIndex];
    [_currentData removeObject:object];
    [_currentData insertObject:object atIndex:newIndex];
}

- (void)GMGridView:(GMGridView *)gridView exchangeItemAtIndex:(NSInteger)index1 withItemAtIndex:(NSInteger)index2
{
    [_currentData exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
}


//////////////////////////////////////////////////////////////
#pragma mark DraggableGridViewTransformingDelegate
//////////////////////////////////////////////////////////////

- (CGSize)GMGridView:(GMGridView *)gridView sizeInFullSizeForCell:(GMGridViewCell *)cell atIndex:(NSInteger)index inInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    if (INTERFACE_IS_PAD)
    {
        if (UIInterfaceOrientationIsLandscape(orientation))
        {
            return CGSizeMake(700, 530);
        }
        else
        {
            return CGSizeMake(600, 500);
        }
    }
    else
    {
        if (UIInterfaceOrientationIsLandscape(orientation))
        {
            return CGSizeMake(320, 210);
        }
        else
        {
            return CGSizeMake(300, 310);
        }
    }
}

- (UIView *)GMGridView:(GMGridView *)gridView fullSizeViewForCell:(GMGridViewCell *)cell atIndex:(NSInteger)index
{
    UIView *fullView = [[UIView alloc] init];
    fullView.backgroundColor = [UIColor yellowColor];
    fullView.layer.masksToBounds = NO;
    fullView.layer.cornerRadius = 8;
    
    CGSize size = [self GMGridView:gridView sizeInFullSizeForCell:cell atIndex:index inInterfaceOrientation:[[UIApplication sharedApplication] statusBarOrientation]];
    fullView.bounds = CGRectMake(0, 0, size.width, size.height);
    
    UILabel *label = [[UILabel alloc] initWithFrame:fullView.bounds];
    label.text = [NSString stringWithFormat:@"Fullscreen View for cell at index %d", index];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    if (INTERFACE_IS_PAD)
    {
        label.font = [UIFont boldSystemFontOfSize:15];
    }
    else
    {
        label.font = [UIFont boldSystemFontOfSize:20];
    }
    
    [fullView addSubview:label];
    
    
    return fullView;
}

- (void)GMGridView:(GMGridView *)gridView didStartTransformingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor blueColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     }
                     completion:nil];
}

- (void)GMGridView:(GMGridView *)gridView didEndTransformingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.5
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor redColor];
                         cell.contentView.layer.shadowOpacity = 0;
                     }
                     completion:nil];
}

- (void)GMGridView:(GMGridView *)gridView didEnterFullSizeForCell:(UIView *)cell
{
    
}



- (BOOL)textFieldShouldReturn:(UITextField *)t {
    [waiternametext resignFirstResponder];
    [tblnotext resignFirstResponder];
    [quntitynotextfield resignFirstResponder];
    [remarktextfield resignFirstResponder];
    [tokennotext resignFirstResponder];
    [recepttextfield resignFirstResponder];
    [amtPaybalelbltxt resignFirstResponder];
    
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [waiternametext resignFirstResponder];
    [tblnotext resignFirstResponder];
    [quntitynotextfield resignFirstResponder];
    [remarktextfield resignFirstResponder];
    [tblnotext resignFirstResponder];
    [tokennotext resignFirstResponder];
    [recepttextfield resignFirstResponder];
    [amtPaybalelbltxt resignFirstResponder];
    
    
}



-(void)bgloginaction{
    loginareabg.hidden=FALSE;
}


-(void)updateTable_Waitername{
    
    
    allorderupdatebool=FALSE;
    
    if([tblnotext.text length]< 1  ){
        
        UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                                initWithTitle:@"Login Alert"
                                message:@"Enter your detail!"
                                delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [message show]; //msg show
        [message release];//msg release
        
    }
    else{
        
       self.tablenoglob=tblnotext.text;
        
        
        
        [ordarstatusarr removeAllObjects];
        [tablenoarr removeAllObjects];
        [waiternamearr removeAllObjects];
        [timearr removeAllObjects];
        [ordernamearr removeAllObjects];
        [finalArray removeAllObjects];
        [orderidarr removeAllObjects];
        [orderidarr121 removeAllObjects];
        [tableiteamname removeAllObjects];
        [tableiteamnameprice removeAllObjects];
        [tblquantity removeAllObjects];
        [tblcommenttext removeAllObjects];
        [tbliteamid removeAllObjects];
        [updateorderid removeAllObjects];
        [allpricearr removeAllObjects];
        
        stringval=@"";
        
        
        [ordarstatusarr release];
        ordarstatusarr=nil;
        
        [timearr release];
        timearr=nil;

        [tablenoarr release];
        tablenoarr=nil;
        
        
        [waiternamearr release];
        waiternamearr=nil;
        
        
        [tokenarr release];
        tokenarr=nil;
        
        [ordernamearr release];
        ordernamearr=nil;
        
        [finalArray release];
        finalArray=nil;
        
        [orderidarr release];
        orderidarr=nil;
        
        
        [allpricearr release];
        allpricearr=nil;
        
        [orderidarr121 release];
        orderidarr121=nil;
        
        [tableiteamname release];
        tableiteamname=nil;
        
        [tableiteamnameprice release];
        tableiteamnameprice=nil;
        
        [tblquantity release];
        tblquantity=nil;
        
        
        [tblcommenttext release];
        tblcommenttext=nil;
        
        
        [tbliteamid release];
        tbliteamid=nil;
        
        [tblquantity release];
        tblquantity=nil;
        
        
        [updateorderid release];
        updateorderid=nil;
        
        
        [priceArrays release];
        priceArrays=nil;
        
        [tempupdateorderid release];
        tempupdateorderid=nil;
        
        [temptbliteamid release];
        temptbliteamid=nil;
        
        [temptblcommenttext release];
        temptblcommenttext=nil;
        
        [temptblquantity release];
        temptblquantity=nil;
        
        
        [temptableiteamname release];
        temptableiteamname=nil;
        
        [temptableiteamnameprice release];
        temptableiteamnameprice=nil;
        
        
        
        
        
        iRestaurantsNewOrderViewController * irestaurantsNewOrderViewController=[[iRestaurantsNewOrderViewController alloc]init];
        [self.navigationController pushViewController:irestaurantsNewOrderViewController animated:NO];
        [irestaurantsNewOrderViewController release];
        
        
        
        // [self all_order_Hidden_Action];
        
    }
    
    
    UIButton * addtoservertblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	addtoservertblbtn.frame=CGRectMake(400, 550,138.5, 30);
    if(allorderupdatebool){
        
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"update" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=213;
        [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else{
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-order" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=212;
        
        [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
    }
  	
    [tableview reloadData];
    [addlistbgimage addSubview:addtoservertblbtn];
    [self closepoup];
    
}



-(void)closepoup{
    
    [tblnotext resignFirstResponder];
    [tokennotext resignFirstResponder];
    
    loginareabg.hidden=TRUE;
    puopbasebg.hidden=TRUE;
    
}

//Webservice call
-(void)countryListHere:(NSMutableArray *)allCountries getID:(NSMutableArray *)idarray status:(BOOL)value{
    if (value) {
        NSLog(@"allCountries = %@",allCountries);
        if(!countryNamesArray)    countryNamesArray = [[NSMutableArray alloc] init];
        else [countryNamesArray removeAllObjects];
        
        //[PoupHeaderLbl setText: @"Country"];
        countryNamesArray = [allCountries mutableCopy];
        
        if(!idnamearray)    idnamearray = [[NSMutableArray alloc] init];
        else [idnamearray removeAllObjects];
        idnamearray = [idarray mutableCopy];
        NSLog(@"countryNamesArray--- %@ , %@",countryNamesArray,idnamearray);
        
    }
    
    
    
    //  [self category_view_method];
    
    [activityIndicatoor stopAnimating];
    // empNameTableView.userInteractionEnabled = YES;
}




//Items List generated below services

-(void)stateListHere:(NSMutableArray *)allStates getID:(NSMutableArray *)idarray getdesc:(NSMutableArray *)descArray getprepTime:(NSMutableArray *)preptimeArray getPrice:(NSMutableArray *)priceArray getpairentname:(NSMutableArray *)pairentname  status:(BOOL)value{
    if (value) {
        NSLog(@"allStates = %@",allStates);
        if(!statesNameArray)    statesNameArray = [[NSMutableArray alloc] init];
        else [statesNameArray removeAllObjects];
        
        statesNameArray = [allStates mutableCopy];
        
        if(!idarrays)    idarrays = [[NSMutableArray alloc] init];
        else [idarrays removeAllObjects];
        {
            
            
            
            idarrays=[idarray mutableCopy];
            NSLog(@"idarrays = %@",idarrays);
            
        }
        if(!descArrays)    descArrays = [[NSMutableArray alloc] init];
        else [descArrays removeAllObjects];
        
        descArrays=[descArray mutableCopy];
        
        if(!preptimeArrays)    preptimeArrays = [[NSMutableArray alloc] init];
        else [preptimeArrays removeAllObjects];
        
        preptimeArrays=[preptimeArray mutableCopy];
        
        if(!priceArrays)    priceArrays = [[NSMutableArray alloc] init];
        else [priceArrays removeAllObjects];
        
        priceArrays=[priceArray mutableCopy];
        
        
        NSLog(@"priceArrays %@",priceArrays);
        if(!pairentnamearr)    pairentnamearr = [[NSMutableArray alloc] init];
        else [pairentnamearr removeAllObjects];
        
        pairentnamearr=[pairentname mutableCopy];
        
        
        
        for (UIView* view in [subcatscroll subviews]) {
            if([view isKindOfClass:[UIButton class]]){
                catdescbtn = (UIButton*)view;
                [catdescbtn removeFromSuperview];
            }
        }
        
        
        
        //[self hide_poup_additeam];
        
        int yPositiond = MARGINd;
        int xPositiond = MARGINd;
        //Create Dynamic btn on view
        //dheeraj
        
        catdetailcatname.text = [pairentname objectAtIndex:0];
        
        for(int j=1; j<= [statesNameArray count];  j++){
            
            
            if (j>16) {
                subcatscroll.contentSize = CGSizeMake(565.5, 830);
                subcatscroll.scrollEnabled=TRUE;
            }
            else{
                subcatscroll.contentSize = CGSizeMake(565.5, 500);
                subcatscroll.scrollsToTop=TRUE;
                subcatscroll.scrollEnabled=FALSE;
            }
            
            catdescbtn =[UIButton buttonWithType:UIButtonTypeCustom];
            catdescbtn.frame=CGRectMake(-2+xPositiond, yPositiond, WIDTHd, HEIGHTd);
            catdescbtn.tag=j;
            [catdescbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"iteamsmallpic" ofType:@"png"]] forState:UIControlStateNormal];
            [catdescbtn addTarget:self action:@selector(Open_additeam_poup_description:) forControlEvents:UIControlEventTouchUpInside];
            [subcatscroll addSubview:catdescbtn];
            
            NSLog(@"Without Condition add poup");
            UILabel * displasubtitel;
            displasubtitel = [[[UILabel alloc] initWithFrame:CGRectMake(2,75,110,30)] autorelease];
            displasubtitel.text = [statesNameArray objectAtIndex:j-1];
            displasubtitel.textAlignment = 1;
            displasubtitel.backgroundColor = [UIColor clearColor];
            displasubtitel.font=[UIFont fontWithName:@"Arial" size:(15)];
            displasubtitel.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
            [catdescbtn addSubview:displasubtitel];
            
            
            
            
            // change to next line
            if ((j)%4 == 0) {
                xPositiond = MARGINd;
                yPositiond = yPositiond + HEIGHTd+MARGINd;//+ MARGIN;
            }
            else {
                
                xPositiond = xPositiond + WIDTHd + MARGINd;
                
            }
        }
        
    }
    [activityIndicatoor stopAnimating];
    // empNameTableView.userInteractionEnabled = YES;
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65.5;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [tableiteamname count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease]; }
    
    UIImageView *cellbg = [[UIImageView alloc] initWithFrame:CGRectMake(0,0, 565.5, 65.5)];
    [cellbg setImage:[UIImage imageNamed:@"product-row.png"]];
    cellbg.opaque = YES;
    cellbg.userInteractionEnabled=TRUE;
    //cellbg=0.5;
    [cell addSubview:cellbg];
    
    
    UIImageView *celliteamthumb = [[UIImageView alloc] initWithFrame:CGRectMake(2.5,2.5, 60,60)];
    [celliteamthumb setImage:[UIImage imageNamed:@"itheamthumb.png"]];
    celliteamthumb.opaque = YES;
    [cellbg addSubview:celliteamthumb];
    
    
    
    UILabel *label;
    label = [[[UILabel alloc] initWithFrame:CGRectMake(70,20,200,20)]autorelease];
    label.text = [tableiteamname objectAtIndex:indexPath.row];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor darkGrayColor];
    [cellbg addSubview:label];
    
    
    UIImageView *lebelcellitemquntbg = [[[UIImageView alloc] initWithFrame:CGRectMake(300,18, 50,30)]autorelease];
    [lebelcellitemquntbg setImage:[UIImage imageNamed:@"total-price-head.png"]];
    lebelcellitemquntbg.opaque = YES;
    lebelcellitemquntbg.userInteractionEnabled=TRUE;
    [cellbg addSubview:lebelcellitemquntbg];
    
    UILabel *label1;
    label1 = [[[UILabel alloc] initWithFrame:CGRectMake(10,5,20,20)]autorelease];
    label1.text =[tblquantity objectAtIndex:indexPath.row];
    // label.textAlignment = UITextAlignmentCenter;
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
    [lebelcellitemquntbg addSubview:label1];
    
    
    UILabel * dolorsigncellpricelbl = [[[UILabel alloc] initWithFrame:CGRectMake(428,24, 10,20)] autorelease];
    dolorsigncellpricelbl.text = @"$";
    dolorsigncellpricelbl.textAlignment = 0;
    dolorsigncellpricelbl.backgroundColor = [UIColor clearColor];
    dolorsigncellpricelbl.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [cellbg addSubview:dolorsigncellpricelbl];
    
    
    
    cellpricelbl = [[[UILabel alloc] initWithFrame:CGRectMake(439,24, 50,20)] autorelease];
    cellpricelbl.text = [tableiteamnameprice objectAtIndex:indexPath.row];
    cellpricelbl.textAlignment = 0;
    cellpricelbl.backgroundColor = [UIColor clearColor];
    cellpricelbl.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [cellbg addSubview:cellpricelbl];
    
    
    UIButton *    cellselectionbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    
    cellselectionbtn.frame=CGRectMake(0, 0,600,58);
    //[cellselectionbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"iteamsmallpic" ofType:@"png"]] forState:UIControlStateNormal];
    
    
    if(allorderupdatebool){
        
        cellselectionbtn.tag=indexPath.row;
        [cellselectionbtn addTarget:self action:@selector(Open_update_poup_description:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    else{
        
        cellselectionbtn.tag=indexPath.row;
        [cellselectionbtn addTarget:self action:@selector(Open_update_poup_description:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [cell addSubview:cellselectionbtn];
    
  	return cell;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableiteamname removeObjectAtIndex:indexPath.row];
    [tableiteamnameprice removeObjectAtIndex:indexPath.row];
    [tblquantity removeObjectAtIndex:indexPath.row];
    [tblcommenttext removeObjectAtIndex:indexPath.row];
    [tableview reloadData];
    
}




//Update big poup when click table cell

-(void)Open_update_poup_description:(id)sender
{
    
    NSInteger popupTag = ((UIButton *)sender).tag;
    
    
    //Used for update iteam poup remove multiple selection
    if(!stopdoublselection){
        stopdoublselection=TRUE;
        
        
        NSLog(@"popupTagsqsq %d",popupTag);
        
        HelpView = [[[UIView alloc] init]autorelease];
        HelpView.frame=CGRectMake(0,0,1024,768);
        [HelpView setBackgroundColor:[UIColor blackColor]];
        HelpView.alpha=0.0;
        [self.view addSubview:HelpView];
        
        
        
        //    Poup_over_image_top = [[[UIImageView alloc] init]autorelease];
        //    Poup_over_image_top.frame=CGRectMake(50,120, 926.5, 35);
        //    [Poup_over_image_top setBackgroundColor:[UIColor clearColor]];
        //    [Poup_over_image_top setImage:[UIImage imageNamed:@"pop-up-top.png"]];
        //    Poup_over_image_top.alpha=0.0;
        //
        //    [HelpView addSubview:Poup_over_image_top];
        
        Poup_over_image = [[[UIImageView alloc] init]autorelease];
        Poup_over_image.frame=CGRectMake(50,150, 926.5, 455.5);
        Poup_over_image.userInteractionEnabled=TRUE;
        [Poup_over_image setBackgroundColor:[UIColor clearColor]];
        [Poup_over_image setImage:[UIImage imageNamed:@"pop-up=midd.png"]];
        Poup_over_image.alpha=0.0;
        [self.view addSubview:Poup_over_image];
        
        
        //    Poup_over_image_bottom = [[[UIImageView alloc] init]autorelease];
        //    Poup_over_image_bottom.frame=CGRectMake(50,605.5, 926.5, 35);
        //    [Poup_over_image_bottom setBackgroundColor:[UIColor clearColor]];
        //    [Poup_over_image_bottom setImage:[UIImage imageNamed:@"pop-up-bottom.png"]];
        //    Poup_over_image_bottom.alpha=0.0;
        //
        //    [HelpView addSubview:Poup_over_image_bottom];
        
        
        UILabel  * itemtotalprice12;
        itemtotalprice12 = [[UILabel alloc] initWithFrame:CGRectMake(34,40,1024,30)];
        itemtotalprice12.text =[tableiteamname objectAtIndex:popupTag];
        // itemtotalprice = UITextAlignmentCenter;
        itemtotalprice12.backgroundColor = [UIColor clearColor];
        itemtotalprice12.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        itemtotalprice12.font=[UIFont fontWithName:@"Arial" size:(25)];
        [Poup_over_image addSubview:itemtotalprice12];
        
        
        UILabel  * itemtotalprice2;
        itemtotalprice2 = [[UILabel alloc] initWithFrame:CGRectMake(25,5,858,30)];
        itemtotalprice2.text = @"Update Order Detail";
        itemtotalprice2.textAlignment =1;
        itemtotalprice2.backgroundColor = [UIColor clearColor];
        itemtotalprice2.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        itemtotalprice2.font=[UIFont fontWithName:@"Arial" size:(29)];
        [Poup_over_image addSubview:itemtotalprice2];
        
        
        
        UIImageView *   Poup_over_image_bigThumb = [[[UIImageView alloc] init]autorelease];
        Poup_over_image_bigThumb.frame=CGRectMake(25,90, 411.5, 181);
        Poup_over_image_bigThumb.userInteractionEnabled=TRUE;
        [Poup_over_image_bigThumb setBackgroundColor:[UIColor clearColor]];
        [Poup_over_image_bigThumb setImage:[UIImage imageNamed:@"additempoupimgbig.png"]];
        //Poup_over_image_bigThumb.alpha=0.9;
        [Poup_over_image  addSubview:Poup_over_image_bigThumb];
        
        
        
        
        UILabel  * poupdetailtextlbl;
        poupdetailtextlbl = [[[UILabel alloc] initWithFrame:CGRectMake(25,210, 411.5, 181)]autorelease];
        // poupdetailtextlbl.text =[descArrays objectAtIndex:popupTag-1];
        // itemtotalprice = UITextAlignmentCenter;
        poupdetailtextlbl.numberOfLines=5;
        poupdetailtextlbl.backgroundColor = [UIColor clearColor];
        poupdetailtextlbl.textColor = [UIColor whiteColor];
        poupdetailtextlbl.font=[UIFont fontWithName:@"Arial" size:(16)];
        [Poup_over_image addSubview:poupdetailtextlbl];
        
        
        
        detailpoupquantity = [[[UILabel alloc] initWithFrame:CGRectMake(465,90, 100,25)] autorelease];
        detailpoupquantity.text = @"Quantity";
        // detailpoupquantity = UITextAlignmentCenter;
        detailpoupquantity.backgroundColor = [UIColor clearColor];
        detailpoupquantity.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        detailpoupquantity.font=[UIFont fontWithName:@"Arial" size:(25)];
        [Poup_over_image addSubview:detailpoupquantity];
        
        UIImageView *   quantitytextbg = [[[UIImageView alloc] init]autorelease];
        quantitytextbg.frame=CGRectMake(630,90, 66.5, 27.5);
        quantitytextbg.userInteractionEnabled=TRUE;
        [quantitytextbg setBackgroundColor:[UIColor clearColor]];
        [quantitytextbg setImage:[UIImage imageNamed:@"quantity-box.png"]];
        //Poup_over_image_bigThumb.alpha=0.9;
        [Poup_over_image  addSubview:quantitytextbg];
        
        
        //Input UserName Text field Area
        quntitynotextfield= [[[UITextField  alloc] init ]autorelease ];
        quntitynotextfield.frame=CGRectMake(630,90, 66.5, 27.5);
        quntitynotextfield.borderStyle = UITextBorderStyleNone;
        quntitynotextfield.font = [UIFont fontWithName:@"ComicSansMS" size:(20.8)];
        quntitynotextfield.placeholder=@"";
        quntitynotextfield.textColor=[UIColor whiteColor];
        quntitynotextfield.backgroundColor=[UIColor clearColor];
        [quntitynotextfield setKeyboardType:UIKeyboardTypeNumberPad];
        quntitynotextfield.delegate = self;
        quntitynotextfield.textAlignment=1;
        
        quntitynotextfield.enabled=FALSE;
        quntitynotextfield.returnKeyType = UIReturnKeyDone;
        [Poup_over_image addSubview:quntitynotextfield];
        quntitynotextfield.text=[tblquantity objectAtIndex:popupTag];
        updatepricetag = popupTag;
        
        
        UIButton * minusbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        minusbtn.frame=CGRectMake(730,90,25,25);
        [minusbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"minus" ofType:@"png"]] forState:UIControlStateNormal];
        minusbtn.tag=1000;
        [minusbtn addTarget:self action:@selector(quntityplusandminusactionupdatepoup:) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:minusbtn];
        
        
        
        
        UIButton * plusbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        plusbtn.frame=CGRectMake(770,90,25,25);
        [plusbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"plus" ofType:@"png"]] forState:UIControlStateNormal];
        plusbtn.tag=2000;
        [plusbtn addTarget:self action:@selector(quntityplusandminusactionupdatepoup:) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:plusbtn];
        
        UILabel  * remarknotelbl;
        remarknotelbl = [[[UILabel alloc] initWithFrame:CGRectMake(465,120, 130,110)] autorelease];
        remarknotelbl.text = @"Special \nInstructions";
        // remarknotelbl = UITextAlignmentCenter;
        remarknotelbl.numberOfLines=2;
        remarknotelbl.backgroundColor = [UIColor clearColor];
        remarknotelbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        remarknotelbl.font=[UIFont fontWithName:@"Arial" size:(25)];
        [Poup_over_image addSubview:remarknotelbl];
        
        
        UIImageView *   remarkbgimg = [[[UIImageView alloc] init]autorelease];
        remarkbgimg.frame=CGRectMake(630,146, 222.5, 97);
        remarkbgimg.userInteractionEnabled=TRUE;
        [remarkbgimg setBackgroundColor:[UIColor clearColor]];
        [remarkbgimg setImage:[UIImage imageNamed:@"spcl-instrcuction-box.png"]];
        //Poup_over_image_bigThumb.alpha=0.9;
        [Poup_over_image  addSubview:remarkbgimg];
        
        //Input UserName Text field Area
        remarktextfield= [[UITextField  alloc] init ];
        remarktextfield.frame=CGRectMake(10,0, 200, 97);
        remarktextfield.borderStyle = UITextBorderStyleNone;
        remarktextfield.font = [UIFont fontWithName:@"ComicSansMS" size:(20.8)];
        if (SYSTEM_VERSION_LESS_THAN(@"6.0")) {
            if(tblcommenttext)
            { remarktextfield.placeholder=[tblcommenttext objectAtIndex:popupTag];
            }
            else{ remarktextfield.placeholder=@"Instruction.....";
            }

        } else {
           
            
            if(tblcommenttext)
            {
                remarktextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[tblcommenttext objectAtIndex:popupTag] attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
               
            }
            else
            {
                 remarktextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Instruction....." attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
            }
        }
       
        remarktextfield.textColor=[UIColor whiteColor];
        remarktextfield.backgroundColor=[UIColor clearColor];
        [remarktextfield setKeyboardType:UIKeyboardTypeDefault];
        remarktextfield.delegate = self;
        remarktextfield.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
        remarktextfield.contentHorizontalAlignment=UIControlContentHorizontalAlignmentFill;
        NSLog(@"tblcommenttext %@",tblcommenttext);
        remarktextfield.returnKeyType = UIReturnKeyDone;
        [remarkbgimg addSubview:remarktextfield];
        //   remarktextfield.text=@"";
        
        UIButton * cancelbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        cancelbtn.frame=CGRectMake(570, 400,124.5, 35);
        [cancelbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
        [cancelbtn addTarget:self action:@selector(Close_Additeam_desc_Poup) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:cancelbtn];
        
        
        UIButton * addbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        addbtn.frame=CGRectMake(720, 399,191, 41.5);
        [addbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"update-order" ofType:@"png"]] forState:UIControlStateNormal];
        addbtn.tag=popupTag;
        [addbtn addTarget:self action:@selector(updateiteamtbllist:) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:addbtn];
        
        UILabel  * preptimelbl;
        preptimelbl = [[[UILabel alloc] initWithFrame:CGRectMake(25, 400,300, 25)] autorelease];
        preptimelbl.text = @"Price: $";
        // itemtotalprice = UITextAlignmentCenter;
        preptimelbl.numberOfLines=1;
        preptimelbl.backgroundColor = [UIColor clearColor];
        preptimelbl.textColor =[UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        preptimelbl.font=[UIFont fontWithName:@"Arial" size:(20)];
        [Poup_over_image addSubview:preptimelbl];
        
        tempint=[quntitynotextfield.text integerValue];
        
        NSLog(@"tempint---tempint222%d",tempint);
        
        UILabel  * preptimelbl1;
        preptimelbl1 = [[[UILabel alloc] initWithFrame:CGRectMake(92, 400,300, 25)] autorelease];
        
        NSString * pricevalsingel;
        float floatpriceval;
        
        pricevalsingel=[tableiteamnameprice objectAtIndex:popupTag];
        
        floatpriceval=[pricevalsingel floatValue];
        
        floatpriceval=floatpriceval/tempint;
        actualpriceupdatebigpoup=[NSString stringWithFormat:@"%.2f",floatpriceval];
        [actualpriceupdatebigpoup retain];
        
        // NSLog(@"actualpriceupdatebigpoup---actualpriceupdatebigpoup%@",actualpriceupdatebigpoup);
        
        preptimelbl1.text = [NSString stringWithFormat:@"%.2f",floatpriceval];
        // itemtotalprice = UITextAlignmentCenter;
        preptimelbl1.numberOfLines=1;
        preptimelbl1.backgroundColor = [UIColor clearColor];
        preptimelbl1.textColor =[UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        preptimelbl1.font=[UIFont fontWithName:@"Arial" size:(20)];
        [Poup_over_image addSubview:preptimelbl1];
        [self additeam_desc_poup_animation];
    }
    
}

-(void)NullmsgAlert{
    UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                            initWithTitle:@"Update Notice"
                            message:@"Please select an Order from All Orders first"
                            delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [message show]; //msg show
    [message release];//msg release
    
}

-(void)updateiteamtbllist:(id)sender{
    NSInteger updatepopupTag = ((UIButton *)sender).tag;
    
    
    [tblquantity replaceObjectAtIndex:updatepopupTag withObject:quntitynotextfield.text];
    NSLog(@"updatepricetag %d -- %@",updatepopupTag,inStr);
    [tableiteamnameprice replaceObjectAtIndex:updatepopupTag withObject:inStr];
    
    NSLog(@"tableiteamnameprice %@",tableiteamnameprice);
    NSLog(@"updatepricetag %d -- %@",updatepopupTag,inStr);
    
    NSString * Firstval = [tblcommenttext objectAtIndex:updatepopupTag];
    
    // NSString * priceupdate =[priceArrays objectAtIndex:updatepopupTag];
    
    
    
    
    NSString * secondval =[NSString stringWithFormat:@"%@",remarktextfield.text];
    if([Firstval isEqualToString:secondval]){
        NSLog(@"Updateunsuccessfull");
    }
    else if([remarktextfield.text length] > 0 )
    {    NSLog(@"update");
        
        [tblcommenttext replaceObjectAtIndex:updatepopupTag withObject:remarktextfield.text];    }
    
    [self Close_Additeam_desc_Poup];
    
    allprice=0.0;
    for (int k=0; k<[tableiteamnameprice count]; k++) {
        allprice=allprice + [[tableiteamnameprice  objectAtIndex:k] floatValue];
    }
    NSLog(@"dedEW %@  %@ %@ add---%f",tableiteamname,tableiteamnameprice,tblquantity,allprice);
    itemtotalprice.text =[NSString stringWithFormat:@"$%.2f", allprice];
    itemtotalprice1.text =[NSString stringWithFormat:@"$%.2f", allprice];
    
    
    [tableview reloadData];
}


-(void)all_order_Action{
    if(IShidden){
        IShidden=FALSE;
        [self all_order_Hidden_Action];
        
    }
    
    if(tbliteamid){[tbliteamid removeAllObjects];}
    itemtotalprice1.text =@"$0.00";
    itemtotalprice.text =@"$0.00";
    
    
    if(tableiteamname){[tableiteamname removeAllObjects];}
    if(tableiteamnameprice){[tableiteamnameprice removeAllObjects];}
    if(tblquantity){[tblquantity removeAllObjects];}
    if(tblcommenttext){[tblcommenttext removeAllObjects];}
    if(tbliteamid){[tbliteamid removeAllObjects];}
    
    int yPositiond = 2;
    int xPositiond = 0;
    
    CGRect scrollRect =  CGRectMake(10,130, 1005,450);
    
    UIScrollView * alldetailscrollView = [[UIScrollView alloc] initWithFrame:scrollRect];
    
    alldetailscrollView.contentSize = CGSizeMake(1005,2360);
    
    
    [tempView addSubview:alldetailscrollView];
    
    for(int a=100; a<[waiternamearr count]+100; a++){
        if(a>=109){alldetailscrollView.scrollEnabled=TRUE; }
        else{ alldetailscrollView.scrollEnabled=FALSE;
        }
        
        
        currentwaitername = [NSString stringWithFormat:@"%@",[waiternamearr objectAtIndex:a-100]];
        
       
        roworder = [[UIImageView alloc] initWithFrame:CGRectMake(xPositiond,yPositiond, 1005,45.5)];
        [roworder setImage:[UIImage imageNamed:@"order-row.png"]];
        roworder.userInteractionEnabled=TRUE;
        roworder.opaque = YES;
        [alldetailscrollView addSubview:roworder];
        
#pragma Allorder scroll view cell btn like table selection
        
       clickrowbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        clickrowbtn.frame=CGRectMake(0,0,1024,45.5);
        
        
        [clickrowbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"order-row" ofType:@"png"]] forState:UIControlStateNormal];
        [clickrowbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"order-row-selected" ofType:@"png"]] forState:UIControlStateSelected];
        
        clickrowbtn.tag=[[orderidarr121 objectAtIndex:a-100] integerValue];
        clickrowbtn.tag=a;
        [clickrowbtn addTarget:self action:@selector(serviceclickallordercell:) forControlEvents:UIControlEventTouchUpInside];
        [roworder addSubview:clickrowbtn];
        
        
        UILabel * waiternamelbl;
        waiternamelbl = [[[UILabel alloc] initWithFrame:CGRectMake(10,5,200,30)] autorelease];
        waiternamelbl.text = [waiternamearr objectAtIndex:a-100];
        waiternamelbl.textAlignment=UITextAlignmentCenter;
        waiternamelbl.backgroundColor = [UIColor clearColor];
        waiternamelbl.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
        waiternamelbl.font=[UIFont fontWithName:@"Arial" size:(20)];
        [roworder  addSubview:waiternamelbl];
        
        UILabel * tablenolbl;
        tablenolbl = [[[UILabel alloc] initWithFrame:CGRectMake(265,5,150,30)] autorelease];
        if([[tokenarr objectAtIndex:a-100] isEqualToString:@"1"])
        {tablenolbl.text =[NSString stringWithFormat:@"T-%@",[tablenoarr objectAtIndex:a-100]];}
        else
        {tablenolbl.text =[NSString stringWithFormat:@"%@",[tablenoarr objectAtIndex:a-100]];}
        tablenolbl.textAlignment = 1;
        tablenolbl.backgroundColor = [UIColor clearColor];
        tablenolbl.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
        tablenolbl.font=[UIFont fontWithName:@"Arial" size:(20)];
        [roworder  addSubview:tablenolbl];
        
        
        
        UILabel * orderstatuslbl;
        orderstatuslbl = [[[UILabel alloc] initWithFrame:CGRectMake(470,5,130,30)] autorelease];
        orderstatuslbl.text = [ordarstatusarr objectAtIndex:a-100];
        orderstatuslbl.textAlignment = 1;
        orderstatuslbl.backgroundColor = [UIColor clearColor];
        orderstatuslbl.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
        orderstatuslbl.font=[UIFont fontWithName:@"Arial" size:(20)];
        [roworder  addSubview:orderstatuslbl];
        
        
        
       
        Timerlbl = [[[UILabel alloc] initWithFrame:CGRectMake(633,5,120,30)] autorelease];
        
       
        NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
        
        [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        NSDate *start = [dateformatter dateFromString:[timearr objectAtIndex:a-100]];
        
        NSTimeInterval timeInterval = [start timeIntervalSinceNow];
        
        
//        NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
//        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//        [formatter setDateFormat:@"mm"];
//        NSLog(@"%@", [formatter stringFromDate:date]);
        
        
        NSInteger time = round(timeInterval);
        NSLog(@"timeInterval %d",time/60);
        int minutes = floor(time/60);
       
        

        Timerlbl.text = [[NSString stringWithFormat:@"%d min",minutes] stringByReplacingOccurrencesOfString:@"-" withString:@""];
        [Timerlbl setTag:a];
        Timerlbl.textAlignment = 1;
        Timerlbl.backgroundColor = [UIColor clearColor];
        Timerlbl.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
        Timerlbl.font=[UIFont fontWithName:@"Arial" size:(20)];
        [roworder  addSubview:Timerlbl];

        if([[ordarstatusarr objectAtIndex:a-100 ] isEqualToString:@"Ready"]){
            printinactivebtn =[UIButton buttonWithType:UIButtonTypeCustom];
            printinactivebtn.frame=CGRectMake(920,8, 36,29);
            [printinactivebtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"print-icon" ofType:@"png"]] forState:UIControlStateNormal];
                        printinactivebtn.tag=[[orderidarr121 objectAtIndex:a-100] integerValue];
                        printinactivebtn.tag=a;
            [printinactivebtn addTarget:self action:@selector(printData:) forControlEvents:UIControlEventTouchUpInside];
            [roworder addSubview:printinactivebtn];
            
        }
        else{
            printinactivebtn =[UIButton buttonWithType:UIButtonTypeCustom];
            printinactivebtn.frame=CGRectMake(920,8, 36,29);
            [printinactivebtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"print-icon" ofType:@"png"]] forState:UIControlStateNormal];
            //printinactivebtn.tag=[[orderidarr121 objectAtIndex:a-100] integerValue];
            printinactivebtn.tag=a;
            [printinactivebtn addTarget:self action:@selector(printData:) forControlEvents:UIControlEventTouchUpInside];
            [roworder addSubview:printinactivebtn];
        }
        
        
        //Btn for proceed payment process
        
        if([[ordarstatusarr objectAtIndex:a-100 ] isEqualToString:@"Ready"]){
            paymentbtn =[UIButton buttonWithType:UIButtonTypeCustom];
            paymentbtn.frame=CGRectMake(753,8, 79,29);
            [paymentbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"process" ofType:@"png"]] forState:UIControlStateNormal];
            paymentbtn.tag=[[orderidarr121 objectAtIndex:a-100] integerValue];
            paymentbtn.tag=a;
            [clickrowbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"order-row-drkgreen" ofType:@"png"]] forState:UIControlStateNormal];
            [paymentbtn addTarget:self action:@selector(paymentoptionpoup:) forControlEvents:UIControlEventTouchUpInside];
            [roworder addSubview:paymentbtn];
        }
        else  if([[ordarstatusarr objectAtIndex:a-100 ] isEqualToString:@"Completed"]){
            paymentbtn =[UIButton buttonWithType:UIButtonTypeCustom];
            paymentbtn.frame=CGRectMake(753,8, 79,29);
            [paymentbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"done" ofType:@"png"]] forState:UIControlStateNormal];
            //            paymentbtn.tag=[[orderidarr121 objectAtIndex:a-100] integerValue];
            //            paymentbtn.tag=a;
            //            [paymentbtn addTarget:self action:@selector(paymentoptionpoup:) forControlEvents:UIControlEventTouchUpInside];
            [roworder addSubview:paymentbtn];
            [clickrowbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"order-row-red" ofType:@"png"]] forState:UIControlStateNormal];
            [clickrowbtn setTag:999999];
            
        }
        
        else{
            UIButton * paymentbtndecable =[UIButton buttonWithType:UIButtonTypeCustom];
            paymentbtndecable.frame=CGRectMake(753,8, 79,29);
            [paymentbtndecable setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pending" ofType:@"png"]] forState:UIControlStateNormal];
            [clickrowbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"order-row-lghtgreen" ofType:@"png"]] forState:UIControlStateNormal];
            //  [paymentbtn addTarget:self action:@selector(serviceclickallordercell:) forControlEvents:UIControlEventTouchUpInside];
            [roworder addSubview:paymentbtndecable];
            
           
            
        }
        
        
        yPositiond = yPositiond + 46;
      
    }
    
   
//    [NSTimer scheduledTimerWithTimeInterval:60
//                                     target:self
//                                   selector:@selector(all_order_Action)
//                                   userInfo:nil repeats:YES];
    
    
}




-(void)printData:(id)sender
{
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
   
    
    if ([prefs stringForKey:@"PrinterPortName"] !=NULL)
    {
        
//        [DKAirCashFunctions OpenCashDrawerWithPortname:[prefs stringForKey:@"DrawerPortName"]
//                                          portSettings:@""
//                                          drawerNumber:1];
//        rasterPrinting *rasterPrintingVar = [[rasterPrinting alloc] initWithNibName:@"rasterPrinting" bundle:[NSBundle mainBundle]];
//        [self presentModalViewController:rasterPrintingVar animated:YES];
//        [rasterPrintingVar setOptionSwitch:NO];
//        [rasterPrintingVar release];
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];


        if ([[prefs stringForKey:@"PortSettings"] compare:@"mini" options:NSCaseInsensitiveSearch] == NSOrderedSame) //Portable Printer
        {
            [MiniPrinterFunctions PrintBitmapWithPortName:[NSString stringWithFormat:@"%@",[prefs stringForKey:@"PrinterPortName"]] portSettings:[NSString stringWithFormat:@"%@",[prefs stringForKey:@"PortSettings"]] imageSource:[prefs objectForKey:@"imageToPrint"] printerWidth:[prefs objectForKey:@"width"] compressionEnable:[prefs boolForKey:@"switchCompression"] pageModeEnable:[prefs boolForKey:@"switchPageMode"]];
        }
        else //Star Line Mode, Star Raster Mode
        {
            [PrinterFunctions PrintImageWithPortname:[NSString stringWithFormat:@"%@",[prefs stringForKey:@"PrinterPortName"]] portSettings:[NSString stringWithFormat:@"%@",[prefs stringForKey:@"PortSettings"]] imageToPrint:[prefs objectForKey:@"imageToPrint"] maxWidth:[prefs objectForKey:@"width"] compressionEnable:[prefs boolForKey:@"switchCompression"] withDrawerKick:NO];
        }
        
    }
    else
    {
        ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
        [self.navigationController pushViewController:viewController animated:YES];
        [viewController release];
       
        
    }
    
    
    
    
//    NSLog(@"PRINTING.....");
//    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
//    pic.delegate = self;
//    
//    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
//    printInfo.outputType = UIPrintInfoOutputGeneral;
//    //printInfo.orientation=UIPrintInfoOrientationPortrait;
//    printInfo.jobName = @"ROS";
//    pic.printInfo = printInfo;
//    
//    UISimpleTextPrintFormatter *textFormatter = [[UISimpleTextPrintFormatter alloc]
//                                                 initWithText:@"Restaurant Operating System"];
//    textFormatter.startPage = 0;
//    textFormatter.contentInsets = UIEdgeInsetsMake(72.0, 72.0, 72.0, 72.0); // 1 inch margins
//    textFormatter.maximumContentWidth = 6 * 72.0;
//    pic.printFormatter = textFormatter;
//    [textFormatter release];
//    pic.showsPageRange = YES;
//    
//    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
//    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
//        if (!completed && error) {
//            NSLog(@"Printing could not complete because of error: %@", error);
//        }
//    };
//     //[pic presentAnimated:YES completionHandler:completionHandler];
//    NSLog(@"[sender tag] : %f",[roworder frame].origin.y);
//    [pic presentFromRect:CGRectMake(900,(([sender tag]%100)*38), 100, 100) inView:[[printinactivebtn superview] superview] animated:YES completionHandler:completionHandler];
    
}

#pragma Payment Option poup

-(void)paymentoptionpoup:(id)sender{
    NSInteger paymentpopupTag = ((UIButton *)sender).tag;
    
    
    paymentpopupTag=paymentpopupTag-100;
    NSLog(@"paymentoptionpoupallpricearr-- %@",[allpricearr objectAtIndex:paymentpopupTag]);
    
    updatepaymentIDval=[orderidarr121 objectAtIndex:paymentpopupTag];
    billingpriceall=[allpricearr objectAtIndex:paymentpopupTag];
    
    NSLog(@"updatepaymentIDval %@",updatepaymentIDval);
    
    
    
    poupbgmain = [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,1024,768)]autorelease];
    [poupbgmain setImage:[UIImage imageNamed:@"poup1024x768.png"]];
    poupbgmain.userInteractionEnabled=TRUE;
    poupbgmain.opaque = YES;
    poupbgmain.hidden=FALSE;
    [self.view addSubview:poupbgmain];
    
    
    smallpoupbg = [[[UIImageView alloc] initWithFrame:CGRectMake(265,150,498,400)]autorelease];
    [smallpoupbg setImage:[UIImage imageNamed:@"poup996x909.png"]];
    smallpoupbg.userInteractionEnabled=TRUE;
    smallpoupbg.opaque = YES;
    [poupbgmain addSubview:smallpoupbg];
    
    
    smallpouptitlemsg = [[[UILabel alloc] initWithFrame:CGRectMake(20,40,470,100)] autorelease];
    smallpouptitlemsg.text =@"How would you like to make\nPayments ?";
    smallpouptitlemsg.textAlignment = 0;
    smallpouptitlemsg.numberOfLines=2;
    smallpouptitlemsg.backgroundColor = [UIColor clearColor];
    smallpouptitlemsg.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    smallpouptitlemsg.font=[UIFont fontWithName:@"Arial" size:(35)];
    [smallpoupbg  addSubview:smallpouptitlemsg];
    
    
    cardpaymentoptionbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    cardpaymentoptionbtn.frame=CGRectMake(120,170, 258,53);
    cardpaymentoptionbtn.hidden=FALSE;
    [cardpaymentoptionbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cc-button" ofType:@"png"]] forState:UIControlStateNormal];
    [cardpaymentoptionbtn addTarget:self action:@selector(cardpaymentAction:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:cardpaymentoptionbtn];
    
    cashpaymentoptionbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    cashpaymentoptionbtn.frame=CGRectMake(120,250, 258,53);
    cashpaymentoptionbtn.hidden=FALSE;
    [cashpaymentoptionbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cash-button" ofType:@"png"]] forState:UIControlStateNormal];
    [cashpaymentoptionbtn addTarget:self action:@selector(cashpaymentAction:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:cashpaymentoptionbtn];
    
    
    cancelpoupcornerbtn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    cancelpoupcornerbtn.frame=CGRectMake(450,-15,50,50);
    [cancelpoupcornerbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"close-button" ofType:@"png"]] forState:UIControlStateNormal];
    [cancelpoupcornerbtn addTarget:self action:@selector(cancelpaymentpoupaction:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:cancelpoupcornerbtn];
    
}


-(IBAction)cardpaymentAction:(id)sender{
    NSLog(@"cashpaymentAction click");
    
    cashpaymentoptionbtn.hidden=TRUE;
    cardpaymentoptionbtn.hidden=TRUE;
    smallpouptitlemsg.text =@"Please swipe the card and\nenter receipt no.";
    
    
    // Is_Card=TRUE;
    cancelcardbtn.hidden=TRUE;
    
    UIImageView* receptbg;
    receptbg = [[[UIImageView alloc] initWithFrame:CGRectMake(120,170, 258,53)]autorelease];
    [receptbg setImage:[UIImage imageNamed:@"reciept-no-field.png"]];
    receptbg.userInteractionEnabled=TRUE;
    receptbg.opaque = YES;
    receptbg.hidden=FALSE;
    [smallpoupbg addSubview:receptbg];
    
    
    //Input recepttextfield Text field Area
    recepttextfield= [[[UITextField  alloc] init ]autorelease ];
    recepttextfield.frame=CGRectMake(55,13,200, 28);
	recepttextfield.borderStyle = UITextBorderStyleNone;
	recepttextfield.font = [UIFont fontWithName:@"Arial" size:(25)];
	recepttextfield.placeholder=@"Receipt";
    recepttextfield.textColor=[UIColor grayColor];
    recepttextfield.backgroundColor=[UIColor clearColor];
	[recepttextfield setKeyboardType:UIKeyboardTypeNumberPad];
	recepttextfield.delegate = self;
    recepttextfield.textAlignment=0;
    recepttextfield.returnKeyType = UIReturnKeyDone;
    [receptbg addSubview:recepttextfield];
    
    
    
    UIButton *  cancelcardbtn2 =[UIButton buttonWithType:UIButtonTypeCustom];
    cancelcardbtn2.frame=CGRectMake(140,270, 100.5,30);
    cancelcardbtn2.hidden=FALSE;
    [cancelcardbtn2 setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
    [cancelcardbtn2 addTarget:self action:@selector(cancelpaymentpoupaction:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:cancelcardbtn2];
    
    UIButton * donecardbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    donecardbtn.frame=CGRectMake(270,270, 100.5,30);
    donecardbtn.hidden=FALSE;
    [donecardbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-button" ofType:@"png"]] forState:UIControlStateNormal];
    donecardbtn.tag=222;
    [donecardbtn addTarget:self action:@selector(callwebserviceforupdatepayment:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:donecardbtn];
    
    
    
}



-(IBAction)cashpaymentAction:(id)sender{
    
    NSLog(@"cashpaymentAction click");
    cancelcardbtn.hidden=TRUE;
    // Is_Card=FALSE;
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    
    
    if ([prefs stringForKey:@"DrawerPortName"] !=NULL)
    {
        
                [DKAirCashFunctions OpenCashDrawerWithPortname:[prefs stringForKey:@"DrawerPortName"]
                                                  portSettings:@""
                                                  drawerNumber:1];
//        rasterPrinting *rasterPrintingVar = [[rasterPrinting alloc] initWithNibName:@"rasterPrinting" bundle:[NSBundle mainBundle]];
//        [self presentModalViewController:rasterPrintingVar animated:YES];
//        [rasterPrintingVar setOptionSwitch:NO];
//        [rasterPrintingVar release];
        
        
        
    }
    else
    {
        ViewController *viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] ;
        [self.navigationController pushViewController:viewController animated:YES];
        [viewController release];
        
        
    }
    

    UILabel * totalbilllbl;
    totalbilllbl = [[[UILabel alloc] initWithFrame:CGRectMake(10,80,130,30)] autorelease];
    totalbilllbl.text =@"Total Bill:";
    totalbilllbl.textAlignment = 0;
    totalbilllbl.numberOfLines=2;
    totalbilllbl.backgroundColor = [UIColor clearColor];
    totalbilllbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    totalbilllbl.font=[UIFont fontWithName:@"Arial" size:(26)];
    [smallpoupbg  addSubview:totalbilllbl];
    
    UIImageView* totalbgtext;
    totalbgtext = [[[UIImageView alloc] initWithFrame:CGRectMake(210,70, 145.5,43.5)]autorelease];
    [totalbgtext setImage:[UIImage imageNamed:@"text-field.png"]];
    totalbgtext.userInteractionEnabled=TRUE;
    totalbgtext.opaque = YES;
    totalbgtext.hidden=FALSE;
    [smallpoupbg addSubview:totalbgtext];
    
    UITextField * amtPaybalelbl1txt= [[[UITextField  alloc] init ]autorelease ];
    amtPaybalelbl1txt.frame=CGRectMake(5,5,136, 28);
	amtPaybalelbl1txt.borderStyle = UITextBorderStyleNone;
	amtPaybalelbl1txt.font = [UIFont fontWithName:@"Arial" size:(25)];
	amtPaybalelbl1txt.text=billingpriceall;
    amtPaybalelbl1txt.textColor=[UIColor grayColor];
    amtPaybalelbl1txt.backgroundColor=[UIColor clearColor];
	[amtPaybalelbl1txt setKeyboardType:UIKeyboardTypeNumberPad];
	amtPaybalelbl1txt.delegate = self;
    amtPaybalelbl1txt.enabled=FALSE;
    amtPaybalelbl1txt.textAlignment=2;
    amtPaybalelbl1txt.returnKeyType = UIReturnKeyDone;
    [totalbgtext addSubview:amtPaybalelbl1txt];
    
    
    
    UILabel * amtPaybalelbl;
    amtPaybalelbl = [[[UILabel alloc] initWithFrame:CGRectMake(10,144,170,30)] autorelease];
    amtPaybalelbl.text =@"Amount Paid:";
    amtPaybalelbl.textAlignment = 0;
    amtPaybalelbl.numberOfLines=2;
    amtPaybalelbl.backgroundColor = [UIColor clearColor];
    amtPaybalelbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:60/255.0 alpha:1];
    amtPaybalelbl.font=[UIFont fontWithName:@"Arial" size:(26)];
    [smallpoupbg  addSubview:amtPaybalelbl];
    
    
    UIImageView* totalbgtext1;
    totalbgtext1 = [[[UIImageView alloc] initWithFrame:CGRectMake(210,135, 145.5,43.5)]autorelease];
    [totalbgtext1 setImage:[UIImage imageNamed:@"text-field.png"]];
    totalbgtext1.userInteractionEnabled=TRUE;
    totalbgtext1.opaque = YES;
    totalbgtext1.hidden=FALSE;
    [smallpoupbg addSubview:totalbgtext1];
    
    
    amtPaybalelbltxt= [[[UITextField  alloc] init ]autorelease ];
    amtPaybalelbltxt.frame=CGRectMake(5,5,136, 28);
	amtPaybalelbltxt.borderStyle = UITextBorderStyleNone;
	amtPaybalelbltxt.font = [UIFont fontWithName:@"Arial" size:(25)];
	amtPaybalelbltxt.placeholder=@"0.00";
    amtPaybalelbltxt.textColor=[UIColor grayColor];
    amtPaybalelbltxt.backgroundColor=[UIColor clearColor];
	[amtPaybalelbltxt setKeyboardType:UIKeyboardTypeNumberPad];
	amtPaybalelbltxt.delegate = self;
    amtPaybalelbltxt.textAlignment=2;
    amtPaybalelbltxt.returnKeyType = UIReturnKeyDone;
    [totalbgtext1 addSubview:amtPaybalelbltxt];
    
    
    
    
    
    UIButton *  cancelcardbtn1 =[UIButton buttonWithType:UIButtonTypeCustom];
    //    cancelcardbtn1.frame=CGRectMake(120,300, 100.5,30);
    cancelcardbtn1.frame=CGRectMake(120,240, 100.5,30);
    cancelcardbtn1.hidden=FALSE;
    [cancelcardbtn1 setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
    [cancelcardbtn1 addTarget:self action:@selector(cancelpaymentpoupaction:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:cancelcardbtn1];
    
    UIButton * donecashbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    donecashbtn.frame=CGRectMake(250,240, 100.5,30);
    donecashbtn.hidden=FALSE;
    [donecashbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-button" ofType:@"png"]] forState:UIControlStateNormal];
    donecashbtn.tag=333;
    [donecashbtn addTarget:self action:@selector(callwebserviceforupdatepayment:) forControlEvents:UIControlEventTouchUpInside];
    [smallpoupbg addSubview:donecashbtn];
    
    smallpouptitlemsg.hidden=TRUE;
    cashpaymentoptionbtn.hidden=TRUE;
    cardpaymentoptionbtn.hidden=TRUE;
    //  smallpouptitlemsg.text =@"Please swipe the card and\nenter receipt no.";
    
}




-(IBAction)cancelpaymentpoupaction:(id)sender{
    
    [recepttextfield resignFirstResponder];
    [amtPaybalelbltxt resignFirstResponder];
    
    NSLog(@"Cancel click");
    poupbgmain.hidden=TRUE;
    
}




-(void)all_order_Hidden_Action{
    [self category_view_method];
    
    stopdoublselection=FALSE;
    waiternmdyn.hidden=FALSE;
    tblnodyn.hidden=FALSE;
    waiternm.hidden=FALSE;
    tblno.hidden=FALSE;
    
    
    [tableview reloadData];
    NSLog(@"elseif %d",[tableiteamname count]);
    UIButton * addtoservertblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	addtoservertblbtn.frame=CGRectMake(400, 550,138.5, 30);
    if(allorderupdatebool){
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"update" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=213;
        if([tableiteamname count]>0){
            
            [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
        }
        else{
            
            [addtoservertblbtn addTarget:self action:@selector(NullmsgAlert) forControlEvents:UIControlEventTouchUpInside];
        }
        
        
        
    }
    else{
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-order" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=212;
        
        [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
    }
  	
    
    
    [addlistbgimage addSubview:addtoservertblbtn];
    categoryscrollview.hidden=FALSE;
    [tempView removeFromSuperview];
    
}



-(void)category_view_method{
    
    UIImageView *cattopimage1 = [[[UIImageView alloc] initWithFrame:CGRectMake(5,72, 425,78)]autorelease];
    [cattopimage1 setImage:[UIImage imageNamed:@"category-heading.png"]];
    cattopimage1.opaque = YES;
    [Bg addSubview:cattopimage1];
    
    
    
    UILabel * mainiteamtitle;
    mainiteamtitle = [[[UILabel alloc] initWithFrame:CGRectMake(7,22, 415,30)] autorelease];
    mainiteamtitle.text = @"Categories";
    mainiteamtitle.textAlignment =0;
    mainiteamtitle.backgroundColor = [UIColor clearColor];
    mainiteamtitle.font=[UIFont fontWithName:@"Arial" size:(27)];
    mainiteamtitle.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [cattopimage1 addSubview:mainiteamtitle];
    
    
    
    CGRect scrollRect =  CGRectMake(0, 140, 430, 520);
    categoryscrollview = [[UIScrollView alloc] initWithFrame:scrollRect];
    categoryscrollview.contentSize = CGSizeMake(430, 730);
    [Bg addSubview:categoryscrollview];
    
    activityIndicatoor.frame=CGRectMake(210, 260,40, 40);
    [categoryscrollview addSubview:activityIndicatoor];
    
    int yPosition = MARGIN;
    int xPosition = MARGIN;
    
    //Create Dynamic btn on view
    for(int i=1;  i<=[countryNamesArray count];  i++){
        UIButton * catitembtn =[UIButton buttonWithType:UIButtonTypeCustom];
        catitembtn.frame=CGRectMake(-2+xPosition, yPosition, WIDTH, HEIGHT);
        catitembtn.tag=[[idnamearray objectAtIndex:i-1] integerValue];
        [catitembtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"iteamsmallpic" ofType:@"png"]] forState:UIControlStateNormal];
        [catitembtn addTarget:self action:@selector(sbudetail_iteamAction:) forControlEvents:UIControlEventTouchUpInside];
        [categoryscrollview addSubview:catitembtn];
        
        UILabel * displasubtitel;
        displasubtitel = [[[UILabel alloc] initWithFrame:CGRectMake(2,75,110,30)] autorelease];
        displasubtitel.text = [countryNamesArray objectAtIndex:i-1];
        displasubtitel.textAlignment = 1;
        displasubtitel.backgroundColor = [UIColor clearColor];
        displasubtitel.font=[UIFont fontWithName:@"Arial" size:(15)];
        displasubtitel.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
        [catitembtn addSubview:displasubtitel];
        
        // change to next line
        if ((i)%3 == 0) {
            xPosition = MARGIN;
            yPosition = yPosition + HEIGHT+MARGIN;}//+ MARGIN;
        else {
            xPosition = xPosition + WIDTH + MARGIN; }
    }
}


-(void)sbudetail_iteamAction:(id)sender{
    NSInteger popupTag = ((UIButton *)sender).tag;
    
    [self hide_poup_additeam];
    
    //Stop multiple selection on category list iteams
    if(!stopdoublselection){
        stopdoublselection=TRUE;
        
        activityIndicatoor.frame=CGRectMake(250, 280,40, 40);
        [activityIndicatoor startAnimating];
        [iteambgimg addSubview:activityIndicatoor];
        
        
        if(!statesList){
            statesList = [[GetiRestaurantsCatsubIteam alloc] init];
            statesList.delegate = self;
        }
        
        [statesList callWebService:popupTag];
    }
}

#pragma  Method to Add/Sumbit all Table Order to server.
-(void)add_order_list_method{
    
    addlistbgimage = [[[UIImageView alloc] initWithFrame:CGRectMake(452,72, 565.5,600.5)] autorelease];
    [addlistbgimage setImage:[UIImage imageNamed:@"pricewithiteam.png"]];
    addlistbgimage.opaque = YES;
    addlistbgimage.userInteractionEnabled=TRUE;
    [Bg addSubview:addlistbgimage];
    
    
    UILabel * addlistbgimagelbl;
    addlistbgimagelbl = [[[UILabel alloc] initWithFrame:CGRectMake(8,13, 415,30)] autorelease];
    addlistbgimagelbl.text = @"Current order list";
    addlistbgimagelbl.textAlignment =0;
    addlistbgimagelbl.backgroundColor = [UIColor clearColor];
    addlistbgimagelbl.font=[UIFont fontWithName:@"Arial" size:(18)];
    addlistbgimagelbl.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [addlistbgimage addSubview:addlistbgimagelbl];
    
    
    
    itemtotalprice = [[[UILabel alloc] initWithFrame:CGRectMake(438,25, 100,20)] autorelease];
    itemtotalprice.text =[NSString stringWithFormat:@"$%.2f", allprice];
    itemtotalprice.backgroundColor = [UIColor clearColor];
    itemtotalprice.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
    itemtotalprice.font=[UIFont fontWithName:@"Arial" size:(16)];
    [addlistbgimage addSubview:itemtotalprice];
    
    
    
    tableview = [[UITableView alloc] init];
    tableview.frame=CGRectMake(5,80, 555.5, 350);
    tableview.backgroundColor = [UIColor clearColor];
    tableview.separatorColor = [UIColor clearColor];
	tableview.delegate=self;
	tableview.dataSource=self;
    [tableview setOpaque: NO];
    [addlistbgimage addSubview:tableview];
    
    
    
    UIImageView *cellbg1 = [[[UIImageView alloc] initWithFrame:CGRectMake(0,435, 565.5, 48.5)] autorelease];
    [cellbg1 setImage:[UIImage imageNamed:@"discount-table.png"]];
    cellbg1.opaque = YES;
    cellbg1.userInteractionEnabled=TRUE;
    [addlistbgimage addSubview:cellbg1];
    
    
    UIImageView *cellbg2 = [[[UIImageView alloc] initWithFrame:CGRectMake(0,483.5, 565.5, 48.5)] autorelease];
    [cellbg2 setImage:[UIImage imageNamed:@"discount-table.png"]];
    cellbg2.opaque = YES;
    cellbg2.userInteractionEnabled=TRUE;
    [addlistbgimage addSubview:cellbg2];
    
    
    
    UIButton * clearbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	clearbtn.frame=CGRectMake(240, 550,138.5, 30);
    [clearbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"clear-table-button" ofType:@"png"]] forState:UIControlStateNormal];
  	[clearbtn addTarget:self action:@selector(cleardatatable) forControlEvents:UIControlEventTouchUpInside];
	[addlistbgimage addSubview:clearbtn];
    
    
    UIButton * addtoservertblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	addtoservertblbtn.frame=CGRectMake(400, 550,138.5, 30);
    if(allorderupdatebool){
        
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"update" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=213;
        if([tableiteamname count]>0){
            
            [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
        }
        else{
            
            [addtoservertblbtn addTarget:self action:@selector(NullmsgAlert) forControlEvents:UIControlEventTouchUpInside];
        }
        
    }
    else {//Working first time
        [addtoservertblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"submit-order" ofType:@"png"]] forState:UIControlStateNormal];
        addtoservertblbtn.tag=212;
        [addtoservertblbtn addTarget:self action:@selector(callWebService1:) forControlEvents:UIControlEventTouchUpInside];
    }
  	
    [addlistbgimage addSubview:addtoservertblbtn];
    
    
    
    UIButton * hidebtn =[UIButton buttonWithType:UIButtonTypeCustom];
	hidebtn.frame=CGRectMake(0, 0,565.5, 60);
    // [submitBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"item-heading.png" ofType:@"png"]] forState:UIControlStateNormal];
  	[hidebtn addTarget:self action:@selector(hide_poup_additeam) forControlEvents:UIControlEventTouchUpInside];
	[addlistbgimage addSubview:hidebtn];
    
    
    //botom table hide btn
    submitBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame=CGRectMake(452, 703,565.5, 61.5);
    [submitBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pricebar" ofType:@"png"]] forState:UIControlStateNormal];
    submitBtn.hidden=TRUE;
  	[submitBtn addTarget:self action:@selector(poup_additeam_test) forControlEvents:UIControlEventTouchUpInside];
	[Bg addSubview:submitBtn];
    
    UILabel * addlistbgimagelbl11;
    addlistbgimagelbl11 = [[[UILabel alloc] initWithFrame:CGRectMake(8,13, 415,30)] autorelease];
    addlistbgimagelbl11.text = @"Current order list";
    addlistbgimagelbl11.textAlignment =0;
    addlistbgimagelbl11.backgroundColor = [UIColor clearColor];
    addlistbgimagelbl11.font=[UIFont fontWithName:@"Arial" size:(18)];
    addlistbgimagelbl11.textColor = [UIColor colorWithRed:186/255.0 green:38/255.0 blue:28/255.0 alpha:1];
    [submitBtn addSubview:addlistbgimagelbl11];
    
    
    
    itemtotalprice1 = [[[UILabel alloc] initWithFrame:CGRectMake(438,25, 100,20)] autorelease];
    itemtotalprice1.text =[NSString stringWithFormat:@"$%.2f", allprice];
    // itemtotalprice = UITextAlignmentCenter;
    itemtotalprice1.backgroundColor = [UIColor clearColor];
    itemtotalprice1.textColor = [UIColor colorWithRed:137/255.0 green:137/255.0 blue:137/255.0 alpha:1];
    itemtotalprice1.font=[UIFont fontWithName:@"Arial" size:(16)];
    [submitBtn addSubview:itemtotalprice1];
    
    
    
}


-(void)tempaddarder{
    [tableview addSubview:activityIndicatoor];
    
    [activityIndicatoor startAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(targetMethod:)
                                   userInfo:nil
                                    repeats:NO];
    
}




-(void)cleardatatable{
    
    if(tbliteamid){[tbliteamid removeAllObjects];}
    itemtotalprice1.text =@"$0.00";
    itemtotalprice.text =@"$0.00";
    
    
    if(tableiteamname){[tableiteamname removeAllObjects];}
    if(tableiteamnameprice){[tableiteamnameprice removeAllObjects];}
    if(tblquantity){[tblquantity removeAllObjects];}
    if(tblcommenttext){[tblcommenttext removeAllObjects];}
    if(tbliteamid){[tbliteamid removeAllObjects];}
    
    
    
    cellpricelbl.text=@"";
    [tableview reloadData];
    
    
}


//Big Boup for addition
-(void)Open_additeam_poup_description:(id)sender{
    NSInteger popupTag = ((UIButton *)sender).tag;
    
    NSLog(@"NSInteger %d",popupTag);
    
    //Used for add iteam poup remove multiple selection
    if(!stopdoublselection){
        
        stopdoublselection=TRUE;
        
        HelpView = [[[UIView alloc] init]autorelease];
        HelpView.frame=CGRectMake(0,0,1024,768);
        [HelpView setBackgroundColor:[UIColor blackColor]];
        HelpView.alpha=0.0;
        [self.view addSubview:HelpView];
        
        
        
        //     Poup_over_image_top = [[[UIImageView alloc] init]autorelease];
        //    Poup_over_image_top.frame=CGRectMake(50,120, 926.5, 35);
        //    [Poup_over_image_top setBackgroundColor:[UIColor clearColor]];
        //    [Poup_over_image_top setImage:[UIImage imageNamed:@"pop-up-top.png"]];
        //    Poup_over_image_top.alpha=0.0;
        //
        //   [HelpView addSubview:Poup_over_image_top];
        
        Poup_over_image = [[[UIImageView alloc] init]autorelease];
        Poup_over_image.frame=CGRectMake(50,150, 926.5, 455.5);
        Poup_over_image.userInteractionEnabled=TRUE;
        [Poup_over_image setBackgroundColor:[UIColor clearColor]];
        [Poup_over_image setImage:[UIImage imageNamed:@"pop-up=midd.png"]];
        Poup_over_image.alpha=0.0;
        [self.view addSubview:Poup_over_image];
        
        
        //    Poup_over_image_bottom = [[[UIImageView alloc] init]autorelease];
        //    Poup_over_image_bottom.frame=CGRectMake(50,605.5, 926.5, 35);
        //    [Poup_over_image_bottom setBackgroundColor:[UIColor clearColor]];
        //    [Poup_over_image_bottom setImage:[UIImage imageNamed:@"pop-up-bottom.png"]];
        //    Poup_over_image_bottom.alpha=0.0;
        //
        //    [HelpView addSubview:Poup_over_image_bottom];
        
        
        
        
        
        UILabel  * itemtotalprice12;
        itemtotalprice12 = [[[UILabel alloc] initWithFrame:CGRectMake(34,40,1024,30)] autorelease];
        itemtotalprice12.text =[statesNameArray objectAtIndex:popupTag-1];
        // itemtotalprice = UITextAlignmentCenter;
        itemtotalprice12.backgroundColor = [UIColor clearColor];
        itemtotalprice12.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        itemtotalprice12.font=[UIFont fontWithName:@"Arial" size:(25)];
        [Poup_over_image addSubview:itemtotalprice12];
        
        
        UILabel  * itemtotalprice2;
        itemtotalprice2 = [[[UILabel alloc] initWithFrame:CGRectMake(25,3,858,30)] autorelease];
        itemtotalprice2.text = @"Add Order Detail";
        itemtotalprice2.textAlignment = 1;
        itemtotalprice2.backgroundColor = [UIColor clearColor];
        itemtotalprice2.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        itemtotalprice2.font=[UIFont fontWithName:@"Arial" size:(29)];
        [Poup_over_image addSubview:itemtotalprice2];
        
        
        
        UIImageView *   Poup_over_image_bigThumb = [[[UIImageView alloc] init]autorelease];
        Poup_over_image_bigThumb.frame=CGRectMake(25,90, 411.5, 181);
        Poup_over_image_bigThumb.userInteractionEnabled=TRUE;
        [Poup_over_image_bigThumb setBackgroundColor:[UIColor clearColor]];
        [Poup_over_image_bigThumb setImage:[UIImage imageNamed:@"additempoupimgbig.png"]];
        //Poup_over_image_bigThumb.alpha=0.9;
        [Poup_over_image  addSubview:Poup_over_image_bigThumb];
        
        
        
        
        UILabel  * poupdetailtextlbl;
        poupdetailtextlbl = [[[UILabel alloc] initWithFrame:CGRectMake(25,210, 411.5, 181)]autorelease];
        poupdetailtextlbl.text =[descArrays objectAtIndex:popupTag-1];
        poupdetailtextlbl.numberOfLines=5;
        poupdetailtextlbl.backgroundColor = [UIColor clearColor];
        poupdetailtextlbl.textColor = [UIColor whiteColor];
        poupdetailtextlbl.font=[UIFont fontWithName:@"Arial" size:(16)];
        [Poup_over_image addSubview:poupdetailtextlbl];
        
        
        
        
        
        
        
        detailpoupquantity = [[[UILabel alloc] initWithFrame:CGRectMake(465,90, 100,25)]autorelease];
        detailpoupquantity.text = @"Quantity";
        detailpoupquantity.backgroundColor = [UIColor clearColor];
        detailpoupquantity.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        detailpoupquantity.font=[UIFont fontWithName:@"Arial" size:(25)];
        [Poup_over_image addSubview:detailpoupquantity];
        
        
        
        UIImageView *   quantitytextbg = [[[UIImageView alloc] init]autorelease];
        quantitytextbg.frame=CGRectMake(630,90, 66.5, 27.5);
        quantitytextbg.userInteractionEnabled=TRUE;
        [quantitytextbg setBackgroundColor:[UIColor clearColor]];
        [quantitytextbg setImage:[UIImage imageNamed:@"quantity-box.png"]];
        [Poup_over_image  addSubview:quantitytextbg];
        
        
        
        
        //Input UserName Text field Area
        quntitynotextfield= [[[UITextField  alloc] init ] autorelease];
        quntitynotextfield.frame=CGRectMake(630,90, 66.5, 27.5);
        quntitynotextfield.borderStyle = UITextBorderStyleNone;
        quntitynotextfield.font = [UIFont fontWithName:@"ComicSansMS" size:(20.8)];
        quntitynotextfield.placeholder=@"";
        quntitynotextfield.textColor=[UIColor whiteColor];
        quntitynotextfield.backgroundColor=[UIColor clearColor];
        [quntitynotextfield setKeyboardType:UIKeyboardTypeNumberPad];
        quntitynotextfield.delegate = self;
        quntitynotextfield.textAlignment=1;
        quntitynotextfield.enabled=FALSE;
        quntitynotextfield.returnKeyType = UIReturnKeyDone;
        [Poup_over_image addSubview:quntitynotextfield];
        quntitynotextfield.text=@"1";
        
        
        
        UIButton * minusbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        minusbtn.frame=CGRectMake(730,90,25,25);
        [minusbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"minus" ofType:@"png"]] forState:UIControlStateNormal];
        minusbtn.tag=100;
        [minusbtn addTarget:self action:@selector(quntityplusandminusaction:) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:minusbtn];
        
        
        
        
        UIButton * plusbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        plusbtn.frame=CGRectMake(770,90,25,25);
        [plusbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"plus" ofType:@"png"]] forState:UIControlStateNormal];
        plusbtn.tag=200;
        [plusbtn addTarget:self action:@selector(quntityplusandminusaction:) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:plusbtn];
        
        
        
        
        
        UILabel  * remarknotelbl;
        remarknotelbl = [[[UILabel alloc] initWithFrame:CGRectMake(465,120, 130,110)]autorelease];
        remarknotelbl.text = @"Special \nInstructions";
        // remarknotelbl = UITextAlignmentCenter;
        remarknotelbl.numberOfLines=2;
        remarknotelbl.backgroundColor = [UIColor clearColor];
        remarknotelbl.textColor = [UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        remarknotelbl.font=[UIFont fontWithName:@"Arial" size:(25)];
        [Poup_over_image addSubview:remarknotelbl];
        
        
        UIImageView *   remarkbgimg = [[[UIImageView alloc] init]autorelease];
        remarkbgimg.frame=CGRectMake(630,146, 222.5, 97);
        remarkbgimg.userInteractionEnabled=TRUE;
        [remarkbgimg setBackgroundColor:[UIColor clearColor]];
        [remarkbgimg setImage:[UIImage imageNamed:@"spcl-instrcuction-box.png"]];
        //Poup_over_image_bigThumb.alpha=0.9;
        [Poup_over_image  addSubview:remarkbgimg];
        
        //Input UserName Text field Area
        remarktextfield= [[[UITextField  alloc] init ]autorelease];
        remarktextfield.frame=CGRectMake(632,146, 220, 97);
        remarktextfield.borderStyle = UITextBorderStyleNone;
        remarktextfield.font = [UIFont fontWithName:@"ComicSansMS" size:(20.8)];
        if (SYSTEM_VERSION_LESS_THAN(@"6.0")) {
             remarktextfield.placeholder=@"Instruction.....";
        } else {
            
            remarktextfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Instruction....." attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
        }
       
        remarktextfield.textColor=[UIColor whiteColor];
        remarktextfield.backgroundColor=[UIColor clearColor];
        [remarktextfield setKeyboardType:UIKeyboardTypeDefault];
        remarktextfield.delegate = self;
        remarktextfield.contentHorizontalAlignment=UIControlContentHorizontalAlignmentFill;
         remarktextfield.contentVerticalAlignment=UIControlContentVerticalAlignmentTop;
        remarktextfield.returnKeyType = UIReturnKeyDone;
        [Poup_over_image addSubview:remarktextfield];
        //   remarktextfield.text=@"";
        
        
        
        UIButton * cancelbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        cancelbtn.frame=CGRectMake(630, 400,124.5, 35);
        [cancelbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cancel-button" ofType:@"png"]] forState:UIControlStateNormal];
        // cancelbtn.hidden=TRUE;
        [cancelbtn addTarget:self action:@selector(Close_Additeam_desc_Poup) forControlEvents:UIControlEventTouchUpInside];
        [Poup_over_image addSubview:cancelbtn];
        
        
        
        
        
        UIButton * addbtn =[UIButton buttonWithType:UIButtonTypeCustom];
        addbtn.frame=CGRectMake(780, 400,124.5, 35);
        [addbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"add" ofType:@"png"]] forState:UIControlStateNormal];
        addbtn.tag=popupTag;
        if([priceArrays  count] > 0){
            
            [addbtn addTarget:self action:@selector(additeamtotbllist:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [Poup_over_image addSubview:addbtn];
        
        
        
        UILabel  * preptimelbl;
        preptimelbl = [[[UILabel alloc] initWithFrame:CGRectMake(25, 400,300, 25)]autorelease];
        preptimelbl.text = @"Price: $";
        // itemtotalprice = UITextAlignmentCenter;
        preptimelbl.numberOfLines=1;
        preptimelbl.backgroundColor = [UIColor clearColor];
        preptimelbl.textColor =[UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        preptimelbl.font=[UIFont fontWithName:@"Arial" size:(20)];
        [Poup_over_image addSubview:preptimelbl];
        
        UILabel  * preptimelbl1;
        preptimelbl1 = [[[UILabel alloc] initWithFrame:CGRectMake(92, 400,300, 25)]autorelease];
        preptimelbl1.text = [priceArrays objectAtIndex:popupTag-1];
        updatepricetag = popupTag-1;
        preptimelbl1.numberOfLines=1;
        preptimelbl1.backgroundColor = [UIColor clearColor];
        preptimelbl1.textColor =[UIColor colorWithRed:242/255.0 green:250/255.0 blue:59/255.0 alpha:1];
        preptimelbl1.font=[UIFont fontWithName:@"Arial" size:(20)];
        [Poup_over_image addSubview:preptimelbl1];
        
        NSLog(@"tempint---tempint%d",tempint);
        
        
        
        
        [self additeam_desc_poup_animation];
        
        
    }
    
    
    
}

-(void)additeamtotbllist:(id)sender{
    [self Close_Additeam_desc_Poup];
    NSInteger popupTag1 = ((UIButton *)sender).tag;
    
    [tableiteamname addObject:[statesNameArray objectAtIndex:popupTag1-1]];
    
    
    NSLog(@"STR----------%@",inStr);
    // [priceArrays replaceObjectAtIndex:popupTag1-1 withObject:inStr];
    if(inStr)
    {
        [tableiteamnameprice addObject:[NSString stringWithFormat:@"%@",inStr]];
        inStr=NULL;
        
    }
    else   [tableiteamnameprice addObject:[priceArrays objectAtIndex:popupTag1-1]];
    
    
    NSLog(@"Dheeraj-- %@",tableiteamnameprice);
    
    
    [tbliteamid addObject:[idarrays objectAtIndex:popupTag1-1]];
    
    
    
    NSLog(@"idarraysww %@",idarrays );
    NSLog(@"tbliteamid %@",tbliteamid );
    
    [tblquantity addObject:[NSString stringWithFormat:@"%@",quntitynotextfield.text]];
    
    
    NSLog(@"SSSS %@",remarktextfield.text);
    if([remarktextfield.text length]>0){
        //remarktextfield.text=@"dheeraj";
        NSLog(@"oksss");
        [tblcommenttext addObject:[NSString stringWithFormat:@"%@",remarktextfield.text]];
        
    }
    else{
        NSLog(@"NULL");
        [tblcommenttext addObject:[NSString stringWithFormat:@"Instruction"]];
        
    }
    
    
    allprice=0.0;
    for (int k=0; k<[tableiteamnameprice count]; k++) {
        allprice=allprice + [[tableiteamnameprice  objectAtIndex:k] floatValue];
    }
    NSLog(@"dedEW %@  %@ %@ add---%f",tableiteamname,tableiteamnameprice,tblquantity,allprice);
    itemtotalprice.text =[NSString stringWithFormat:@"$%.2f", allprice];
    itemtotalprice1.text =[NSString stringWithFormat:@"$%.2f", allprice];
    
    [tableview reloadData];
    NSLog(@"Allarray-- %@",finalArray);
    
}


-(void)additeam_desc_poup_animation{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.50];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.40];
    HelpView.alpha=0.7;
    Poup_over_image_top.alpha=1.9;
    Poup_over_image_bottom.alpha=1.9;
    Poup_over_image.alpha=1.9;
    [UIView commitAnimations];
    
    
    [UIView commitAnimations];
    
}



-(void)Close_Additeam_desc_Poup{
    stopdoublselection=FALSE;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDuration:0.40];
    HelpView.alpha=0.0;
    Poup_over_image_top.alpha=0.0;
    Poup_over_image_bottom.alpha=0.0;
    Poup_over_image.alpha=0.0;
    [UIView commitAnimations];
    
    
}




-(void)poup_view_iteam{
    
    if(iteampoup){
        iteampoup=FALSE;
        
        [self hide_poup_additeam];
        
        // [iteambgimg setFrame:CGRectMake(1124,72, 565.5,600.5)];
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.4];
        [UIView setAnimationDelegate:self];
        [iteambgimg setFrame:CGRectMake(452,72, 565.5,600.5)];
        [UIView commitAnimations];
        [Bg addSubview:iteambgimg];
    }
    else
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.4];
        [UIView setAnimationDelegate:self];
        [iteambgimg setFrame:CGRectMake(452,72, 565.5,600.5)];
        [UIView commitAnimations];
        [Bg addSubview:iteambgimg];
        
        
    }
    
}

-(void)hide_poup_view_iteam{
    if(!iteampoup){
        iteampoup=TRUE;
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.2];
        [UIView setAnimationDelegate:self];
        [iteambgimg setFrame:CGRectMake(1124,72, 565.5,600.5)];
        [UIView commitAnimations];
        [Bg addSubview:iteambgimg];
    }
    
    // [self performSelector:@selector(delay) withObject:nil afterDelay:.2];
    
}








-(void)poup_additeam{
    [self hide_poup_view_iteam];
    
    //[self performSelector:@selector(hide_poup_view_iteam) withObject:nil afterDelay:.2];
    
    submitBtn.hidden=TRUE;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelegate:self];
    [addlistbgimage setFrame:CGRectMake(452,72, 565.5,600.5)];
    [UIView commitAnimations];
    [Bg addSubview:addlistbgimage];
    
    
}

-(void)poup_additeam_test{
    [self performSelector:@selector(poup_additeam) withObject:nil afterDelay:.1];
}



-(void)hide_poup_additeam{
    
    cattopimage.hidden=TRUE;
    
    //  [self poup_view_iteam];
    
    [self performSelector:@selector(poup_view_iteam) withObject:nil afterDelay:.2];
    
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelegate:self];
    [addlistbgimage setFrame:CGRectMake(452,1110, 565.5,600.5)];
    [UIView commitAnimations];
    [Bg addSubview:addlistbgimage];
    [self performSelector:@selector(delay) withObject:nil afterDelay:.3];
    
}
-(void)delay{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.4];
    [UIView setAnimationDelegate:self];
    submitBtn.hidden=FALSE;
    [UIView commitAnimations];
}


-(void)quntityplusandminusactionupdatepoup:(id)sender{
    NSInteger temptagvl = ((UIButton *)sender).tag;
    
    tempstore=quntitynotextfield.text;
    
    tempint=[tempstore integerValue];
    
    
    // if temptagvl=100 or 200 than work on addition poupbgmain big
    
    if(temptagvl==1000){
        if(tempint >1){
            tempint=tempint-1;
            quntitynotextfield.text=[NSString stringWithFormat:@"%d",tempint];
            
            // NSString * priceupdate =[tableiteamnameprice objectAtIndex:updatepricetag];
            
            NSLog(@"updatepricetag---- %@",actualpriceupdatebigpoup);
            NSLog(@"tempint---- %d",tempint);
            
            NSString * priceupdate =  actualpriceupdatebigpoup;
            
            
            
            NSLog(@"updatepricetag %d",updatepricetag);
            NSLog(@"priceupdate %@",priceupdate);
            ik=[priceupdate floatValue];
            NSLog(@"priceupdate %@",priceupdate);
            ik=ik*tempint;
            NSLog(@"ik %f",ik);
            inStr = [NSString stringWithFormat:@"%.2f",ik ];
            [inStr retain];
            
            
        }else{
            tempint=1;
            quntitynotextfield.text=[NSString stringWithFormat:@"%d",tempint];
            
        }
    }
    else if(temptagvl==2000){
        tempint=tempint+1;
        
        NSLog(@"tempint %d",tempint);
        
        quntitynotextfield.text=[NSString stringWithFormat:@"%d",tempint];
        
        NSLog(@"updatepricetag---- %@",actualpriceupdatebigpoup);
        NSLog(@"tempint---- %d",tempint);
        
        NSString * priceupdate =  actualpriceupdatebigpoup;
        
        
        // NSString * priceupdate =[tableiteamnameprice objectAtIndex:updatepricetag];
        NSLog(@"priceupdate %@",priceupdate);
        ik=[priceupdate floatValue];
        NSLog(@"priceupdate %@",priceupdate);
        ik=ik*tempint;
        NSLog(@"ik %f",ik);
        inStr = [NSString stringWithFormat:@"%.2f",ik ];
        [inStr retain];
        
        //[priceArrays replaceObjectAtIndex:updatepricetag withObject:inStr];
        
        
    }
    
    
}



-(void)quntityplusandminusaction:(id)sender{
    NSInteger temptagvl = ((UIButton *)sender).tag;
    
    tempstore=quntitynotextfield.text;
    
    tempint=[tempstore integerValue];
    
    
    // if temptagvl=100 or 200 than work on addition poupbgmain big
    
    if(temptagvl==100){
        if(tempint >1){
            tempint=tempint-1;
            quntitynotextfield.text=[NSString stringWithFormat:@"%d",tempint];
            
            NSString * priceupdate =[priceArrays objectAtIndex:updatepricetag];
            NSLog(@"priceupdate %@",priceupdate);
            ik=[priceupdate floatValue];
            NSLog(@"priceupdate %@",priceupdate);
            ik=ik*tempint;
            NSLog(@"ik %f",ik);
            inStr = [NSString stringWithFormat:@"%.2f",ik ];
            [inStr retain];
            
            
        }else{
            tempint=1;
            quntitynotextfield.text=[NSString stringWithFormat:@"%d",tempint];
            
        }
    }
    else if(temptagvl==200){
        tempint=tempint+1;
        
        NSLog(@"tempint %d",tempint);
        
        quntitynotextfield.text=[NSString stringWithFormat:@"%d",tempint];
        
        
        NSString * priceupdate =[priceArrays objectAtIndex:updatepricetag];
        NSLog(@"priceupdate %@",priceupdate);
        ik=[priceupdate floatValue];
        NSLog(@"priceupdate %@",priceupdate);
        ik=ik*tempint;
        NSLog(@"ik %f",ik);
        inStr = [NSString stringWithFormat:@"%.2f",ik ];
        [inStr retain];
        
        //[priceArrays replaceObjectAtIndex:updatepricetag withObject:inStr];
        
    }
    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
    
    
    
    // Dispose of any resources that can be recreated.
}

@end
