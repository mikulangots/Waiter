//
//  ViewControllerMap.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerMap.h"

@interface ViewControllerMap ()

@end

@implementation ViewControllerMap

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

@end
