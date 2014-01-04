//====================================================================================================
// Author: Peter Chen
// Created: 1/4/14
// Copyright 2014 Peter Chen
//====================================================================================================

#import "MyController.h"

@interface MyController() <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *textField;

@end

@implementation MyController

- (id)init {
   if ((self = [super init])) {
   }
   return self;
}

- (void)viewDidLoad {
   [super viewDidLoad];
   
   self.title = @"Custom Input View";
   self.view.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.1];
   
   self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 44)];
   self.textField.placeholder = @"Enter something";
   self.textField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
   self.textField.delegate = self;
   [self.view addSubview:self.textField];
   
   [self _setupTextFieldInputView];
}

- (void)_setupTextFieldInputView {
   UIView *inputView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
   inputView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.5];
   UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
   UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
   button1.frame = CGRectMake(10, 10, 100, 20);
   button2.frame = CGRectMake(10, 50, 100, 20);
   [button1 setTitle:@"Button 1" forState:UIControlStateNormal];
   [button2 setTitle:@"Button 2" forState:UIControlStateNormal];
   [inputView addSubview:button1];
   [inputView addSubview:button2];
   self.textField.inputView = inputView;
}

- (void)viewDidAppear:(BOOL)animated {
   [super viewDidAppear:animated];
   [self.textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   [textField resignFirstResponder];
   return NO;
}

//====================================================================================================
#pragma mark - Events
//====================================================================================================



@end
