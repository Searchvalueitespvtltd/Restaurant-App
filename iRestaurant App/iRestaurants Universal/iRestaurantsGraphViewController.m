//
//  iRestaurantsGraphViewController.m
//  iRestaurants Universal
//
//  Created by Dex on 16/02/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//
BOOL callservicedetail;
NSString * calldayservicedate;

#import "iRestaurantsGraphViewController.h"

@interface iRestaurantsGraphViewController ()

@end

@implementation iRestaurantsGraphViewController


//@synthesize _SaleBlockView,SaleBarGraphImage,value,StockBarGraphAnimationTagVal,SaleBarGraphHiddenBtnTagVal,StockBarGraphHiddenBtnTagVal,SaleBarGraphTagValDsplyTag,SaleBarGraphAnimationTagVal;
//

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
//      self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:229/255.0 blue:208/255.0 alpha:1];
    
    SaleBarGraphAnimationTagVal= 200;   //Tag Value for inslize Sale bar graph animated bar
      
    SaleBarGraphTagValDsplyTag=3000;    //Tag Value for Display Sale bar Graph Value Upan Each bar
    SaleBarGraphHiddenBtnTagVal=1000;   //Tag Value for Display Hidden btn Sale bar Graph Value Upan Each bar
      
    xPositionSaleBarGraph = 15.0f;              //Xposition for Sale barGraph and City lable for sale area 
    xPositionSaleBarGraphHiddenBtn = 15.0f;     //Xposition for Sale barGraph Hidden btn  sale area 
    xPositionSaleValueDisplyBarGraphlbl=15.0f;  //Xposition for Display Sale Bare value for each bar lable
      

    
       
    UIImageView *  bg = [[[UIImageView alloc] init]autorelease];
    bg.frame=CGRectMake(0, 0, 1024, 768);
    [bg setBackgroundColor:[UIColor clearColor]];
    [bg setImage:[UIImage imageNamed:@"main-bg.png"]];
    [self.view addSubview:bg];

    
    UIImageView * allorderbglogo = [[[UIImageView alloc] initWithFrame:CGRectMake(422,15,150,40)]
                                    autorelease];
    [allorderbglogo setImage:[UIImage imageNamed:@"logo.png"]];
    allorderbglogo.opaque = YES;
    [bg addSubview:allorderbglogo];

    
//    //DISPLAY LABEL VALUE WHEN SALE BAR GRAPH TOUCHED
//    UILabel *  navbartoplbl = [ [UILabel alloc ] initWithFrame:CGRectMake(420,55,305,40)];
//    navbartoplbl.textAlignment =  UITextAlignmentLeft;
//    navbartoplbl.textColor = [UIColor lightGrayColor];
//    navbartoplbl.numberOfLines=1;
//    navbartoplbl.text = @"Dash Board Panel";
//    navbartoplbl.backgroundColor = [UIColor clearColor];
//    navbartoplbl.font = [UIFont fontWithName:@"Arial-BoldMT" size:(18.0)];
//    [self.view addSubview:navbartoplbl];
//
//    
//    UIImageView * allorderbglogo = [[[UIImageView alloc] initWithFrame:CGRectMake(420,20,150,40)]
//                                    autorelease];
//    [allorderbglogo setImage:[UIImage imageNamed:@"logo.png"]];
//    allorderbglogo.opaque = YES;
//    [bg addSubview:allorderbglogo];


    
     Poup_over_image_top = [[[UIImageView alloc] init]autorelease];
    Poup_over_image_top.frame=CGRectMake(50, 108, 920, 271);
    [Poup_over_image_top setBackgroundColor:[UIColor clearColor]];
    [Poup_over_image_top setImage:[UIImage imageNamed:@"basegraphbg.png"]];
    [self.view addSubview:Poup_over_image_top];
    
    
    
    Poup_over_image_top2 = [[[UIImageView alloc] init]autorelease];
    Poup_over_image_top2.frame=CGRectMake(50, 411, 920, 271);
    [Poup_over_image_top2 setBackgroundColor:[UIColor clearColor]];
    [Poup_over_image_top2 setImage:[UIImage imageNamed:@"basegraphbg.png"]];
    [self.view addSubview:Poup_over_image_top2];

    
    
    UIButton * backbtn =[UIButton buttonWithType:UIButtonTypeCustom];
    backbtn.frame=CGRectMake(10,15,60,33);
    [backbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"backbtn" ofType:@"png"]] forState:UIControlStateNormal];
   
   [backbtn addTarget:self action:@selector(backview) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backbtn];
    
    activityIndicatoorallorder = [[UIActivityIndicatorView alloc]init] ;
       
    //
// //ACTIVATE ALL ARRAY VALUES
//    [self AllArrayFunctions];
//    
//    //ACTIVATE All SCROLL VIEW
//    [self GenerateAllUIScrollViewInLandingView];
//    
////    //ACTIVATE All LAVEL FOR DISPLAY VALUES WHEN TOUCH SALE BAR GRAPH
////    [self ChangeAndDisplayOnClicSaleStockCityValue];
////    
//    //ACTIVATE All BAR GRAPG SCALE BAR
//    [self GenerateAllGraphScaleDynamicFunction];
//    
////    //CALLING TEMP FUNCTION
////    [self JUNKFUN1];
//    
//    //ACTIVATE SALE VIEW BLOCK AREA WITH ANIMATED GRAPH -> THAN STOCK GRAPH -> AREA THAN READITOR 
//    [self GenerateSaleViewBlockGraphFunction];
//    
////    //ACTIVATE STOCK AREA BLOCK WITHOUT ANIMATION STOCK GRAPH ANIMATION START WHEN SALE PROCESS END
//   [self GenerateStockViewBlockGraphFunction];
//    
//  
    
    [self Actiontocallserviceallsale];
    
}


