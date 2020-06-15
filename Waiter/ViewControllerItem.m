//
//  ViewControllerItem.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerItem.h"

@interface ViewControllerItem ()
@property (weak, nonatomic) IBOutlet UILabel *lblItemDescription;
@property (weak, nonatomic) IBOutlet UILabel *lblItemPrice;
@property (weak, nonatomic) IBOutlet UIImageView *imgItem;
@property (weak, nonatomic) IBOutlet UILabel *lblItemName;

@end

@implementation ViewControllerItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    dictionaryItemImage = @{
        @"Bruschetta": @"BruschettaImage.jpg",
            @"Spring Rolls":@"SpringRollsImage.jpeg",
        @"Gyoza":@"GyozaImage.jpg",
            @"Chicken Parmiagana":@"ChickenParmaImage.jpg",
            @"Steak":@"SteakImage.jpg",
        @"Spaghetti Bolognese": @"SpaghettiBologneseImage.jpg",
            @"Fish Curry":@"FishCurryImage.jpg",
        @"Cheesecake":@"CheesecakeImage.jpg",
            @"Ice-Cream":@"IcecreamImage.jpg",
            @"Tiramisu":@"TiramisuImage.jpeg",
        @"Soft Drinks": @"SoftDrinksImage.jpg",
            @"Juice":@"JuiceImage.jpeg",
        @"Beer":@"BeerImage.jpg",
            @"Wine":@"WineImage.jpeg"
    };
    
    dictionaryItemDescription = @{
        @"Bruschetta": @"Garlic Bread topped with Tomato, Red Onion and drizzled with Olive Oil",
            @"Spring Rolls":@"Mix of Pork and Prawn Spring Rolls",
        @"Gyoza":@"Japanese dumplings served with soy sauce",
            @"Chicken Parmiagana":@"Crumbed chicken breast fillet, topped with mozzarella cheese and napoli sauce",
            @"Steak":@"300gm Grass Fed Wagyu Steak with Mushroom Sauce",
        @"Spaghetti Bolognese": @"Home-made Spaghetti Pasta mixed in Red wine Beef bolognese Sauce and sprinkled with Parmesan Cheese",
            @"Fish Curry":@"Thai Fish Head Curry cooked in Coconut curry sauce",
        @"Cheesecake":@"New York style Cheesecake",
            @"Ice-Cream":@"Chocolate, Strawberry and Vanilla Ice Cream",
            @"Tiramisu":@"Tiramisu Dusted with Coffee powder",
        @"Soft Drinks": @"Coke, Sprite, Fanta, Coke Zero, Diet Coke",
            @"Juice":@"Orange, Apple, Watermelon or Mango Juice",
        @"Beer":@"Heineken, Stella Artois, Corona, VB",
            @"Wine":@"House Red or White Wine"
    };
    
    dictionaryItemPrice = @{
    @"Bruschetta": @"$10.00",
        @"Spring Rolls":@"$7.50",
    @"Gyoza":@"$7.50",
        @"Chicken Parmiagana":@"$19.95",
        @"Steak":@"$29.95",
    @"Spaghetti Bolognese": @"$19.95",
        @"Fish Curry":@"$17.95",
    @"Cheesecake":@"$9.95",
        @"Ice-Cream":@"$7.95",
        @"Tiramisu":@"$9.95",
    @"Soft Drinks": @"$3.50",
        @"Juice":@"$4.00",
    @"Beer":@"$8.50",
        @"Wine":@"$9.50"
    
    };
    
    _lblItemName.text = _receivedItemName;
    
    NSString *itemImage= dictionaryItemImage[_receivedItemName];
    _imgItem.image = [UIImage imageNamed:itemImage];
    
    _lblItemDescription.text = dictionaryItemDescription[_receivedItemName];
    
    _lblItemPrice.text = dictionaryItemPrice[_receivedItemName];
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
