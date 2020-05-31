//
//  ViewControllerQRScanner.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerQRScanner.h"
#import "ViewControllerMenu.h"

@interface ViewControllerQRScanner ()
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantName;

@end

@implementation ViewControllerQRScanner

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)clickScanBarcode:(id)sender {
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerMenu* myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerMenu"];
    //myVC.receivedRestaurantName = itemClicked;
    
    //[self presentViewController:myVC animated:YES completion:nil];
    [self.navigationController pushViewController:myVC animated:YES];
}

@end
