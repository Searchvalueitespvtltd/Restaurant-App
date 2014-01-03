//
//  IOS_SDKViewControllerDKAirCash.m
//  IOS_SDK
//
//  Created by u3237 on 13/06/07.
//
//

#import "IOS_SDKViewControllerDKAirCash.h"
#import "PrinterFunctions.h"
#import "MiniPrinterFunctions.h"
#import "DKAirCashFunctions.h"
#import <StarIO/SMPort.h>
#import <StarIO/SMBluetoothManager.h>

#import "AbstractActionSheetPicker.h"
#import "ActionSheetStringPicker.h"
#import "AppDelegate.h"
#import "CommonTableView.h"
#import "StandardHelp.h"
#import "BluetoothSettingViewController.h"

@implementation IOS_SDKViewControllerDKAirCash

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        functions = [[NSArray alloc] initWithObjects:@"Get Printer Status", @"Get Cash Drawer Status", @"Sample Receipt + Open Cash Drawer", @"Open Cash Drawer 1", @"Open Cash Drawer 2",
                                                     @"Bluetooth Pairing + Connect", @"Bluetooth Disconnect", @"DK-AirCash Bluetooth Setting", nil];
        ports = [[NSArray alloc] initWithObjects:@"Standard", @"9100", @"9101", @"9102", @"9103",
                                                 @"9104", @"9105", @"9106", @"9107", @"9108",
                                                 @"9109", nil];
        printerTypes = [[NSArray alloc] initWithObjects:@"POS Printer", @"Portable Printer", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _tableviewFunction.delegate = self;
    _tableviewFunction.dataSource = self;
    _uitextfield_drawerPortName.delegate = self;
    _uitextfield_printerPortName.delegate = self;
    
    selectedPort = 0;
    selectedPrinterType = 0;
    
    [portNumberButton setTitle:ports[selectedPort] forState:UIControlStateNormal];
    [printerTypeButton setTitle:printerTypes[selectedPrinterType] forState:UIControlStateNormal];
    
    self.uitextfield_printerPortName.text = @"TCP:192.168.1.10";
    self.uitextfield_drawerPortName.text = @"TCP:192.168.1.11";
    
    [AppDelegate setButtonArrayAsOldStyle:@[portNumberButton, printerTypeButton, searchButton, drawerSearchButton, backButton, helpButton]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_tableviewFunction release];
    [_uitextfield_printerPortName release];
    [_uitextfield_drawerPortName release];
    
    [functions release];
    [ports release];
    [printerTypes release];

    [portNumberButton release];
    [printerTypeButton release];
    [searchButton release];
    [drawerSearchButton release];
    [backButton release];
    [helpButton release];
    [super dealloc];
}

- (void)viewDidUnload {
    self.tableviewFunction = nil;
    self.uitextfield_drawerPortName = nil;
    self.uitextfield_drawerPortName = nil;
    [portNumberButton release];
    portNumberButton = nil;
    [printerTypeButton release];
    printerTypeButton = nil;
    [searchButton release];
    searchButton = nil;
    [drawerSearchButton release];
    drawerSearchButton = nil;
    [backButton release];
    backButton = nil;
    [helpButton release];
    helpButton = nil;
    [super viewDidUnload];
}

