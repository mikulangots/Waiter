//
//  ViewControllerProfile.h
//  Waiter
//
//  Created by aitadmin on 16/6/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewController.h"
@import Firebase;
@import FirebaseUI;
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerProfile : ViewController
@property FIRFirestore *defaultFirestore;
@property FIRAuthStateDidChangeListenerHandle handle;
@end

NS_ASSUME_NONNULL_END
