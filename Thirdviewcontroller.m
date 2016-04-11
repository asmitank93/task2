//
//  Thirdviewcontroller.m
//  task2
//
//  Created by tops on 3/19/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import "Thirdviewcontroller.h"

@interface Thirdviewcontroller ()

@end

@implementation Thirdviewcontroller
@synthesize map_vw,lat,lng;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   map_vw.delegate=self;
    
    [self.view endEditing:YES];
    
    NSString *st_format=[NSString stringWithFormat:@"http://api.geonames.org/findNearbyPostalCodesJSON?lat=%@&lng=%@&username=progab",lat,lng];
    NSURL *url=[NSURL URLWithString:st_format];
    NSData *data=[NSData dataWithContentsOfURL:url];
    NSDictionary *dict=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    arr_3=[dict objectForKey:@"postalcodes"];
    NSLog(@"%@",dict);

    if (dict.allKeys.count>0)
    {
        float latitude=[[[dict objectForKey:@"postalCodes"]objectForKey:@"lat"]floatValue];
        float lngitude=[[[dict objectForKey:@"postalCodes"]objectForKey:@"lng"]floatValue];
        
        CLLocationCoordinate2D loc;
        loc.latitude=latitude;
        loc.longitude=lngitude;
        
        MKCoordinateRegion regin;
        regin.center=loc;
        regin.span.latitudeDelta=0.01;
        regin.span.longitudeDelta=0.01;
        
        
        
        [map_vw setRegion:regin animated:YES];
        [map_vw regionThatFits:regin];
    }

    
    
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
