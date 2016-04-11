//
//  ViewController.h
//  task2
//
//  Created by tops on 3/19/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NEWViewController.h"
#import "Thirdviewcontroller.h"

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arr;
}

@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@property(retain,nonatomic)NSString *str_vw_1;

@end

