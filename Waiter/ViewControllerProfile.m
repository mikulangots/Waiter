//
//  ViewControllerProfile.m
//  Waiter
//
//  Created by aitadmin on 16/6/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerProfile.h"
#import "AppDelegate.h"

@import FirebaseAuth;

@interface ViewControllerProfile ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *emailTxt;
@property (weak, nonatomic) IBOutlet UITextField *userPhoneTxt;

@end

@implementation ViewControllerProfile


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initComponent];
    [self loadUserData];

}
-(void)viewWillAppear:(BOOL)animated{
    
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
- (IBAction)logoutBtnClicked:(id)sender {
    NSError *signOutError;
    BOOL status = [[FIRAuth auth] signOut:&signOutError];
    if (!status){
        NSLog(@"Error signing out: %@", signOutError);
        return;
    }else{
        NSLog(@"[FIRAuth auth] Signout Successful ------------");
        [self dismissViewControllerAnimated:TRUE completion:nil];
        
    }
   
}
- (IBAction)saveBtnClicked:(id)sender {
    [self saveUserData];
}


//USER DEFINED METHODS
-(void)loadUserData{
    NSString* uid = [[[FIRAuth auth]currentUser]uid];
    
    FIRDocumentReference *docRef =
    [[self.defaultFirestore collectionWithPath:@"users"] documentWithPath:uid];
    [docRef getDocumentWithCompletion:^(FIRDocumentSnapshot *snapshot, NSError *error) {
      if (snapshot.exists) {
        // Document data may be nil if the document exists but has no keys or values.
        NSLog(@"Document data: %@", snapshot.data);
          self->_emailTxt.text = snapshot.data[@"email"];
          self->_firstNameTxt.text = snapshot.data[@"firstName"];
          self->_lastNameTxt.text = snapshot.data[@"lastName"];
          self->_userPhoneTxt.text = snapshot.data[@"userPhone"];
      } else {
        NSLog(@"Document does not exist");
      }
    }];
      
    
}

-(void)initComponent{
    _emailTxt.enabled = false;
    AppDelegate* objAppDelegate = (AppDelegate*) UIApplication.sharedApplication.delegate;
    
    self.defaultFirestore = objAppDelegate.defaultFirestore;
}

-(void) clearScreen{
    _firstNameTxt.text = nil;
    _lastNameTxt.text = nil;
    _userPhoneTxt.text = nil;
}

-(void)saveUserData{
    
    FIRUser *user = [[FIRAuth auth]currentUser];
    
    [[[self.defaultFirestore collectionWithPath:@"users"]documentWithPath:user.uid] setData:@{
        @"firstName":[_firstNameTxt text],
        @"lastName":[_lastNameTxt text],
        @"userPhone":[_userPhoneTxt text],
    }merge: YES
        completion:^(NSError *_Nullable error){
        if(error !=nil){
            NSLog(@"Error writing document: %@", error );
        }else{
            NSLog(@"Document successfully written!" );
        }
    }];
}
@end
