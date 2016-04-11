//
//  ViewController.m
//  task2
//
//  Created by tops on 3/19/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize tbl_vw,str_vw_1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr=[[NSMutableArray alloc]init];
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
    
    NSURL *url=[NSURL URLWithString:@"http://api.geonames.org/postalCodeCountryInfoJSON?username=progab"];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    arr=[dict objectForKey:@"geonames"];
    NSLog(@"%@",arr);
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",str_vw_1);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr objectAtIndex:indexPath.row]objectForKey:@"countryName"];
    cell.detailTextLabel.text=[[arr objectAtIndex:indexPath.row]objectForKey:@"minPostalCode"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NEWViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"NEWViewController"];
    vc.postal=[[arr objectAtIndex:indexPath.row]objectForKey:@"postalcode"];
    vc.code=[[arr objectAtIndex:indexPath.row]objectForKey:@"countryCode"];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
