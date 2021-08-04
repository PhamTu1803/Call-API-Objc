//
//  Animals.h
//  Rest-api-objective-c
//
//  Created by phamtu on 04/08/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Animals : NSObject

@property(nonatomic,copy) NSString *url;
@property(nonatomic,copy) NSString *webpurl;

-(id) initWithObject:(id)object;


@end

NS_ASSUME_NONNULL_END
