//
//  GetiRestaurantsCatiteams.m
//  iRestaurants Universal
//
//  Created by Dex on 03/01/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import "GetiRestaurantsCatiteams.h"

@implementation GetiRestaurantsCatiteams
@synthesize delegate;

-(void)callWebService{
    //	NSLog(@"callWebService fn caalled");
	NSString * soapMessage = [NSString stringWithFormat:
                              @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                              "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
                              "<soap:Body>"
                              "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php/\" />"
                              "</soap:Body>"
                              "</soap:Envelope>"];
	
    
  NSURL *  url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php"]];
    
NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
//    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://test.muthootfinance.com/wsMuthoot/wslocater.asmx?op=getCountryList"]];
	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
	[theRequest addValue: @"http://204.197.244.110/~crmdalto/restaurant/index.php" forHTTPHeaderField:@"SOAPAction"];
	[theRequest addValue: [NSString stringWithFormat:@"%d",[soapMessage length]] forHTTPHeaderField:@"Content-Length"];
	[theRequest setHTTPMethod:@"POST"];
	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
	
    
    NSLog(@"GetiRestaurantsCatiteams URL---%@",theRequest);
	[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
	webData = [[NSMutableData data] retain];
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
    [delegate countryListHere:nil getID:Nil  status:FALSE];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
	[self startParshing:webData];
    
    //	NSString * XmlDataHere= [[NSString alloc]initWithBytes:[webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    //	NSLog(@"1111111%@\n\n", XmlDataHere);
	
    //   NSLog(@"localCountriesArray = %@",localCountriesArray);
    
	webData = nil;
	[connection release];
    [delegate countryListHere:localCountriesArray  getID:localCountriesArray1  status:TRUE];
    [localCountriesArray release];
    
}


-(void)startParshing:(NSData *)myData{
    localCountriesArray = [[NSMutableArray alloc] init];
    localCountriesArray1 = [[NSMutableArray alloc] init];
    
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
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
		[localCountriesArray addObject:currentData];
    	else if( [elementName caseInsensitiveCompare:@"ID"] == NSOrderedSame)
    	[localCountriesArray1 addObject:currentData];
}
// #######################################################################################  //

@end