#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return functions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = functions[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16.5];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view bringSubviewToFront:blockView];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self setPortInfo];
    
    NSString *printerPortName = [AppDelegate getPortName];
    NSString *printerPortSettings = [AppDelegate getPortSettings];
    NSString *drawerPortName = [AppDelegate getDrawerPortName];
    
    switch (indexPath.row) {
        case 0: //Get Printer Status;
            if (selectedPort == 0) {
                [PrinterFunctions CheckStatusWithPortname:printerPortName
                                             portSettings:printerPortSettings
                                            sensorSetting:NoDrawer];
            }
            else {
                [MiniPrinterFunctions CheckStatusWithPortname:printerPortName
                                                 portSettings:printerPortSettings
                                                sensorSetting:NoDrawer];
            }
            break;
            
        case 1: //Get Cash Drawer Status
            [DKAirCashFunctions CheckStatusWithPortname:drawerPortName portSettings:@""];
            break;
            
        case 2: //Sample Receipt + Open Cash Drawer
        {
            UIActionSheet *actionSheet = nil;
            if (selectedPrinterType == 0) {
                actionSheet = [[UIActionSheet alloc] initWithTitle:@"Paper Width"
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"3 inch", @"4 inch", nil];
            }
            else {
                actionSheet = [[UIActionSheet alloc] initWithTitle:@"Paper Width"
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                            destructiveButtonTitle:nil
                                                 otherButtonTitles:@"2 inch", @"3 inch", @"4 inch", nil];
            }
            
            [actionSheet showInView:self.view];
            [actionSheet release];
        }
            break;
            
        case 3: //Open Cash Drawer 1
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please Input Password"
                                                            message:@" "
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
            
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            alert.tag = 102;
            [alert show];
            [alert release];

            break;
        }
            
        case 4: //Open Cash Drawer 2
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Please Input Password"
                                                            message:@" "
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                                  otherButtonTitles:@"OK", nil];
            
            alert.alertViewStyle = UIAlertViewStylePlainTextInput;
            alert.tag = 103;
            [alert show];
            [alert release];
            
            break;
        }
            
        case 5: //Bluetooth Pairing + Connect
            if (UIDevice.currentDevice.systemVersion.floatValue < 6.0) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                message:@"This function requires iOS6 or later."
                                                               delegate:nil
                                                      cancelButtonTitle:nil
                                                      otherButtonTitles:@"OK", nil];
                [alert show];
                break;
            }

            [EAAccessoryManager.sharedAccessoryManager showBluetoothAccessoryPickerWithNameFilter:nil completion:nil];
            break;

        case 6: //Bluetooth Disconnect
        {
            NSArray *devices = [[SMPort searchPrinter:@"BT:"] retain];
            
            NSMutableArray *supportedDevices = [NSMutableArray new];
            for (PortInfo *port in devices) {
                if ([port.modelName isEqualToString:@"SAC10"] ||        //DK-AirCash
                    [port.modelName isEqualToString:@"Star Micronics"]) { //POS Printer
                    [supportedDevices addObject:port];
                }
            }

            commonTableView = [[CommonTableView alloc] initWithNibName:@"CommonTableView"
                                                                bundle:[NSBundle mainBundle]
                                                               devices:supportedDevices
                                                              delegate:self
                                                                action:@selector(disconnect:)];
            
            [self presentModalViewController:commonTableView animated:YES];

            [supportedDevices release];
            [devices release];
            [commonTableView release];
        }
            break;
            
        case 7: //DK-AirCash Bluetooth Setting
        {
            SMBluetoothManager *manager = [[PrinterFunctions loadBluetoothSetting:drawerPortName portSettings:@""] retain];
            if (manager == nil) {
                break;
            }
            
            BluetoothSettingViewController *btSetting = [[BluetoothSettingViewController alloc] initWithNibName:@"BluetoothSettingViewController"
                                                                                                         bundle:[NSBundle mainBundle]
                                                                                               bluetoothManager:manager];
            [manager release];
            
            [self presentModalViewController:btSetting animated:YES];
            
            [btSetting release];
        }
            break;
    }
    
    [self.view sendSubviewToBack:blockView];
}

- (void)disconnect:(PortInfo *)portInfo {
    [self dismissModalViewControllerAnimated:YES];
    
    if (portInfo != nil) {
        [PrinterFunctions disconnectPort:portInfo.portName portSettings:@"" timeout:10000];
    }
}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSString *printerPortName = [AppDelegate getPortName];
    NSString *printerPortSettings = [AppDelegate getPortSettings];
    int selectedWidthIndex = buttonIndex;
    
    //
    // Sample Receipt
    //
    NSMutableString *errorMessage = [NSMutableString new];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    alert.tag = 102;
    
    if (selectedPrinterType == 0) { //POSPrinter
        if (selectedWidthIndex == 0) { //3inch
            [PrinterFunctions PrintSampleReceipt3InchWithoutDrawerKickWithPortname:printerPortName
                                                                      portSettings:printerPortSettings
                                                                      errorMessage:errorMessage];
        }
        else if (selectedWidthIndex == 1) { //4inch
            [PrinterFunctions PrintSampleReceipt4InchWithoutDrawerKickWithPortname:printerPortName
                                                                      portSettings:printerPortSettings
                                                                      errorMessage:errorMessage];
        }
        else {
            return;
        }
    }
    else { //Portable Printer
        if (selectedWidthIndex == 0) { //2inch
            [MiniPrinterFunctions PrintSampleReceiptWithPortname:printerPortName
                                                    portSettings:printerPortSettings
                                                       widthInch:2
                                                    errorMessage:errorMessage];
        }
        else if (selectedWidthIndex == 1) { //3inch
            [MiniPrinterFunctions PrintSampleReceiptWithPortname:printerPortName
                                                    portSettings:printerPortSettings
                                                       widthInch:3
                                                    errorMessage:errorMessage];
        }
        else if (selectedWidthIndex == 2) { //4inch
            [MiniPrinterFunctions PrintSampleReceiptWithPortname:printerPortName
                                                    portSettings:printerPortSettings
                                                       widthInch:4
                                                    errorMessage:errorMessage];
        }
        else {
            return;
        }
    }
    
    if (errorMessage.length > 0) {
        alert.message = errorMessage;
        [alert show];
        [alert release];
        [errorMessage release];
        return;
    }
    [errorMessage release];
    [alert release];
    
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.0]];
    
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Please Input Password"
                                                     message:@" "
                                                    delegate:self
                                           cancelButtonTitle:@"Cancel"
                                           otherButtonTitles:@"OK", nil];

    alert2.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert2.tag = 102;
    [alert2 show];
    [alert2 release];
    return;
}

