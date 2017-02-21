//
//  ABServerManager.m
//  NewsProject
//
//  Created by Артем on 31.01.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "ABServerManager.h"
#import "AFNetworking.h"
#import "ABNews.h"

@interface ABServerManager ()
@property (strong, nonatomic) AFHTTPSessionManager* firstSessionManager;
@property (strong, nonatomic) AFHTTPSessionManager* secondSessionManager;

@end

@implementation ABServerManager

+ (ABServerManager*) sharedManager {
    
    static ABServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ABServerManager alloc] init];
    });
    
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        NSURL *URL = [NSURL URLWithString:@"http://news.mhth.ru"];
        
        self.firstSessionManager = [[AFHTTPSessionManager manager]initWithBaseURL:URL];
        self.firstSessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        self.firstSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        [self.firstSessionManager.requestSerializer setValue:@"tPK7s7vdmDxZf7Ar" forHTTPHeaderField:@"X-Token"];
        
         //setValue:[NSString stringWithFormat:@"Bearer %@", [[NSUserDefaults standardUserDefaults] objectForKey:@"tPK7s7vdmDxZf7Ar"]] forHTTPHeaderField:@"X-Token"];
        
    }
    return self;
}

-(void) getNewsWithOffset:(NSInteger) offset
                          count:(NSInteger) count
                      onSuccess:(void(^)(NSArray* articles)) success
                      onFailure:(void(^)(NSError* error, NSInteger statusCode)) failure{

    [self.firstSessionManager GET:@"/api/v1/news?page=1&limit=20" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray* dictsArray = [responseObject objectForKey:@"data"];
        
        NSMutableArray* objectsArray = [NSMutableArray array];
        
        for (NSDictionary* dict in dictsArray) {
            ABNews* article = [[ABNews alloc] initWithServerResponse:dict];
            [objectsArray addObject:article];
        }
        
        if (success) {
            success(objectsArray);
        }

        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

@end
