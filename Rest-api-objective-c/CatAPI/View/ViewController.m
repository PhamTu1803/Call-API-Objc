//
//  ViewController.m
//  Rest-api-objective-c
//
//  Created by phamtu on 03/08/2021.
//

#import "ViewController.h"
#import "AFNetworking.h"
#import "Animals.h"
#import "CatViewModel.h"
#import "CatTableViewCell.h"
#import <SDWebImage/SDWebImage.h>

@interface ViewController ()

@property(nonatomic, strong ) CatViewModel *viewModel;

@end

@implementation ViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    [self bindViewModel];
    
}
-(void)initTableView {
    UINib *nib = [UINib nibWithNibName:@"CatTableViewCell" bundle:nil];
    [self.catTableView registerNib:nib forCellReuseIdentifier:@"CatTableViewCell"];
    self.catTableView.delegate = self;
    self.catTableView.dataSource = self;
}
-(void)bindViewModel {
    self.viewModel = [[CatViewModel alloc] init];
    __weak ViewController *weakSelf = self;
    [weakSelf.viewModel fetchCouseUsingJSON];
    [weakSelf.catTableView reloadData];
    weakSelf.viewModel.reloadTable = ^{
        [weakSelf.catTableView reloadData];
        };
   
}
#pragma mark - UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel numberOfInSection:section];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CatTableViewCell *cell = (CatTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"CatTableViewCell" forIndexPath:indexPath];
    if (cell == nil){
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"CatTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    NSString *catstring = [self.viewModel cellForRowAt:indexPath] ;
    cell.imgcat.image = [UIImage imageNamed:[self.viewModel cellForRowAt:indexPath]];
    [cell.imgcat sd_setImageWithURL:[NSURL URLWithString:catstring]
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}


@end