#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //
    // Search Printer and DK-AirCash
    //
    if ((alertView.tag == 100) || (alertView.tag == 101)) {
        if (buttonIndex == 0) //Cancel
            return;
    
        NSArray *devices = nil;
        switch (buttonIndex) {
            case 1: //LAN
                devices = [[SMPort searchPrinter:@"TCP:"] retain];
                break;
                
            case 2: //Bluetooth
                devices = [[SMPort searchPrinter:@"BT:"] retain];
                break;
                
            case 3: //All
                devices = [[SMPort searchPrinter] retain];
                break;
        }
        
        if (alertView.tag == 100) { //Search Printer
            NSMutableArray *posPrinters = [NSMutableArray new];
            for (PortInfo *port in devices) {
                if ([port.modelName isEqualToString:@"SAC10"] == NO) {
                    [posPrinters addObject:port];
                }
            }
            searchView = [[SearchPrinterViewController alloc] initWithNibName:@"SearchPrinterViewController"
                                                                       bundle:nil
                                                                       target:self
                                                                       action:@selector(returnSelectedCellText)];
            searchView.foundPrinters = posPrinters;
        }
        else { //Search DK-AirCash
            NSMutableArray *dkAirCash = [NSMutableArray new];
            for (PortInfo *port in devices) {
                if ([port.modelName isEqualToString:@"SAC10"] == YES) {
                    [dkAirCash addObject:port];
                }
            }

            searchView = [[SearchPrinterViewController alloc] initWithNibName:@"SearchPrinterViewController"
                                                                       bundle:nil
                                                                       target:self
                                                                       action:@selector(returnSelectedCellText2)];
            searchView.foundPrinters = dkAirCash;
        }
        searchView.delegate = self;
        [self presentModalViewController:searchView animated:YES];
        [searchView release];
        [devices release];
        return;
    }
    
    //
    // Open DK-AirCash
    //  - Check Password
    //
    
    else if (alertView.tag == 102) {
        if (buttonIndex == 0) {
            return;
        }

        //Password Check
        NSString *password = [alertView textFieldAtIndex:0].text;
        [[alertView textFieldAtIndex:0] resignFirstResponder];

        if ([password isEqualToString:@"1234"] == NO) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"The password is incorrect. stop the process."
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            [alert release];
            return;
        }

        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:password forKey:@"CashDrawerPassword"];

        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.0]];
        
        NSString *drawerPortName = [AppDelegate getDrawerPortName];
        [DKAirCashFunctions OpenCashDrawerWithPortname:drawerPortName
                                          portSettings:@""
                                          drawerNumber:1];
        return;
    }
    
    //
    // Open DK-AirCash 2
    //  - Check password
    //
    else if (alertView.tag == 103) {
        if (buttonIndex == 0) {
            return;
        }
        
        //Password Check
        NSString *password = [alertView textFieldAtIndex:0].text;
        [[alertView textFieldAtIndex:0] resignFirstResponder];
        
        if ([password isEqualToString:@"1234"] == NO) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                            message:@"The password is incorrect. stop the process."
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"OK", nil];
            [alert show];
            [alert release];
            return;
        }
        
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.0]];
        
        NSString *drawerPortName = [AppDelegate getDrawerPortName];
        [DKAirCashFunctions OpenCashDrawerWithPortname:drawerPortName
                                          portSettings:@""
                                          drawerNumber:2];
        return;
    }
}

#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    return YES;
}

