//
//  AppDelegate.h
//  Waiter
//
//  Created by aitadmin on 7/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseFirestore;
@import FirebaseUI;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property FIRFirestore *defaultFirestore;
@end

