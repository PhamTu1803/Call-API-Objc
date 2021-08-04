//
//  CatViewModel.h
//  Rest-api-objective-c
//
//  Created by phamtu on 04/08/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CatViewModel : NSObject

@property(nonatomic,strong) NSMutableArray *animalArr;
@property (copy) void (^reloadTable)(void);
-(void) fetchCouseUsingJSON ;
- (NSUInteger)numberOfInSection:(NSInteger)section;
- (NSString *)cellForRowAt:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
