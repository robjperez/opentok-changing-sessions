//
//  OTLogger.m
//  testmovingsessions
//
//  Created by Roberto Perez Cubero on 09/05/16.
//  Copyright © 2016 tokbox. All rights reserved.
//

#import "OTLogger.h"

@interface OpenTokObjC : NSObject
+ (void)setLogBlockQueue:(dispatch_queue_t)queue;
+ (void)setLogBlock:(void (^)(NSString* message, void* arg))logBlock;
@end

static dispatch_queue_t logQueue;

@implementation OTLogger
+ (void)initialize {
    logQueue = dispatch_queue_create("log-queue", DISPATCH_QUEUE_SERIAL);
}

- (id)init {
    self = [super init];
    if (self) {
        [OpenTokObjC setLogBlockQueue:logQueue];
        [OpenTokObjC setLogBlock:^(NSString* message, void* arg) {
            //NSLog(@"%@", message);
        }];
    }
    return self;
}

@end
