//
//  ViewControllerRestaurantSearch.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerRestaurantSearch.h"
#import "ViewControllerRestaurantDetails.h"

@interface ViewControllerRestaurantSearch ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewControllerRestaurantSearch

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //arrListOfSectionHeaderTitles = @[@"A", @"B", @"C"];
    
    arrListOfRestaurants = @[
        @[@"Aroma", @"Ali Baba"],
        @[@"Barvarian"],
        @[@"Chicken House", @"China Bar"]
    ];
    
    objNSDictionaryListOfRestaurants = [[NSMutableDictionary alloc] initWithCapacity:5];
    
    self.ref = [[FIRDatabase database]reference];
    
    [[_ref child:@"restaurants"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot){
        for (FIRDataSnapshot* child in snapshot.children){
            NSString *key = child.key;
            NSDictionary *restaurantDict = child.value;
            
            [self->objNSDictionaryListOfRestaurants setObject:restaurantDict forKey:key];
            
            [self.tableView reloadData];
        }
    }];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //return [arrListOfSectionHeaderTitles count];
    return 1;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [objNSDictionaryListOfRestaurants count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //return arrListOfSectionHeaderTitles[section];
    return @"List Of Restaurants";
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *simpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier forIndexPath:indexPath];
    
    //List restaurants from database
    NSString *restaurantNo = [objNSDictionaryListOfRestaurants allKeys][indexPath.row];
    NSMutableString *restaurantData =[[NSMutableString alloc] init];
    [restaurantData appendString:objNSDictionaryListOfRestaurants[restaurantNo][@"restaurantName"]];
    cell.textLabel.text = restaurantData;
    cell.detailTextLabel.text = @"Detail";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *cellText = cell.textLabel.text;
    //NSString *itemClicked = [indexPath.section][indexPath.row];
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerRestaurantDetails* myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerRestaurantDetails"];
    myVC.receivedRestaurantName = cellText;
    
    //[self presentViewController:myVC animated:YES completion:nil];
    [self.navigationController pushViewController:myVC animated:YES];
    
}

//Self design methods
-(void)loadRestaurantSearch{
    
}
/*
- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    <#code#>
}

- (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
    <#code#>
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
    <#code#>
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
    <#code#>
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
    <#code#>
}

- (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
    <#code#>
}

- (void)setNeedsFocusUpdate {
    <#code#>
}

- (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
    <#code#>
}

- (void)updateFocusIfNeeded {
    <#code#>
}
*/

@end
