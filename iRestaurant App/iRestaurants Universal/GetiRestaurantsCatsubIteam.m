//
//  GetiRestaurantsCatsubIteam.m
//  iRestaurants Universal
//
//  Created by Dex on 03/01/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import "GetiRestaurantsCatsubIteam.h"

BOOL stopdoublselection;

@implementation GetiRestaurantsCatsubIteam

@synthesize delegate;

-(void)callWebService:(NSInteger )country{
   	NSLog(@"callWebService fn caalled %d",country);
    
  NSString * soapMessage  = [NSString stringWithFormat:
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                   "<soap:Body>"
                   "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?catname=%d/\" />"
                   "</soap:Body>"
                   "</soap:En velope>",country];
    
    
    NSURL * url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?catname=%d",country]];
	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
	[theRequest setHTTPMethod:@"POST"]; //Method
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
	
	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
	
	NSLog(@"GetiRestaurantsCatsubIteam URL -----  %@",theRequest);
	if( theConnection )	{
		webData = [[NSMutableData data] retain];}
	else	{
		NSLog(@"theConnection is NULL");}
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
	[webData setLength: 0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
	[webData appendData:data];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
	[connection release];
	[webData release];
	webData = nil;
    //[delegate stateListHere:nil status:FALSE];

    [delegate stateListHere:localStatesArray getID:localidStatesArray getdesc:localdescrStatesArray  getprepTime:localpreptimeStatesArray getPrice:localpriceStatesArray getpairentname:localpairentcatname  status:FALSE];

}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
	[self startParshing:webData];
    
       
	webData = nil;
	[connection release];
    [delegate stateListHere:localStatesArray getID:localidStatesArray getdesc:localdescrStatesArray  getprepTime:localpreptimeStatesArray getPrice:localpriceStatesArray  getpairentname:localpairentcatname status:TRUE];
    [localStatesArray release];
    
}


-(void)startParshing:(NSData *)myData{
    localStatesArray = [[NSMutableArray alloc] init];
    localdescrStatesArray = [[NSMutableArray alloc] init];
    localidStatesArray = [[NSMutableArray alloc] init];
    localpreptimeStatesArray = [[NSMutableArray alloc] init];
    localpriceStatesArray = [[NSMutableArray alloc] init];
    localpairentcatname = [[NSMutableArray alloc] init];
    
	NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
	NSXMLParser* parser = [[NSXMLParser alloc] initWithData:myData];
	[parser setDelegate:self];
	[parser setShouldProcessNamespaces:NO];
    [parser setShouldReportNamespacePrefixes:NO];
    [parser setShouldResolveExternalEntities:NO];
	[parser parse];
	[parser release];
	[pool release];
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
	currentData = @"";
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	currentData = [[currentData stringByAppendingString:string] mutableCopy];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
	if( [elementName caseInsensitiveCompare:@"NAME"] == NSOrderedSame)
		[localStatesArray addObject:currentData];
    
    else if([elementName caseInsensitiveCompare:@"ID"] == NSOrderedSame)
		[localidStatesArray addObject:currentData];
    
    else if([elementName caseInsensitiveCompare:@"PRICE"] == NSOrderedSame)
		[localpriceStatesArray addObject:currentData];
    
    else if([elementName caseInsensitiveCompare:@"DESCRIPTION"] == NSOrderedSame)
		[localdescrStatesArray addObject:currentData];
    
    else if([elementName caseInsensitiveCompare:@"order-time"] == NSOrderedSame)
		[localpreptimeStatesArray addObject:currentData];
    else if([elementName caseInsensitiveCompare:@"catname"] == NSOrderedSame)
    {
        
        if(localpairentcatname){
        [localpairentcatname removeAllObjects];
        }
        
        [localpairentcatname addObject:currentData];
    }

    stopdoublselection=FALSE;

}
// #######################################################################################  //

@end