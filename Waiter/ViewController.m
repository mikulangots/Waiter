//
//  ViewController.m
//  Waiter
//
//  Created by aitadmin on 7/5/20.
//  Copyright © 2020 Michael Hallorina. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *logoutBtn;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;

@property (weak, nonatomic) IBOutlet UIButton *clearBtn;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initComponents];
    
}
- (IBAction)logoutBtnClicked:(id)sender {
}

-(void)initComponents{
    _updateBtn.layer.cornerRadius = 15;
    _clearBtn.layer.cornerRadius = 15;
    _saveBtn.layer.cornerRadius = 15;
}


@end
