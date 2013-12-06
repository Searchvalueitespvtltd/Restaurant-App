//
//  iRestaurantsNewOrderViewController.m
//  iRestaurants Universal
//
//  Created by Dex on 20/02/13.
//  Copyright (c) 2013 Dex Consulting. All rights reserved.
//

#import "iRestaurantsNewOrderViewController.h"
 BOOL Is_Cashier;
NSString * waitername;
NSString * currentwaitername;
NSString * tablenoglob;
BOOL IShidden;
@interface iRestaurantsNewOrderViewController ()

@end

@implementation iRestaurantsNewOrderViewController

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
    
    IShidden=TRUE;
    iRestaurantsHomeViewController * irestaurantsNewOrderViewController=[[iRestaurantsHomeViewController alloc]init];
    [self.navigationController pushViewController:irestaurantsNewOrderViewController animated:NO];
    [irestaurantsNewOrderViewController release];

    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