-(void)backview{
[self.navigationController popViewControllerAnimated:YES];
}


-(void)Actiontocallserviceallsale{
    salePriceArr = [[NSMutableArray alloc]init];
    saleDateArr = [[NSMutableArray alloc]init];
    saleDayArr = [[NSMutableArray alloc]init];
    StockTotalArr=[[NSMutableArray alloc]init];
    StockNameArr=[[NSMutableArray alloc]init];
    IsSaleview=TRUE;
    [self callWebService1];
}




-(void)callWebService1{
    
    
//    activityIndicatoorallorder = [[UIActivityIndicatorView alloc]init] ;
    activityIndicatoorallorder.frame=CGRectMake(495, 380,40, 40);
    activityIndicatoorallorder.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [ activityIndicatoorallorder setColor:[UIColor blackColor]];
    activityIndicatoorallorder.hidesWhenStopped = YES;
    [self.view addSubview:activityIndicatoorallorder];

    
    [activityIndicatoorallorder startAnimating];

    if(IsSaleview){
     NSLog(@"SALE SERVICE");
        soapMessage = [NSString stringWithFormat:
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                   "<soap:Body>"
                   "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?graph/\" />"
                   "</soap:Body>"
                   "</soap:Envelope>"];
	
    
    url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?graph"]];
    }
    else  if(IsStockview){
        
        soapMessage = [NSString stringWithFormat:
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                       "<soap:Body>"
                       "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?graph&date=%@/\" />"
                       "</soap:Body>"
                       "</soap:Envelope>",calldayservicedate];
        
        
        url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?graph&date=%@",calldayservicedate]];

        NSLog(@"STOCK SERVICE");
    
    
    
    
    }
    
  	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
	[theRequest setHTTPMethod:@"POST"]; //Method
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
	
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
	
    if( theConnection )	{webData = [[NSMutableData data] retain];}
	else{NSLog(@"theConnection is NULL");}
	
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



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementName isEqualToString:@"price"]) {
		soapResults = [[NSMutableString alloc]init];
   }
    if ([elementName isEqualToString:@"Date"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    if ([elementName isEqualToString:@"DAY"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    if ([elementName isEqualToString:@"TOTAL"]) {
		soapResults = [[NSMutableString alloc]init];
    }

    if ([elementName isEqualToString:@"NAME"]) {
		soapResults = [[NSMutableString alloc]init];
    }

    
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	[soapResults appendString:string];
	
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	if ([elementName isEqualToString:@"price"]) {
		//salePriceArr=[[NSMutableArray alloc]init];
        [salePriceArr addObject:soapResults];
        [soapResults release];
		soapResults = nil;	}
    if ([elementName isEqualToString:@"Date"]) {
		//saleDateArr=[[NSMutableArray alloc]init];
        [saleDateArr addObject:soapResults];
        [soapResults release];
		soapResults = nil;	}
    if ([elementName isEqualToString:@"DAY"]) {
		//saleDayArr=[[NSMutableArray alloc]init];
        [saleDayArr addObject:soapResults];
        [soapResults release];
		soapResults = nil;	}
    
    if ([elementName isEqualToString:@"TOTAL"]) {
		//StockTotalArr=[[NSMutableArray alloc]init];
        [StockTotalArr addObject:soapResults];
        [soapResults release];
		soapResults = nil;	}

    if ([elementName isEqualToString:@"NAME"]) {
		//StockNameArr=[[NSMutableArray alloc]init];
        [StockNameArr addObject:soapResults];
        [soapResults release];
		soapResults = nil;	}

}



-(void)connectionDidFinishLoading:(NSURLConnection *)connection //when connection done to recieve data
{
	
    [activityIndicatoorallorder stopAnimating];
    
    NSLog(@"DONE. Received Bytes: %d", [webData length]);
	
	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"the xml %@", theXML);
	[theXML release];
	
	if(xmlParser) {[xmlParser release];
		     xmlParser = NULL;}
	xmlParser = [[NSXMLParser alloc] initWithData: webData]; //assign incoding webdata in to xmlparser
	[xmlParser setDelegate: self];
	[xmlParser setShouldResolveExternalEntities: YES];
	[xmlParser parse];
    
    
    NSLog(@"salePriceArr %@",salePriceArr);
  
    
    
    if(IsSaleview){
        IsSaleview=FALSE;
 
    //ACTIVATE ALL ARRAY VALUES
    [self salelogicalFunctions];
    
    //ACTIVATE All SCROLL VIEW
    [self GenerateAllUIScrollViewInLandingView];
    
    //    //ACTIVATE All LAVEL FOR DISPLAY VALUES WHEN TOUCH SALE BAR GRAPH
    //    [self ChangeAndDisplayOnClicSaleStockCityValue];
    //
    //ACTIVATE All BAR GRAPG SCALE BAR
    [self GenerateAllGraphScaleDynamicFunction];
  
        //ACTIVATE SALE VIEW BLOCK AREA WITH ANIMATED GRAPH -> THAN STOCK GRAPH -> AREA THAN READITOR
    [self GenerateSaleViewBlockGraphFunction];
    
//    //    //ACTIVATE STOCK AREA BLOCK WITHOUT ANIMATION STOCK GRAPH ANIMATION START WHEN SALE PROCESS END
//    [self GenerateStockViewBlockGraphFunction];
    }
    else  if(IsStockview){
        IsStockview=FALSE;
        
        StockBarGraphAnimationTagVal = 500; //Tag Value for inslize Stock bar graph animated bar
        StockBarGraphTagValDsplyTag=4000;  //Tag Value for Display Stock bar Graph Value Upan Each bar
        
        StockBarGraphHiddenBtnTagVal=2000;  //Tag Value for Display Hidden btn Stock bar Graph Value Upan Each bar
        
        xPositionStockBarGraph = 15.0f;              //Xposition for Stock barGraph and City lable for sale area
        xPositionStockBarGraphHiddenBtn =15.0f;      //Xposition for Stock barGraph Hidden btn  Stock area
        xPositionStockValueDisplyBarGraphlbl=15.0f;  //Xposition for Display Stock Bare value for each bar lable
        

        
        for (UIView* view in [Poup_over_image_top2 subviews]) {
            if([view isKindOfClass:[UILabel class]]){
                StockScaleGraphBarLabel = (UILabel*)view;
                [StockScaleGraphBarLabel removeFromSuperview];
            }
        }
     //khu
       
        for (UIView* view in [stockscroll subviews]) {
            if([view isKindOfClass:[UIImageView class]]){
                StockBarGraphImage = (UIImageView*)view;
                [StockBarGraphImage removeFromSuperview];
            }
        }

        for (UIView* view in [stockscroll subviews]) {
            if([view isKindOfClass:[UILabel class]]){
                stockValBarDisplaylbl = (UILabel*)view;
                [stockValBarDisplaylbl removeFromSuperview];
            }
        }

        for (UIView* view in [stockscroll subviews]) {
            if([view isKindOfClass:[UILabel class]]){
                StockCityNameLable = (UILabel*)view;
                [StockCityNameLable removeFromSuperview];
            }
        }

        
           
        [self GeneratestockGraphScaleDynamicFunction];
        [self stocklogicalFunctions];
        //    //ACTIVATE STOCK AREA BLOCK WITHOUT ANIMATION STOCK GRAPH ANIMATION START WHEN SALE PROCESS END
        [self GenerateStockViewBlockGraphFunction];

        //BIGEN STOCK BAR GRAPH ANIMATION FUNCTION
        [self StockBarGraphWithAnimationFunction];
        
        //BIGEN HIDDEN BTN OVER STOCK BAR GRAPH ANIMATION
        // [self StockBarGraphHiddenAnimationBtnFunction];
        
        //START DISPLAY STOCK GRAPH VALUE UPAN EACH GRAPH SCAL
        [self StockBarGraphEachBarValueDisplay];

        
        
    }
    
    
    
    
    NSLog(@"StockNameArr=%@",StockNameArr);
    
  
}



-(void)salelogicalFunctions{
    float a,b,c,d,totalmax;
    
    SaleValueArray = [[NSMutableArray alloc]init];
    NSString * temval;
    NSMutableArray *ArrayData = [[NSMutableArray alloc]init];
    ArrayData = [salePriceArr mutableCopy];
    totalmax= [[salePriceArr valueForKeyPath:@"@max.intValue"] intValue];
    
    
    for(int i=0; i<[ArrayData count]; i++){
        temval=[NSString stringWithFormat:@"%@",[ArrayData objectAtIndex:i]];
        a=[temval floatValue];
        b=totalmax/a;
        c=120/b;
        d=c-b;
        if(d < 1.00){
            d=1.00;
        }
        [SaleValueArray addObject:[NSString stringWithFormat:@"%.2f",d]];
    }
    [SaleValueArray retain];
    //CONTAIN SALE CITY NAME IN ARRAY FORMET
    SaleCityNameArray =[saleDayArr mutableCopy];
    [SaleCityNameArray retain];
    
   
}



-(void)stocklogicalFunctions{
    
   // float e,f,g,h;
 //   StockTotalArr = [[NSMutableArray alloc]init];
  //  NSString * stocktemval;
   // NSMutableArray *stockArrayData = [[NSMutableArray alloc]init];
  //  stockArrayData=[NSMutableArray arrayWithObjects:@"100",@"120",@"50",@"60",@"100",@"100",@"70",@"40",@"80",@"20",@"70",@"70",@"70",@"70",nil];
    
  //  NSMutableArray *ArrayData1 = [[NSMutableArray alloc]init];
 //   stockArrayData = [StockTotalArr mutableCopy];
 //  int stocktotalmax= [[StockTotalArr valueForKeyPath:@"@max.intValue"] intValue];
 //
      
//    for(int i=0; i<[stockArrayData count]; i++){
//        stocktemval=[NSString stringWithFormat:@"%@",[stockArrayData objectAtIndex:i]];
//        e=[stocktemval floatValue];
//        f=stocktotalmax/e;
//        g=120/f;
//        h=g-f;
//        if(h< 1.00){
//            h=1.00;
//        }
//        
//        NSLog(@"TempArrayData- %@--convertval %f",stocktemval,h);
//        
//        //   NSString * tempval2;
//        [stockValueArray addObject:[NSString stringWithFormat:@"%.2f",h]];
//        
//    }
//    
    
   // stockValueArray=[StockTotalArr mutableCopy];
     stockCityArray=[StockNameArr mutableCopy];
    
    NSLog(@"DHEERAJStockTotalArr%@",StockTotalArr);
    
      
[stockCityArray retain];

//[stockValueArray retain];

}





-(void)GenerateAllUIScrollViewInLandingView{
    
//    UIImageView *  Poup_over_image_top = [[[UIImageView alloc] init]autorelease];
//    Poup_over_image_top.frame=CGRectMake(50, 110, 920, 271);
//    [Poup_over_image_top setBackgroundColor:[UIColor clearColor]];
//    [Poup_over_image_top setImage:[UIImage imageNamed:@"graphnavimage"]];
//    // Poup_over_image_top.alpha=0.0;
//    
//    [self.view addSubview:Poup_over_image_top];
//
//    
//    
//    UIImageView *  Poup_over_image_top = [[[UIImageView alloc] init]autorelease];
//    Poup_over_image_top.frame=CGRectMake(50, 110, 920, 271);
//    [Poup_over_image_top setBackgroundColor:[UIColor clearColor]];
//    [Poup_over_image_top setImage:[UIImage imageNamed:@"basegraphbg.png"]];
//   // Poup_over_image_top.alpha=0.0;
//    
//    [self.view addSubview:Poup_over_image_top];
//
//    
//    
//    Poup_over_image_top2 = [[[UIImageView alloc] init]autorelease];
//    Poup_over_image_top2.frame=CGRectMake(50, 413, 920, 271);
//    [Poup_over_image_top2 setBackgroundColor:[UIColor clearColor]];
//    [Poup_over_image_top2 setImage:[UIImage imageNamed:@"basegraphbg.png"]];
//    // Poup_over_image_top.alpha=0.0;
//    
//    [self.view addSubview:Poup_over_image_top2];

    
        
    
    //DISPLAY LABEL VALUE WHEN STOCK BAR GRAPH TOUCHED
    StockOVerStatusLbl = [ [UILabel alloc ] initWithFrame:CGRectMake(5,-2,300,40)];
    StockOVerStatusLbl.textAlignment =  UITextAlignmentLeft;
    StockOVerStatusLbl.textColor = [UIColor darkGrayColor];
    StockOVerStatusLbl.numberOfLines=1;
    StockOVerStatusLbl.text = @"Total Sales (Day Wise)";
    StockOVerStatusLbl.backgroundColor = [UIColor clearColor];
    StockOVerStatusLbl.font = [UIFont fontWithName:@"Arial  MT Bold" size:(9.0)];
    [Poup_over_image_top addSubview:StockOVerStatusLbl];

    
    //DISPLAY LABEL VALUE WHEN SALE BAR GRAPH TOUCHED
    SalesOVerStatusLbl = [ [UILabel alloc ] initWithFrame:CGRectMake(60, 415,300,40)];
    SalesOVerStatusLbl.textAlignment =  UITextAlignmentLeft;
    SalesOVerStatusLbl.textColor = [UIColor darkGrayColor];
    SalesOVerStatusLbl.numberOfLines=1;
    SalesOVerStatusLbl.text =@"";
    SalesOVerStatusLbl.backgroundColor = [UIColor clearColor];
    SalesOVerStatusLbl.font = [UIFont fontWithName:@"Arial  MT Bold" size:(9.0)];
    [self.view addSubview:SalesOVerStatusLbl];

    
    
    
    //UISCROLL VIEW FOR SALE AREA
    //  Salescroll = [[UIScrollView alloc] initWithFrame:CGRectMake(78, 169, 645, 165)];
    Salescroll = [[UIScrollView alloc] initWithFrame:CGRectMake(113, 157, 830, 165)];
    //Salescroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 900, 165)];
	Salescroll.backgroundColor=[UIColor clearColor];
	[Salescroll setShowsHorizontalScrollIndicator:YES];
	[self.view addSubview:Salescroll];
	[Salescroll setBounces:YES];
    
    //UISCROLL VIEW FOR STOCK AREA
    stockscroll = [[UIScrollView alloc] initWithFrame:CGRectMake(113, 460, 830, 165)];
    stockscroll.backgroundColor=[UIColor clearColor];
	[stockscroll setShowsHorizontalScrollIndicator:YES];
	[Poup_over_image_top2 addSubview:stockscroll];
	[stockscroll setBounces:YES];
}


-(void)GeneratestockGraphScaleDynamicFunction{
    //COLLECT MAX VAL OF ARRAY// no nwwd dynamic
    int maxsaleval =120; //[[StockTotalArr valueForKeyPath:@"@max.intValue"] intValue];
  
    //CALCULATE RATIO FOR DYNAMIC SCALE
    int SaleScale= maxsaleval/5;
   // CGFloat salescaleY = 260.0f;
    CGFloat StockscaleY =150; //562.0f;
    //  CGFloat CreditorscaleX = 575.0f;
    int m1=5;
    for(int m=0; m<=5; m++)
    {
        
        //DISPLAY SCALE BAR FOR STOCK SCALE BAR AREA
        StockScaleGraphBarLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(28,StockscaleY,25,60)];
        StockScaleGraphBarLabel.textAlignment =  UITextAlignmentRight;
        StockScaleGraphBarLabel.textColor = [UIColor darkGrayColor];
        StockScaleGraphBarLabel.numberOfLines=1;
        StockScaleGraphBarLabel.text = [NSString stringWithFormat:@"%d", SaleScale*m];
        StockScaleGraphBarLabel.backgroundColor = [UIColor clearColor];
        StockScaleGraphBarLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(12.0)];
        [Poup_over_image_top2  addSubview:StockScaleGraphBarLabel];
        
        
        
        //DISPLAY SALE BAR GRAPH VELUE AREA UPON SCROLL VIEW EACH BAR GRAPH
        stockdetail  = [ [UILabel alloc ] initWithFrame:CGRectMake(490,220,400,40)];
        stockdetail.textAlignment = 2;
        stockdetail.textColor = [UIColor grayColor];
        stockdetail.numberOfLines=2;
        stockdetail.text =@"";
        stockdetail.backgroundColor = [UIColor clearColor];
        stockdetail.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(14.0)];
        [Poup_over_image_top2 addSubview:stockdetail];
        
        

        
        
        
        
        StockscaleY -= StockScaleGraphBarLabel.frame.size.height-37;
        
     //   salescaleY -= SaleScaleGraphBarLabel.frame.size.height-37;
        
        m1 --;
        
    }
    
}





