//
//  RootViewController.m
//  ThanxWelcome
//
//  Created by Marc Fernandez on 7/17/14.
//  Copyright (c) 2014 Thanx. All rights reserved.
//

#import "RootViewController.h"

//
#import "LoginViewController.h"
#import "MainViewController.h"

// Libraries
#import <SSKeychain.h>

@implementation RootViewController

- (void)dealloc {
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  NSArray *accounts = [SSKeychain accountsForService:@"WelcomeService"];
  if(accounts.count == 0) {
    LoginViewController *loginView = [[LoginViewController alloc] init];
    [self addChildViewController:loginView];
    [self.view addSubview:loginView.view];
  } else {
    MainViewController *mainView = [[MainViewController alloc] init];
    [self addChildViewController:mainView];
    [self.view addSubview:mainView.view];
  }
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
