//
//  ViewControllerMenu.h
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseUI;
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerMenu : UIViewController <UITableViewDataSource, UITableViewDataSource, UITableViewDelegate>{
    
    NSArray *arrListOfSectionHeaderTitles;
    NSArray *arrListOfFood;
}
@property FIRFirestore *defaultFirestore;
@property FIRAuthStateDidChangeListenerHandle handle;
@end

NS_ASSUME_NONNULL_END
