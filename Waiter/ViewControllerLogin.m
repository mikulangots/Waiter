//
//  ViewControllerLogin.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerLogin.h"
#import "ViewControllerMap.h"
#import "ViewControllerRestaurantSearch.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"


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
    
    self.handle = [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth *_Nonnull auth, FIRUser *_Nullable user){
        NSLog(@"login status changed---------------");
        if (user==nil){
            NSLog(@"In addAuthStateDidChangeListener. user == nil is TRUE");
            NSLog(@"The user is not signed in, the user has signed out");
            [self dismissViewControllerAnimated:TRUE completion:nil];
        }else{
            NSLog(@"In addAuthStateDidChangeListener. user == nil is False");
            NSLog(@"The user is signed in, the user has signed in");
        }
        //...
    }];
}

-(void)viewWillDisappear:(BOOL)animated{
    [[FIRAuth auth] removeAuthStateDidChangeListener:_handle];
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
        [self showMainVC];
        
    }
}

//If you enabled Google or Facebook sign-in, implement a handler for the result of the Google and Facebook sign-up flows:
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary *)options {
  NSString *sourceApplication = options[UIApplicationOpenURLOptionsSourceApplicationKey];
  return [[FUIAuth defaultAuthUI] handleOpenURL:url sourceApplication:sourceApplication];
}

-(void)authUI:(FUIAuth *)authUI didSignInWithAuthDataResult:( FIRAuthDataResult *)authDataResult error:( NSError *)error{
    if (authDataResult.additionalUserInfo.isNewUser){
        NSLog(@"brand new user -----------");
        
        //add a new document in collection "users"
        [self saveNewUserProfileData:authDataResult.user];
    }else{
        NSLog(@"existing user --------------");
    }
}
//User defined methods
-(void)initComponents{
    _loginBtn.layer.cornerRadius = 15;
    AppDelegate* objAppDelegate = (AppDelegate*) UIApplication.sharedApplication.delegate;
    
    self.defaultFirestore = objAppDelegate.defaultFirestore;
}

-(void) saveNewUserProfileData:(FIRUser*)user{
    //Add a new document in collection "users"
    [[[self.defaultFirestore collectionWithPath:@"users"]documentWithPath:user.uid] setData:@{
        @"email":user.email,
        @"firstName":@"First Name",
        @"lastName":@"Last Name",
        @"userPhone":@"Phone Number",
    }completion:^(NSError *_Nullable error){
        if(error !=nil){
            NSLog(@"Error writing document: %@", error );
        }else{
            NSLog(@"Document successfully written!" );
        }
    }];
    
}

- (IBAction)loginBtnClicked:(id)sender {
    if ([[[FIRAuth auth] currentUser]uid]!=nil){
        //User is already logged in
        [self showMainVC];
    }else{
            [self showLoginVC];
    }
    
}

-(void)showLoginVC{
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

-(void)showMainVC{
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UITabBarController *myVC = [sb instantiateViewControllerWithIdentifier:@"UITabBarController"];
    myVC.selectedIndex = 0;
    [self presentViewController:myVC animated:YES completion:nil];
    
    [self.navigationController pushViewController:myVC animated:YES];
}

@end