-(void)GenerateAllGraphScaleDynamicFunction{
    //COLLECT MAX VAL OF ARRAY
    int maxsaleval = [[salePriceArr valueForKeyPath:@"@max.intValue"] intValue];
    
    //CALCULATE RATIO FOR DYNAMIC SCALE
    int SaleScale= maxsaleval/5;
    CGFloat salescaleY = 260.0f;
    int m1=5;
    for(int m=0; m<=5; m++)
    {
        //DISPLAY SCALE BAR  FOR SALE SCALE BAR AREA 
        SaleScaleGraphBarLabel = [ [UILabel alloc ] initWithFrame:CGRectMake(75,salescaleY,25,60)];
        SaleScaleGraphBarLabel.textAlignment =  UITextAlignmentRight;
        SaleScaleGraphBarLabel.textColor = [UIColor darkGrayColor];
        SaleScaleGraphBarLabel.numberOfLines=1;
        SaleScaleGraphBarLabel.text = [NSString stringWithFormat:@"%d", SaleScale*m];
        SaleScaleGraphBarLabel.backgroundColor = [UIColor clearColor];
        SaleScaleGraphBarLabel.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(12.0)];
        [self.view addSubview:SaleScaleGraphBarLabel];
        
        
        salescaleY -= SaleScaleGraphBarLabel.frame.size.height-37;
   
        m1 --;
        
     }
    
}


