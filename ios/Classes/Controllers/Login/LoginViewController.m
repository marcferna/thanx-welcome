//
//  LoginViewController.m
//  ThanxWelcome
//
//  Created by Marc Fernandez on 5/9/14.
//  Copyright (c) 2014 Thanx. All rights reserved.
//

#import "MainViewController.h"
#import <SSKeychain.h>

@interface LoginViewController ()
- (IBAction)onSubmitButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UIView *emailTextFieldContainer;
@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  self.emailTextFieldContainer.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:0.25];
  self.emailField.delegate = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark IBAction Methods
- (IBAction)onSubmitButtonClick:(id)sender {
  NSError *error;
  [SSKeychain setPassword:@"" forService:@"WelcomeService" account:self.emailField.text error:&error];
  NSLog(@"@%", error);
}

#pragma mark - UITextViewDelegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
  [textField resignFirstResponder];
  return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  [self.view endEditing:YES];
}

@end
