//
//  LoginViewModel.h
//  CYMVVMDemo
//
//  Created by echo on 7/26/16.
//  Copyright © 2016 caratel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Account.h"
#import "ReactiveCocoa.h"

@interface LoginViewModel : NSObject

@property (nonatomic, strong) Account *account;

@property (nonatomic, strong, readonly) RACSignal *enableLoginSignal;

@property (nonatomic, strong, readonly) RACCommand *loginCommonand;
@end
