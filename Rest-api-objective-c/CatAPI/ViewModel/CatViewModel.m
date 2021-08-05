//
//  CatViewModel.m
//  Rest-api-objective-c
//
//  Created by phamtu on 04/08/2021.
//

#import "CatViewModel.h"
#import "AFNetworking.h"
#import "Animals.h"

@implementation CatViewModel

-(id) init {
    self = [super init];
    if (self) {
        self.animalArr = [[NSMutableArray alloc] init];
    }
    return(self);
}
-(void) fetchCouseUsingJSON {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://thatcopy.pw/catapi/rest/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        __weak CatViewModel *weakSelf = self;
        Animals *animal = [[Animals alloc] initWithObject:responseObject];
        [weakSelf.animalArr addObject:animal];
        weakSelf.reloadTable();
        NSLog(@"JSON: %@", self.animalArr);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
#pragma mark - DataSource
- (NSUInteger)numberOfInSection:(NSInteger)section{
    return self.animalArr.count;
}

- (NSString *)cellForRowAt:(NSIndexPath *)indexPath{
    Animals *animal = [self animalAtIndexPath:indexPath];
    return animal.url;
    
}

- (Animals *)animalAtIndexPath:(NSIndexPath *)indexPath{
    
        if (indexPath.row == self.animalArr.count - 1){
            [self fetchCouseUsingJSON];
//            self.reloadTable();
        }
    return self.animalArr[indexPath.row];
}

@end
