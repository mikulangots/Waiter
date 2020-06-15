//
//  ViewControllerMenu.m
//  Waiter
//
//  Created by aitadmin on 31/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewControllerMenu.h"
#import "ViewControllerItem.h"

@interface ViewControllerMenu ()

@end

@implementation ViewControllerMenu

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrListOfSectionHeaderTitles = @[@"Entree", @"Main", @"Dessert", @"Drinks"];
    
    arrListOfFood = @[
        @[@"Bruschetta", @"Spring Rolls", @"Gyoza"],
        @[@"Chicken Parmiagana", @"Steak", @"Spaghetti Bolognese", @"Fish Curry"],
        @[@"Cheesecake", @"Ice-Cream", @"Tiramisu"],
        @[@"Soft Drinks", @"Juice", @"Beer", @"Wine"]
    ];
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
    return [arrListOfSectionHeaderTitles count];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrListOfFood[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return arrListOfSectionHeaderTitles[section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *simpleIdentifier = @"SimpleIdentifier1";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = arrListOfFood[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = @"Detail";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *itemClicked = arrListOfFood[indexPath.section][indexPath.row];
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerItem* myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerItem"];
    
    myVC.receivedItemName = itemClicked;
    
    //[self presentViewController:myVC animated:YES completion:nil];
    [self.navigationController pushViewController:myVC animated:YES];
    
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
