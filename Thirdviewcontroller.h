//
//  Thirdviewcontroller.h
//  task2
//
//  Created by tops on 3/19/16.
//  Copyright (c) 2016 viewc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Thirdviewcontroller : UIViewController<MKMapViewDelegate>
{
    NSMutableArray *arr_3;
}
@property (weak, nonatomic) IBOutlet MKMapView *map_vw;
@property(retain,nonatomic)NSString *lat;
@property(retain,nonatomic)NSString *lng;

@end