//START SALE  BAR GRAPH AREA
-(void)GenerateSaleViewBlockGraphFunction{
    
    SaleDefaultX = 15.0f;  //Use creating dynamic CGRectMake
     
    for (int i=0; i < [SaleValueArray count]; i++) {
        
        //GENERATE SALE BAR GRAPH IMAGE UPON SCROLL VIEW
        SaleBarGraphImage = [[UIImageView alloc] initWithFrame:CGRectMake(SaleDefaultX,134, 40, 0)];
        SaleBarGraphImage.tag = i+200;
        SaleBarGraphImage.image = [UIImage imageNamed:@"bar_orange.png"];
        
          
        //DISPLAY SALE BAR GRAPH CITY AREA UPON SCROLL VIEW
        SaleCityNameLable = [ [UILabel alloc ] initWithFrame:CGRectMake(SaleDefaultX-12.0,134,65,20)];
        SaleCityNameLable.textAlignment =  UITextAlignmentCenter;
        SaleCityNameLable.textColor = [UIColor darkGrayColor];
        SaleCityNameLable.numberOfLines=1;
        SaleCityNameLable.text =[SaleCityNameArray objectAtIndex:i]; 
        SaleCityNameLable.backgroundColor = [UIColor clearColor];
        SaleCityNameLable.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(11.0)];
        [Salescroll addSubview:SaleCityNameLable];
        
      
        
        //DISPLAY SALE BAR GRAPH CITY AREA UPON SCROLL VIEW
        SaleCityNamedateLable = [ [UILabel alloc ] initWithFrame:CGRectMake(SaleDefaultX-12.0,147,65,20)];
        SaleCityNamedateLable.textAlignment =  UITextAlignmentCenter;
        SaleCityNamedateLable.textColor = [UIColor darkGrayColor];
        SaleCityNamedateLable.numberOfLines=1;
        SaleCityNamedateLable.text =[saleDateArr objectAtIndex:i];
        SaleCityNamedateLable.backgroundColor = [UIColor clearColor];
        SaleCityNamedateLable.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(11.0)];
        [Salescroll addSubview:SaleCityNamedateLable];
        

        
        
        
        //DISPLAY SALE BAR GRAPH VELUE AREA UPON SCROLL VIEW EACH BAR GRAPH
        saleValBarDisplaylbl = [ [UILabel alloc ] initWithFrame:CGRectMake(SaleDefaultX,134-[[SaleValueArray objectAtIndex:i]floatValue], 40, 0)];
        saleValBarDisplaylbl.textAlignment =  UITextAlignmentCenter;
        saleValBarDisplaylbl.textColor = [UIColor orangeColor];
        saleValBarDisplaylbl.numberOfLines=1;
        saleValBarDisplaylbl.text =[salePriceArr objectAtIndex:i]; 
        saleValBarDisplaylbl.tag= i+3000;
        saleValBarDisplaylbl.backgroundColor = [UIColor clearColor];
        saleValBarDisplaylbl.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(11.0)];
        [Salescroll addSubview:saleValBarDisplaylbl];
        
        
        CGRect rect = SaleBarGraphImage.frame;
        rect.origin.x = SaleDefaultX;
        SaleBarGraphImage.frame = rect;
		
        
        // SaleDefaultX += SaleBarGraphImage.frame.size.width+35;
        [Salescroll addSubview:SaleBarGraphImage];
        
        
        //DISPLAY SALE BAR GRAPH REVEUE HIDDEN BUTTON AREA UPON SCROLL VIEW WITH BUTTON ACTION
        SaleBarGraphHiddenBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        SaleBarGraphHiddenBtn.frame=CGRectMake(SaleDefaultX,134, 40, 0);
        SaleBarGraphHiddenBtn.tag= i+1000;
        [SaleBarGraphHiddenBtn addTarget:self action:@selector(SaleBarandStockGraphImageTouchAction:) forControlEvents:UIControlEventTouchUpInside];
       	[Salescroll addSubview:SaleBarGraphHiddenBtn];
        
        SaleDefaultX += SaleBarGraphImage.frame.size.width+33;
        
        
        
    }
    
    
    
    Salescroll.contentSize = CGSizeMake(SaleDefaultX, 0);
    [self.view addSubview:Salescroll];
    
    
    //START FUNCTION TASK FOR SALE BAR GRAPH ANAMITING  
    // [self SaleBarGraphWithAnimationFunction]; 
    
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(SaleBarGraphWithAnimationFunction) userInfo:nil
                                    repeats:NO];
    
    
    
    //START FUNCTION TASK FOR SALE BAR GRAPH HIDDEN BTN
    //    [self SaleBarGraphHiddenAnimationBtnFunction];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(SaleBarGraphHiddenAnimationBtnFunction) userInfo:nil
                                    repeats:NO];
    
    
    
    //START FUNCTION TASK FOR SALE BAR GRAPH HIDDEN BTN
    //    [self SaleBarGraphHiddenAnimationBtnFunction];
    [NSTimer scheduledTimerWithTimeInterval:0.9 target:self selector:@selector(SaleBarGraphEachBarValueDisplay) userInfo:nil
                                    repeats:NO];
    
    
    
}



