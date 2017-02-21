//
//  ABNews.h
//  NewsProject
//
//  Created by Артем on 01.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABNews : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* date;
@property (strong, nonatomic) NSURL* imageURL;
@property (strong, nonatomic) NSString* articleID;
@property (strong, nonatomic) NSString* descriptionNews;
@property (strong, nonatomic) NSURL* bigImageUrl;
@property (strong, nonatomic) NSString* urlString;

- (id) initWithServerResponse:(NSDictionary*) responseObject;
@end
