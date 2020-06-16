//
//  ViewControllerRestaurantSearch.h
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseUI;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerRestaurantSearch : UIViewController <UITableViewDataSource, UITableViewDataSource, UITableViewDelegate>{
    NSArray *arrListOfSectionHeaderTitles;
    NSArray *arrListOfRestaurants;
    NSMutableDictionary *objNSDictionaryListOfRestaurants;
}
@property FIRFirestore *defaultFirestore;
@property FIRAuthStateDidChangeListenerHandle handle;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@end

NS_ASSUME_NONNULL_END
