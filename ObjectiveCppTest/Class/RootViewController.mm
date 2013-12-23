//
// Created by 森 秀樹 on 2013/12/23.
// Copyright (c) 2013 nasust. All rights reserved.
//



#import "RootViewController.h"
#import "UIScreen+Current.h"
#import "TestClass.h"
#import "ObjectInCppClass.h"


@interface RootViewController ()
@property(nonatomic, strong) UIButton *constructorButton;
@property(nonatomic, strong) UIButton *blockCaptureButton;
@property(nonatomic, strong) UIButton *objectInCppButton;
@property(nonatomic, strong) UIButton *objectInCppBlockButton;
@end

@implementation RootViewController {

}

- (void)loadView {
    [super loadView];
    self.constructorButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.constructorButton setTitle:@"Constructor" forState:UIControlStateNormal];

    self.blockCaptureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.blockCaptureButton setTitle:@"BlockCapture" forState:UIControlStateNormal];

    self.objectInCppButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.objectInCppButton setTitle:@"ObjectInCpp" forState:UIControlStateNormal];

    self.objectInCppBlockButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.objectInCppBlockButton setTitle:@"ObjectInCppBlock" forState:UIControlStateNormal];


    [self.view addSubview:self.constructorButton];
    [self.view addSubview:self.blockCaptureButton];
    [self.view addSubview:self.objectInCppButton];
    [self.view addSubview:self.objectInCppBlockButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.constructorButton addEventHandler:^(id sender) {
        TestClass testClass("Scope");
    }                      forControlEvents:UIControlEventTouchUpInside];


    TestClass testClass("BlockCapture");
    [self.blockCaptureButton addEventHandler:^(id sender) {
        testClass.hello();
    }                       forControlEvents:UIControlEventTouchUpInside];


    [self.objectInCppButton addEventHandler:^(id sender) {
        ObjectInCppClass *objectInCppClass = [ObjectInCppClass alloc].init;
    }                      forControlEvents:UIControlEventTouchUpInside];


    ObjectInCppClass *objectInCppBlockClass = [[ObjectInCppClass alloc] initWithName:@"ObjectInCppBlock"];
    [self.objectInCppBlockButton addEventHandler:^(id sender) {
        [objectInCppBlockClass hello];
    }                           forControlEvents:UIControlEventTouchUpInside];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];

    self.constructorButton.width = [UIScreen currentWidth];
    self.constructorButton.height = 44;
    self.constructorButton.x = 0;
    self.constructorButton.y = 20;

    self.blockCaptureButton.width = [UIScreen currentWidth];
    self.blockCaptureButton.height = 44;
    self.blockCaptureButton.x = 0;
    self.blockCaptureButton.y = self.constructorButton.bottom;

    self.objectInCppButton.width = [UIScreen currentWidth];
    self.objectInCppButton.height = 44;
    self.objectInCppButton.x = 0;
    self.objectInCppButton.y = self.blockCaptureButton.bottom;

    self.objectInCppBlockButton.width = [UIScreen currentWidth];
    self.objectInCppBlockButton.height = 44;
    self.objectInCppBlockButton.x = 0;
    self.objectInCppBlockButton.y = self.objectInCppButton.bottom;
}

@end