-(void)SaleBarGraphWithAnimationFunction{
    //SALE BAR GRAPH ANAMITION WITH TAG VALUE
    
    NSLog(@"SaleBarGraphAnimationTagVal %d  [SaleValueArray count] %d",SaleBarGraphAnimationTagVal,[SaleValueArray count]);
    
    
    if (SaleBarGraphAnimationTagVal - 200 < [SaleValueArray count]) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        NSInteger SaleValue= [[SaleValueArray objectAtIndex:SaleBarGraphAnimationTagVal-200]intValue];
        
        UIImageView * graphImage = (UIImageView *)([self.view viewWithTag:SaleBarGraphAnimationTagVal]);
        graphImage.frame = CGRectMake(xPositionSaleBarGraph,134-SaleValue, 40, SaleValue);
        CGRect rect = graphImage.frame;
        
        
        //saleValueDisplaylbl = [ [UILabel alloc ] initWithFrame:CGRectMake(xPosition,134-SaleValue, 40, SaleValue)];
        
        rect.origin.x = xPositionSaleBarGraph;
        graphImage.frame = rect;
		
        xPositionSaleBarGraph += graphImage.frame.size.width+33;
        
        [UIView commitAnimations];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(SaleBarGraphWithAnimationFunction) userInfo:nil
                                        repeats:NO];
        SaleBarGraphAnimationTagVal++;
    }
