//
//  ABNews.m
//  NewsProject
//
//  Created by Артем on 01.02.17.
//  Copyright © 2017 Артем. All rights reserved.
//

#import "ABNews.h"

@implementation ABNews

- (id) initWithServerResponse:(NSDictionary*) responseObject
{
    self = [super init];
    if (self) {
        
        self.title = [responseObject objectForKey:@"title"];
        self.date = [responseObject objectForKey:@"created_at"];
        self.articleID = [responseObject objectForKey:@"id"];
        self.descriptionNews = [responseObject objectForKey:@"description"];
        NSString* urlString = [responseObject objectForKey:@"thumbnail"];
        self.urlString = [responseObject objectForKey:@"image"];
        if (urlString) {
            self.imageURL = [NSURL URLWithString:urlString];
        }
        
        NSString* bigUrlString = [responseObject objectForKey:@"image"];
        if (bigUrlString) {
            self.bigImageUrl = [NSURL URLWithString:bigUrlString];
        }
    }
    return self;
}

@end
