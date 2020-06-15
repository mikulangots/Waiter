//
//  ViewControllerRestaurantDetails.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerRestaurantDetails.h"
#import "ViewControllerQRScanner.h"

@interface ViewControllerRestaurantDetails ()
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantName;
@property (weak, nonatomic) IBOutlet UIImageView *imgViewRestaurantImage;
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblRestaurantHours;

@end

@implementation ViewControllerRestaurantDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.ref = [[FIRDatabase database] reference];
    
    dictionaryRestaurantImage = @{
        @"Aroma": @"FoodImage1.jpg",
            @"Ali Baba":@"FoodImage2.jpg",
        @"Barvarian":@"FoodImage1.jpg",
            @"Chicken House":@"FoodImage2.jpg",
            @"China Bar":@"FoodImage1.jpg"
    };
    
    dictionaryRestaurantHours = @{
        @"Aroma": @"Mon-Fri 10:00-21:00 Saturday 10:00-23:00 Sunday 12:00-21:00",
            @"Ali Baba":@"Mon-Fri 12:00-00:00 Saturday 12:00-02:00 Sunday 12:00-22:00",
        @"Barvarian":@"Mon-Fri 10:00-21:00 Saturday 10:00-23:00 Sunday 12:00-21:00",
            @"Chicken House":@"Mon-Fri 10:00-21:00 Saturday 10:00-23:00 Sunday 12:00-21:00",
            @"China Bar":@"Mon-Fri 10:00-21:00 Saturday 10:00-23:00 Sunday 12:00-21:00"
    };
    
    dictionaryRestaurantAddress = @{
        @"Aroma": @"120 Spencer St Melbourne VIC 3000",
            @"Ali Baba":@"555 Collins St Melbourne VIC 3000",
        @"Barvarian":@"24 Essex St Footscray 3011",
            @"Chicken House":@"257 Ballarat Rd Sunshine VIC 3020",
            @"China Bar":@"89 Swanston St Melbourne VIC 3000"
    };
    
    _lblRestaurantName.text = _receivedRestaurantName;
    
    NSString *restaurantImage = dictionaryRestaurantImage[_receivedRestaurantName];
    _imgViewRestaurantImage.image = [UIImage imageNamed:restaurantImage];
    
    _lblRestaurantAddress.text = dictionaryRestaurantAddress[_receivedRestaurantName];
    
    _lblRestaurantHours.text = dictionaryRestaurantHours[_receivedRestaurantName];
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
- (IBAction)clickBookTable:(id)sender {
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerQRScanner* myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerQRScanner"];
    //myVC._passedRestaurantName = _lblRestaurantName.text;
    
    //[self presentViewController:myVC animated:YES completion:nil];
    [self.navigationController pushViewController:myVC animated:YES];
}

@end
