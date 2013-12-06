//
//  GetiRestaurantsAllorder.m
//  iRestaurants Universal
//
//  Created by Dex on 09/01/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import "GetiRestaurantsAllorder.h"

@implementation GetiRestaurantsAllorder

@end

//-(void)callWebService1{
//    temptblno= @"18";
//    
//	[indicator startAnimating];
//    soapMessage = [NSString stringWithFormat:
//                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
//                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">"
//                   "<soap:Body>"
//                   "<MediaMenu xmlns=\"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%@/\"/>"
//                   "</soap:Body>"
//                   "</soap:Envelope>",stringval,temptblno];
//    
//    
//    
//    
//    url = [NSURL URLWithString:[NSString stringWithFormat:@"http://204.197.244.110/~crmdalto/restaurant/index.php?order=%@;&table=%@",stringval,temptblno]];
//    
//  	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
//	NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
//	
//	[theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
//	[theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];//Count MSG Length
//	[theRequest setHTTPMethod:@"POST"]; //Method
//	[theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]]; //encoding sopmsg
//	
//	NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];//create connection
//	
//	NSLog(@"con Soap MSG %@",soapMessage);
//	
//	if( theConnection )	{
//		webData = [[NSMutableData data] retain];}
//	else	{
//		NSLog(@"theConnection is NULL");}
//	
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
//{
//	[webData setLength:0];  //when connection resieve data than set length 0 mean reset
//}
//
//-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
//{
//	
//	[webData appendData:data]; //when connection start than  append data to webdata
//}
//
//
//-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error //when connection fail
//{
//    [indicator stopAnimating];
//	NSLog(@"ERROR with the Conenction");
//	[connection release]; //relese because connection destroy
//	[webData release];    // because containing data may be damage
//	
//	UIAlertView *message = [[UIAlertView alloc]  //display aleart msg
//							initWithTitle:@""
//							message:@"Could not make connection"
//							delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//	
//	[message show]; //msg show
//	[message release];//msg release
//	
//}
//
//
//
//- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
//{
//	if ([elementName isEqualToString:@"order_id"]) {
//		soapResults = [[NSMutableString alloc]init];
//	}
//    
//    
//    NSLog(@"ORDER Conformation :--- %@",val1);
//}
//
//- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
//	
//	[soapResults appendString:string];
//	
//}
//
//
//-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
//	if ([elementName isEqualToString:@"order_id"]) {
//		
//        [val1 addObject:soapResults];
//        //userloginstatus=[NSString stringWithFormat:@"%@",soapResults];
//        [soapResults release];
//		//soapResults = nil;
//    }
//    else if ([elementName isEqualToString:@"status"]) {
//		
//        [val2 addObject:soapResults];
//        //userloginstatus=[NSString stringWithFormat:@"%@",soapResults];
//        [soapResults release];
//		//soapResults = nil;
//    }
//    
//    
//    
//    
//}
//
//
//
//
//-(void)connectionDidFinishLoading:(NSURLConnection *)connection //when connection done to recieve data
//{
//	[indicator stopAnimating];
//	NSLog(@"DONE. Received Bytes: %d", [webData length]);
//	
//	//incoding data
//	NSString *theXML = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
//	NSLog(@"the xml %@", theXML);
//	[theXML release];
//	
//	if(xmlParser) //if xml parser contain previous values than release it
//	{
//		[xmlParser release];
//		xmlParser = NULL;
//	}
//	xmlParser = [[NSXMLParser alloc] initWithData: webData]; //assign incoding webdata in to xmlparser
//	[xmlParser setDelegate: self];
//	[xmlParser setShouldResolveExternalEntities: YES];
//	[xmlParser parse];
//    //  [tblView reloadData];
//    
//}
//
