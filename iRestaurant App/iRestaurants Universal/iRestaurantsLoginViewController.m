//
//  iRestaurantsLoginViewController.m
//  iRestaurants Universal
//
//  Created by Dex on 13/12/12.
//  Copyright (c) 2012 Dex Consulting. All rights reserved.
//

#import "iRestaurantsLoginViewController.h"

NSString * waitername;
NSString * currentwaitername;
NSString * tablenoglob;
@interface iRestaurantsLoginViewController ()

@end

@implementation iRestaurantsLoginViewController

@synthesize irestaurantsHomeViewController=_irestaurantsHomeViewController;
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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UIImageView *  loginbgimg = [[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 1024, 768)] autorelease];
    [loginbgimg setImage:[UIImage imageNamed:@"bg.png"]];
    loginbgimg.opaque = YES;
    loginbgimg.userInteractionEnabled=TRUE;
    [self.view addSubview:loginbgimg];
//
//    UIImageView *  restalogoimg = [[UIImageView alloc] initWithFrame:CGRectMake(400, 50, 230, 160)];
//    [restalogoimg setImage:[UIImage imageNamed:@"logo.png"]];
//    restalogoimg.opaque = YES;
//    restalogoimg.userInteractionEnabled=TRUE;
//    [loginbgimg  addSubview:restalogoimg];
//
    
    
    UIImageView *  loginareabg = [[[UIImageView alloc] initWithFrame:CGRectMake(160, 220, 701, 290)] autorelease];
    [loginareabg setImage:[UIImage imageNamed:@"login-bg.png"]];
    loginareabg.opaque = YES;
    loginareabg.userInteractionEnabled=TRUE;
    [loginbgimg  addSubview:loginareabg];
    
    UIImageView *  waiternamebgimg = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 75, 660, 50)] autorelease];
    [waiternamebgimg setImage:[UIImage imageNamed:@"login-table.png"]];
    waiternamebgimg.opaque = YES;
    waiternamebgimg.userInteractionEnabled=TRUE;
    [loginareabg addSubview:waiternamebgimg];

    
    //Input UserName Text field Area
    waiternametext = [[[UITextField  alloc] initWithFrame:CGRectMake(10, 0, 658,50) ] autorelease];
    waiternametext.borderStyle = UITextBorderStyleNone;
	waiternametext.font = [UIFont fontWithName:@"ArialMT" size:(22.0)];
    waiternametext.textColor=[UIColor grayColor];
    [waiternametext setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    UIColor *color = [UIColor grayColor];
    if (SYSTEM_VERSION_LESS_THAN(@"6.0")) {
        waiternametext.placeholder=@"user name...";
    } else {
        waiternametext.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"user name..." attributes:@{NSForegroundColorAttributeName:color}];
    }
   
	//
    waiternametext.backgroundColor=[UIColor clearColor];
    waiternametext.autocapitalizationType = UITextAutocapitalizationTypeNone;
    waiternametext.delegate = self;
    waiternametext.returnKeyType = UIReturnKeyGo;
    [waiternamebgimg addSubview:waiternametext];

    
    
    UIImageView *  tablebgimg = [[[UIImageView alloc] initWithFrame:CGRectMake(20, 135, 660, 50)] autorelease];
    [tablebgimg setImage:[UIImage imageNamed:@"login-table.png"]];
    tablebgimg.opaque = YES;
    tablebgimg.userInteractionEnabled=TRUE;
    [loginareabg addSubview:tablebgimg];

    
    
    //Input UserName Text field Area
    tblnotext = [[[UITextField  alloc] initWithFrame:CGRectMake(10, 0, 658,50) ] autorelease];
    tblnotext.borderStyle = UITextBorderStyleNone;
    [tblnotext setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
	tblnotext.font = [UIFont fontWithName:@"ArialMT" size:(22.0)];
    tblnotext.textColor=[UIColor grayColor];
    if (SYSTEM_VERSION_LESS_THAN(@"6.0")) {
        tblnotext.placeholder=@"password...";
    } else {
        tblnotext.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"password..." attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    }
   
	
    tblnotext.backgroundColor=[UIColor clearColor];
	tblnotext.delegate = self;
    tblnotext.secureTextEntry = TRUE;
    tblnotext.autocapitalizationType = UITextAutocapitalizationTypeNone;
    tblnotext.returnKeyType = UIReturnKeyGo;
    [tablebgimg addSubview:tblnotext];

    
    
    UIButton * submittblbtn =[UIButton buttonWithType:UIButtonTypeCustom];
	submittblbtn.frame=CGRectMake(280,225,160, 45);
    [submittblbtn setBackgroundImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"loginbtn" ofType:@"png"]] forState:UIControlStateNormal];
	[submittblbtn addTarget:self action:@selector(method_webservice) forControlEvents:UIControlEventTouchUpInside];
	[loginareabg addSubview:submittblbtn];

