//
// Created by 森 秀樹 on 2013/12/23.
// Copyright (c) 2013 nasust. All rights reserved.
//

#include <memory>
#import "ObjectInCppClass.h"
#import "TestClass.h"

using namespace std;


@interface ObjectInCppClass ()
@end

@implementation ObjectInCppClass {
    shared_ptr<TestClass> hoge;
}

- (id)init {
    self = [super init];
    if (self) {
        hoge.reset(new TestClass("ObjectInCpp"));
    }
    return self;
}

- (id)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        hoge.reset(new TestClass([name cStringUsingEncoding:NSUTF8StringEncoding]));
    }
    return self;
}

- (void)hello {
    hoge->hello();
}


@end