//    else {
//        
//        //BIGEN STOCK BAR GRAPH ANIMATION FUNCTION
//        [self StockBarGraphWithAnimationFunction];
//        
//        //BIGEN HIDDEN BTN OVER STOCK BAR GRAPH ANIMATION  
//       // [self StockBarGraphHiddenAnimationBtnFunction];
//        
//        //START DISPLAY STOCK GRAPH VALUE UPAN EACH GRAPH SCAL
//        [self StockBarGraphEachBarValueDisplay];
//        
//        
//    }
else
[self firsttimecalldetailitem];
 
}


-(void)SaleBarGraphHiddenAnimationBtnFunction{
    //SALE BAR GRAPH HIDDEN BTN ANAMITION WITH TAG VALUE
    if (SaleBarGraphHiddenBtnTagVal - 1000 < [SaleValueArray count]) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        NSInteger SaleValue= [[SaleValueArray objectAtIndex:SaleBarGraphHiddenBtnTagVal-1000]intValue];
        
        UIButton * Salegraphbtn = (UIButton *)([self.view viewWithTag:SaleBarGraphHiddenBtnTagVal]);
        Salegraphbtn.frame = CGRectMake(xPositionSaleBarGraphHiddenBtn,134-SaleValue, 40, SaleValue);
        CGRect rect = Salegraphbtn.frame;
        
        rect.origin.x = xPositionSaleBarGraphHiddenBtn;
        Salegraphbtn.frame = rect;
		
        xPositionSaleBarGraphHiddenBtn += Salegraphbtn.frame.size.width+33;
        [UIView commitAnimations];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(SaleBarGraphHiddenAnimationBtnFunction) userInfo:nil
                                        repeats:NO];
        SaleBarGraphHiddenBtnTagVal++;
    }
    
}



