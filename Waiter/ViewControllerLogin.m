//
//  ViewControllerLogin.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerLogin.h"
#import "ViewControllerMap.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>


@interface ViewControllerLogin ()
@property (weak, nonatomic) IBOutlet UIButton *facebookBtn;

@end

@implementation ViewControllerLogin


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FBSDKLoginButton *facebookBtn = [[FBSDKLoginButton alloc] init];
    // Optional: Place the button in the center of your view.
    //loginButton.center = self.view.center;
    //[self.view addSubview:facebookBtn];
    
    //CUSTOM FACEBOOK LOGIN
    //UIButton *facebookBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    //[facebookBtn setTitle: @"My Login Button" forState: UIControlStateNormal];
    
    // Handle clicks on the button
    //[facebookBtn
     // addTarget:self
      //action:@selector(loginButtonClicked) //forControlEvents:UIControlEventTouchUpInside];
    
    // Add the button to the view
    //[self.view addSubview:facebookBtn];
    
    if ([FBSDKAccessToken currentAccessToken]) {
     //User is logged in, do work such as go to next view controller.
        
    }
    facebookBtn.permissions = @[@"public_profile", @"email"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// Once the button is clicked, show the login dialog
-(void)loginButtonClicked
{
  FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
  [login
    logInWithPermissions: @[@"public_profile"]
          fromViewController:self
                     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
    if (error) {
      NSLog(@"Process error");
    } else if (result.isCancelled) {
      NSLog(@"Cancelled");
    } else {
      NSLog(@"Logged in");
    }
  }];
}

- (IBAction)clickLogin:(id)sender {
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerMap"];
    myVC.selectedIndex = 3;
    [self presentViewController:myVC animated:YES completion:nil];
    
    [self.navigationController pushViewController:myVC animated:YES];
}


@end