#pragma mark -

- (IBAction)back:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (IBAction)searchPrinter:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Interface"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"LAN", @"Bluetooth", @"All", nil];
    alert.tag = 100;
    [alert show];
}

- (IBAction)searchCashDrawer:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Select Interface"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"LAN", @"Bluetooth", @"All", nil];
    
    alert.tag = 101;
    [alert show];
}

- (IBAction)selectPort:(id)sender {
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue)
    {
        selectedPort = selectedIndex;
        
        [portNumberButton setTitle:selectedValue forState:UIControlStateNormal];
    };
    
    ActionStringCancelBlock cancel = ^(ActionSheetStringPicker *picker)
    {
    };
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Port"
                                            rows:ports
                                initialSelection:selectedPort
                                       doneBlock:done
                                     cancelBlock:cancel
                                          origin:sender];
}

- (IBAction)selectPrinterType:(id)sender {
    ActionStringDoneBlock done = ^(ActionSheetStringPicker *picker, NSInteger selectedIndex, id selectedValue)
    {
        selectedPrinterType = selectedIndex;
        
        [printerTypeButton setTitle:selectedValue forState:UIControlStateNormal];
    };
    
    ActionStringCancelBlock cancel = ^(ActionSheetStringPicker *picker)
    {
    };
    
    [ActionSheetStringPicker showPickerWithTitle:@"Select Printer Type"
                                            rows:printerTypes
                                initialSelection:selectedPrinterType
                                       doneBlock:done
                                     cancelBlock:cancel
                                          origin:sender];
}

- (IBAction)showHelp:(id)sender {
    NSString *title = @"PORT PARAMETERS";
    
    NSString *helpText = [AppDelegate HTMLCSS];
    helpText = [helpText stringByAppendingString:@"<body>\
                This program on supports ethernet and bluetooth interface.<br/>\
                <Code>TCP:192.168.222.244</Code><br/>\
                <It1>Enter IP address of Star Device</It1><br/><br/>\
                <Code>BT:Star Micronics</Code><br/>\
                <It1>Enter iOS Port Name of Star Device</It1><br/><br/>\
                <LargeTitle><center>Port Settings</center></LargeTitle>\
                <p>You should leave this blank for POS Printers or DK-AirCash. You should use 'mini' when connecting to a Portable Printers.</p>\
                </body><html>"];
    
    StandardHelp *helpVar = [[StandardHelp alloc]initWithNibName:@"StandardHelp" bundle:[NSBundle mainBundle]];
    [self presentModalViewController:helpVar animated:YES];
    [helpVar release];
    
    [helpVar setHelpTitle:title];
    [helpVar setHelpText:helpText];
}

- (void)returnSelectedCellText {
    NSString *selectedPortName = [searchView lastSelectedPortName];
    
    if ((selectedPortName != nil) && ([selectedPortName isEqualToString:@""] == NO))
    {
        self.uitextfield_printerPortName.text = selectedPortName;
    }
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:self.uitextfield_printerPortName.text forKey:@"PrinterPortName"];
 

    [self dismissModalViewControllerAnimated:YES];
}

- (void)returnSelectedCellText2 {
    NSString *selectedPortName = [searchView lastSelectedPortName];
    
    if ((selectedPortName != nil) && ([selectedPortName isEqualToString:@""] == NO))
    {
        self.uitextfield_drawerPortName.text = selectedPortName;
    }
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
   
    [prefs setObject:self.uitextfield_drawerPortName.text forKey:@"DrawerPortName"];
   

    [self dismissModalViewControllerAnimated:YES];
}

- (void)setPortInfo
{
    [AppDelegate setPortName:self.uitextfield_printerPortName.text];
    [AppDelegate setDrawerPortName:self.uitextfield_drawerPortName.text];
    
    if ([printerTypes[selectedPrinterType] isEqualToString:@"Portable Printer"]) {
        [AppDelegate setPortSettings:@"mini"];
    } else if ([ports[selectedPort] isEqualToString:@"Standard"] == NO) {
        [AppDelegate setPortSettings:ports[selectedPort]];
    } else {
        [AppDelegate setPortSettings:@""];
    }
    
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:self.uitextfield_printerPortName.text forKey:@"PrinterPortName"];
    [prefs setObject:self.uitextfield_drawerPortName.text forKey:@"DrawerPortName"];
    [prefs setObject:[AppDelegate getPortSettings ] forKey:@"PortSettings"];
    
    
}

@end
