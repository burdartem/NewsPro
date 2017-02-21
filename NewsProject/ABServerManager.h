//
//  ABServerManager.h
//  NewsProject
//
//  Created by Артем on 31.01.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABServerManager : NSObject

+ (ABServerManager*) sharedManager;

-(void) getNewsWithOffset:(NSInteger) offset
                    count:(NSInteger) count
                onSuccess:(void(^)(NSArray* articles)) success
                onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure;
@end
