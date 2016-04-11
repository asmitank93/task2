//
//  NEWViewController.h
//  task2
//
//  Created by tops on 3/19/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Thirdviewcontroller.h"

@interface NEWViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arr_vw_2;
}

@property (weak, nonatomic) IBOutlet UITableView *tbl_vw;
@property(retain,nonatomic)NSString *postal;
@property(retain,nonatomic)NSString *code;


@end