//    
//    _irestaurantsHomeViewController=[[iRestaurantsHomeViewController alloc]init];
//    [self.navigationController pushViewController:_irestaurantsHomeViewController animated:YES];
//    [_irestaurantsHomeViewController release];

  
    
    // Do any additional setup after loading the view.
}







-(void)method_webservice{
	
	//set full background color
    //	self.view.backgroundColor = [UIColor whiteColor];
	
	indicator = [[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(460, 300, 55, 55)] autorelease];
	indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
	[self.view addSubview:indicator];
    
	[self callWebService1];
    
}


-(void)callWebService1{http://204.197.244.110/~crmdalto/
    
	[indicator startAnimating];
    
    username=[NSString stringWithFormat:@"%@",waiternametext.text];
    password=[NSString stringWithFormat:@"%@",tblnotext.text];
    soapMessage = [NSString stringWithFormat:
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                   "<soap:Body>"
                   "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?user=%@&pass=%@/\" />"
                   "</soap:Body>"
                   "</soap:Envelope>",username,password];
	
    
    url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?user=%@&pass=%@",username,password]];
    
  	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
	
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
	[theRequest setHTTPMethod:@"POST"]; //Method
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
	
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
	
	//NSLog(@"Soap MSG %@",soapMessage);
	
	if( theConnection )	{
		webData = [[NSMutableData data] retain];}
	else	{
		NSLog(@"theConnection is NULL");}
	
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



- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	if ([elementName isEqualToString:@"result"]) {
		soapResults = [[NSMutableString alloc]init];
    }
    
}
    
    
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
	
	[soapResults appendString:string];
	
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	if ([elementName isEqualToString:@"result"]) {
		idArray=[[NSMutableArray alloc]init];

        
        [idArray addObject:soapResults];
       // userloginstatus=[NSString stringWithFormat:@"%@",soapResults];
        [soapResults release];
		soapResults = nil;	}
    
    NSString * temp;
    temp=[NSString stringWithFormat:@"%@",[idArray objectAtIndex:0]];
    
    NSInteger test1;
    test1=[temp integerValue];
   
    NSLog(@"temp %d",test1);
    
    if(test1 > 0) {  userloginstatus = TRUE; }
    else{ userloginstatus = FALSE;}
}



-(void)connectionDidFinishLoading:(NSURLConnection *)connection //when connection done to recieve data
{
	[indicator stopAnimating];
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
    
    
    //Check Boolean Condition
    if(userloginstatus){
        [indicator stopAnimating];
        waitername=@"admin";
        tablenoglob=@"00";
        _irestaurantsHomeViewController=[[[iRestaurantsHomeViewController alloc]init] autorelease];
           [self.navigationController pushViewController:_irestaurantsHomeViewController animated:YES];
           [_irestaurantsHomeViewController release];
        NSLog(@"LOgin Sucess ");
    }else{
     [indicator stopAnimating];
        
//        
//        
//        waitername=waiternametext.text;
//        tablenoglob=@"00";
//        _irestaurantsHomeViewController=[[iRestaurantsHomeViewController alloc]init];
//        [self.navigationController pushViewController:_irestaurantsHomeViewController animated:YES];
//        [_irestaurantsHomeViewController release];
//
        
        
     UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
                                initWithTitle:@"Login Alert:"
                                message:@"Wrong user name or password."
                                delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [message show]; //msg show
        [message release];//msg release
        NSLog(@"LOgin Unsuccessful "); }
}



- (BOOL)textFieldShouldReturn:(UITextField *)t {
    [waiternametext resignFirstResponder];
      [tblnotext resignFirstResponder];
  //  [self submittblAction];
    
    return YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [waiternametext resignFirstResponder];
    [tblnotext resignFirstResponder];}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
