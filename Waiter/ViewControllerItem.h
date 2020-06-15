//
//  ViewControllerItem.h
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseUI;
NS_ASSUME_NONNULL_BEGIN

@interface ViewControllerItem : UIViewController{
    NSDictionary *dictionaryItemImage;
    NSDictionary *dictionaryItemDescription;
    NSDictionary *dictionaryItemPrice;
}

@property NSString *receivedItemName;
@property FIRFirestore *defaultFirestore;
@property FIRAuthStateDidChangeListenerHandle handle;
@end

NS_ASSUME_NONNULL_END