-(void)SaleBarGraphEachBarValueDisplay{
    //SALE BAR GRAPH HIDDEN BTN ANAMITION WITH TAG VALUE
    if (SaleBarGraphTagValDsplyTag - 3000 < [SaleValueArray count]) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        NSInteger SaleValue= [[SaleValueArray objectAtIndex:SaleBarGraphTagValDsplyTag-3000]intValue];
        
        UILabel * Salegraphbtn = (UILabel *)([self.view viewWithTag:SaleBarGraphTagValDsplyTag]);
        Salegraphbtn.frame = CGRectMake(xPositionSaleValueDisplyBarGraphlbl,116-SaleValue, 40, 20);
        [Salescroll addSubview:Salegraphbtn];
        CGRect rect = Salegraphbtn.frame;
        
        rect.origin.x = xPositionSaleValueDisplyBarGraphlbl;
        Salegraphbtn.frame = rect;
		
        xPositionSaleValueDisplyBarGraphlbl += Salegraphbtn.frame.size.width+33;
        [UIView commitAnimations];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(SaleBarGraphEachBarValueDisplay) userInfo:nil
                                        repeats:NO];
        SaleBarGraphTagValDsplyTag++;
    }
    
}


//END SALE  BAR GRAPH AREA

//vini

-(void)SaleBarandStockGraphImageTouchAction:(id)sender{
    
    //CHANGE VALUES SALES LABEL WEHEN TOUCH  SALE BAR GRAPH
    if ([sender tag] - 1000 < [SaleValueArray count]) {
        
        NSString * SaleCityValueNSString= [saleDateArr objectAtIndex:[sender tag]-1000];
        
        
        
        //FIND THE BUTTON TAG UPON ADD IMAGE
        UIButton * graphImageButton = (UIButton *)([self.view viewWithTag:[sender tag]]);
        UIImageView * graphImage = (UIImageView *)([self.view viewWithTag:100]);
        [graphImage removeFromSuperview];
        //MAIN FOOTER  IMAGE AREA
        SaleBarHighlighterImg = [[UIImageView alloc] initWithFrame:CGRectMake(10,3,20,20)];
        SaleBarHighlighterImg.tag = 100;
        SaleBarHighlighterImg.image = [UIImage imageNamed:@"bar_selector_orange.png"];
        [graphImageButton addSubview:SaleBarHighlighterImg];
        NSLog(@"Hilighter");
        
        calldayservicedate=[NSString stringWithFormat:@"%@",SaleCityValueNSString];
        
        
        IsStockview=TRUE;
        
        [StockTotalArr removeAllObjects];
        [ StockNameArr removeAllObjects];
        [stockCityArray removeAllObjects];
        
        SalesOVerStatusLbl.text =  [NSString stringWithFormat:@"Total Iteams Sale On (%@)", SaleCityValueNSString];
        
        [self callWebService1];
        
        
        
    }
    
    //CHANGE VALUES STOCK LABEL WEHEN TOUCH  STOCK BAR GRAPH
    else if ([sender tag] - 2000 < [StockTotalArr count]) {
        
        NSString * SaleCityValueNSString= [stockCityArray objectAtIndex:[sender tag]-2000];
        
//        StockOVerStatusLbl.text = [NSString stringWithFormat:@"(%@)",SaleCityValueNSString];
//        //sharadha
//        
          stockdetail.text =SaleCityValueNSString;
               NSLog(@"Click%@",SaleCityValueNSString);
        
    }
}


-(void)firsttimecalldetailitem{
    IsStockview=TRUE;
   
    [StockTotalArr removeAllObjects];
    [ StockNameArr removeAllObjects];
    [stockCityArray removeAllObjects];
    calldayservicedate=[NSString stringWithFormat:@"%@",[saleDateArr objectAtIndex:0]];
    SalesOVerStatusLbl.text =  [NSString stringWithFormat:@"Total Iteams Sale On (%@)", calldayservicedate];

    NSLog(@"calldayservicedate %@",calldayservicedate);
    
    [self callWebService1];
    

}





