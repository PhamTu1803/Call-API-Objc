//
//  ViewController.h
//  Rest-api-objective-c
//
//  Created by phamtu on 03/08/2021.
//

#import <UIKit/UIKit.h>
#import "CatViewModel.h"

@interface ViewController : UIViewController <UITableViewDelegate , UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *catTableView;

@end

