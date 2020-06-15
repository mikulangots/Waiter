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

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ViewControllerLogin


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [self initComponents];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//After you present the authentication view and the user signs in, the result is returned to the FirebaseUI Auth delegate in the didSignInWithUser:error: method:
- (void)authUI:(FUIAuth *)authUI
didSignInWithUser:(nullable FIRUser *)user
            error:(nullable NSError *)error {
  // Implement this method to handle signed in user or error if any.
    if (user==nil){
        NSLog(@"Login Unsuccessful ---------------------");
    }else{
        NSLog(@"Login Successful ---------------------");
    }
}

//If you enabled Google or Facebook sign-in, implement a handler for the result of the Google and Facebook sign-up flows:
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
  NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
  return [[FUIAuth defaultAuthUI] handleOpenURL:url sourceApplication:sourceApplication];
}


//User defined methods
-(void)initComponents{
    _loginBtn.layer.cornerRadius = 15;
}

- (IBAction)clickLogin:(id)sender {
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerMap"];
    myVC.selectedIndex = 3;
    [self presentViewController:myVC animated:YES completion:nil];
    
    [self.navigationController pushViewController:myVC animated:YES];
}
- (IBAction)loginBtnClicked:(id)sender {
    FUIAuth *authUI = [FUIAuth defaultAuthUI];
    // You need to adopt a FUIAuthDelegate protocol to receive callback
    authUI.delegate = self;
    
    NSArray<id<FUIAuthProvider>> *providers = @[
        [[FUIEmailAuth alloc] init],
      [[FUIGoogleAuth alloc] init],
      [[FUIFacebookAuth alloc] init]
    ];
    authUI.providers = providers;
    
    UINavigationController *authViewController = [authUI authViewController];
    [self presentViewController:authViewController animated:YES completion:nil];
}


@end