//START STOCK BAR GRAPH AREA
-(void)GenerateStockViewBlockGraphFunction{
    StockDefaultX = 15.0f;
     
   // NSLog(@"%@stockValueArraystockValueArray",stockValueArray);
    for (int j=0; j < [StockTotalArr count]; j++) {
        
        // DISPLAY STOCK BAR GRAPH IMAGE	UPON SCROLL VIEW 
        StockBarGraphImage = [[UIImageView alloc] initWithFrame:CGRectMake(StockDefaultX,134, 40, 0)];
        StockBarGraphImage.tag = j+500;
        StockBarGraphImage.image = [UIImage imageNamed:@"bar_purple.png"];
        [stockscroll addSubview:StockBarGraphImage];
        
        //DISPLAY SALE BAR GRAPH REVEUE HIDDEN BUTTON AREA UPON SCROLL VIEW WITH BUTTON ACTION
        StockBarGraphHiddenBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        StockBarGraphHiddenBtn.frame=CGRectMake(StockDefaultX,134, 40, -100);
        StockBarGraphHiddenBtn.tag= j+2000;
        [StockBarGraphHiddenBtn addTarget:self action:@selector(SaleBarandStockGraphImageTouchAction:) forControlEvents:UIControlEventTouchUpInside];
       	[stockscroll addSubview:StockBarGraphHiddenBtn];
        
        
        
        
        
        //DISPLAY Stock BAR GRAPH VELUE AREA UPON SCROLL VIEW EACH BAR GRAPH
        stockValBarDisplaylbl = [ [UILabel alloc ] initWithFrame:CGRectMake(StockDefaultX,134-[[StockTotalArr objectAtIndex:j]floatValue], 40, 0)];
        stockValBarDisplaylbl.textAlignment =  UITextAlignmentCenter;
        stockValBarDisplaylbl.textColor = [UIColor  blueColor];
        stockValBarDisplaylbl.numberOfLines=1;
        stockValBarDisplaylbl.text =[StockTotalArr objectAtIndex:j];
        stockValBarDisplaylbl.tag= j+4000;
        stockValBarDisplaylbl.backgroundColor = [UIColor clearColor];//186-186-211
        stockValBarDisplaylbl.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(11.0)];
        [stockscroll addSubview:stockValBarDisplaylbl];
        
        
        
        
        
        //DISPLAY STOCK BAR GRAPH CITY NAME UPON SCROLL VIEW 
        StockCityNameLable = [ [UILabel alloc ] initWithFrame:CGRectMake(StockDefaultX-12.0,134,65,20)];
        StockCityNameLable.textAlignment =  UITextAlignmentCenter;
        StockCityNameLable.textColor = [UIColor darkGrayColor];
        StockCityNameLable.numberOfLines=1;
        StockCityNameLable.text = [stockCityArray objectAtIndex:j];
        StockCityNameLable.backgroundColor = [UIColor clearColor];
        StockCityNameLable.font = [UIFont fontWithName:@"Arial Rounded MT Bold" size:(11.0)];
        [stockscroll addSubview:StockCityNameLable];
        
        CGRect stockrect = StockBarGraphImage.frame;
        stockrect.origin.x = StockDefaultX;
        StockBarGraphImage.frame = stockrect;
		
        StockDefaultX += StockBarGraphImage.frame.size.width+33;
        
        
    }
    
    stockscroll.contentSize = CGSizeMake(StockDefaultX, 0);
    [self.view addSubview:stockscroll];
    
}




-(void)StockBarGraphWithAnimationFunction{
    //STOCK BAR GRAPH ANAMITION WITH TAG VALUE
    if (StockBarGraphAnimationTagVal - 500 <  [StockTotalArr count]) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        NSInteger SaleValue= [[StockTotalArr objectAtIndex:StockBarGraphAnimationTagVal-500]intValue];
        
        UIImageView * StockgraphImage = (UIImageView *)([self.view viewWithTag:StockBarGraphAnimationTagVal]);
        StockgraphImage.frame = CGRectMake(xPositionStockBarGraph,134-SaleValue, 40, SaleValue);
        CGRect rect = StockgraphImage.frame;
        rect.origin.x = xPositionStockBarGraph;
        StockgraphImage.frame = rect;
		
        xPositionStockBarGraph += StockgraphImage.frame.size.width+33;
        [UIView commitAnimations];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(StockBarGraphWithAnimationFunction) userInfo:nil
                                        repeats:NO];
        StockBarGraphAnimationTagVal++;
    }
    
    
}



-(void)StockBarGraphHiddenAnimationBtnFunction{
    //STOCK BAR GRAPH HIDDEN BTN ANAMITION WITH TAG VALUE
    if (StockBarGraphHiddenBtnTagVal - 2000 < [StockTotalArr count]) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        NSInteger SaleValue= [[StockTotalArr objectAtIndex:StockBarGraphHiddenBtnTagVal-2000]intValue];
        
        UIButton * StockgraphImage = (UIButton *)([self.view viewWithTag:StockBarGraphHiddenBtnTagVal]);
        StockgraphImage.frame = CGRectMake(xPositionStockBarGraphHiddenBtn,134-SaleValue, 40, SaleValue);
        CGRect rect = StockgraphImage.frame;
        
        rect.origin.x = xPositionStockBarGraphHiddenBtn;
        StockgraphImage.frame = rect;
		
        xPositionStockBarGraphHiddenBtn += StockgraphImage.frame.size.width+33;
        [UIView commitAnimations];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(StockBarGraphHiddenAnimationBtnFunction) userInfo:nil
                                        repeats:NO];
        StockBarGraphHiddenBtnTagVal++;
    }
    
    
}





-(void)StockBarGraphEachBarValueDisplay{
    //SALE BAR GRAPH HIDDEN BTN ANAMITION WITH TAG VALUE
    if (StockBarGraphTagValDsplyTag - 4000 <  [StockTotalArr count]) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.2];
        NSInteger SaleValue= [[StockTotalArr objectAtIndex:StockBarGraphTagValDsplyTag-4000]intValue];
        
        
        NSLog(@"STOCKCELL %d",SaleValue);
        
        UILabel * Salegraphbtn = (UILabel *)([self.view viewWithTag:StockBarGraphTagValDsplyTag]);
        Salegraphbtn.frame = CGRectMake(xPositionStockValueDisplyBarGraphlbl,116-SaleValue, 40, 20);
        [stockscroll addSubview:Salegraphbtn];
        CGRect rect = Salegraphbtn.frame;
        
        rect.origin.x = xPositionStockValueDisplyBarGraphlbl;
        Salegraphbtn.frame = rect;
		
        xPositionStockValueDisplyBarGraphlbl += Salegraphbtn.frame.size.width+33;
        [UIView commitAnimations];
        [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(StockBarGraphEachBarValueDisplay) userInfo:nil
                                        repeats:NO];
        StockBarGraphTagValDsplyTag++;
    }
    
}

//END STOCK BAR GRAPH AREA





- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
	return NO;
}

@end
