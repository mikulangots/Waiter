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

@end

@implementation ViewControllerRestaurantSearch

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    arrListOfSectionHeaderTitles = @[@"A", @"B", @"C"];
    
    arrListOfRestaurants = @[
        @[@"Aroma", @"Ali Baba"],
        @[@"Barvarian"],
        @[@"Chicken House", @"China Bar"]
    ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [arrListOfSectionHeaderTitles count];
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrListOfRestaurants[section] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return arrListOfSectionHeaderTitles[section];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSString *simpleIdentifier = @"SimpleIdentifier";
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:simpleIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = arrListOfRestaurants[indexPath.section][indexPath.row];
    cell.detailTextLabel.text = @"Detail";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *itemClicked = arrListOfRestaurants[indexPath.section][indexPath.row];
    
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewControllerRestaurantDetails* myVC = [sb instantiateViewControllerWithIdentifier:@"ViewControllerRestaurantDetails"];
    myVC.receivedRestaurantName = itemClicked;
    
    //[self presentViewController:myVC animated:YES completion:nil];
    [self.navigationController pushViewController:myVC animated:YES];
    
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
