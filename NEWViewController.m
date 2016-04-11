//
//  NEWViewController.m
//  task2
//
//  Created by tops on 3/19/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import "NEWViewController.h"

@interface NEWViewController ()

@end

@implementation NEWViewController
@synthesize tbl_vw,postal,code;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arr_vw_2=[[NSMutableArray alloc]init];
    tbl_vw.dataSource=self;
    tbl_vw.delegate=self;
    
    NSString *st_format=[NSString stringWithFormat:@"http://api.geonames.org/postalCodeLookupJSON?postalcode=%@&country=%@&username=progab",postal,code];
    NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    arr_vw_2=[dict objectForKey:@"postalcodes"];
        NSLog(@"%@",arr_vw_2);
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr_vw_2.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tbl_vw dequeueReusableCellWithIdentifier:@"cell"];
    if( nil == cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [[arr_vw_2 objectAtIndex:indexPath.row]objectForKey:@"placeName"];
    
    return cell;
    
    
    /*UITableViewCell *cell=nil;
    cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.textLabel.text=[[arr_vw_2 objectAtIndex:indexPath.row]objectForKey:@"placeName"];
   
    
    return cell;*/
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Thirdviewcontroller *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"Thirdviewcontroller"];
    vc.lat=[[arr_vw_2 objectAtIndex:indexPath.row]objectForKey:@"latitude"];
    vc.lng=[[arr_vw_2 objectAtIndex:indexPath.row]objectForKey:@"longitude"];
    [self.navigationController pushViewController:vc animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
