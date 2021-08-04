//
//  Animals.m
//  Rest-api-objective-c
//
//  Created by phamtu on 04/08/2021.
//

#import "Animals.h"

@implementation Animals

-(id) initWithObject:(id)object {
    if (self = [super init])
    {
        self.url = [object valueForKey:@"url"];
        self.webpurl = [object valueForKey:@"webpurl"];
    }
    
    return self;
}

@end
