//
//  ViewControllerRestaurantDetails.h
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerRestaurantDetails : UIViewController{
    NSDictionary *dictionaryRestaurantImage;
    NSDictionary *dictionaryRestaurantAddress;
    NSDictionary *dictionaryRestaurantHours;
}

@property NSString *receivedRestaurantName;
@property (strong, nonatomic) FIRDatabaseReference *ref;

@end

NS_ASSUME_NONNULL_END
