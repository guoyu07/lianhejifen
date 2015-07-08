//
//  MapViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/8.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "MapViewController.h"
@interface MapViewController ()<MAMapViewDelegate>
{
    MAMapView *_map;
}
@end

@implementation MapViewController

-(void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    // Do any additional setup after loading the view, typically from a nib.
    //配置用户Key
    [MAMapServices sharedServices].apiKey = @"56a4bcc2f6808b10cbaf67132c6aed4d";
    
    _map = [[MAMapView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds))];
    _map.delegate = self;
    
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
        pointAnnotation.title = @"方恒国际";
        pointAnnotation.subtitle = @"阜通东大街6号";
    
    [_map setCenterCoordinate:pointAnnotation.coordinate animated:YES];
        [_map addAnnotation:pointAnnotation];
       [self.view addSubview:_map];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(40.035139,116.311655);
    //    CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(40.037367,116.370463);

    
    //    for (NSInteger i=0; i<20; i++) {
    //        CLLocationCoordinate2D coordinate1=CLLocationCoordinate2DMake(40.035139+i*0.0005, 116.311655+i*0.01);
    //        MAPointAnnotation *pin1=[[MAPointAnnotation alloc]init];
    //        pin1.coordinate=coordinate1;
    //        pin1.title=[NSString stringWithFormat:@"大头针%d标示",i];
    //        [_map addAnnotation:pin1];
    //    }
    
}
//协议中的方法，用于显示大头针的提示框
-(MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation
{
    static NSString *identifer=@"MyPinId";
    MAPinAnnotationView *pinView=(MAPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifer];
    if (!pinView) {
        pinView=[[MAPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:identifer];
        pinView.canShowCallout=YES;
        UIView *leftView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 27)];
        leftView.layer.cornerRadius=10;
        leftView.layer.masksToBounds=YES;
        leftView.backgroundColor=[UIColor cyanColor];
        pinView.leftCalloutAccessoryView=leftView;
        
        UIButton *button=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        button.frame=CGRectMake(0, 0, 80, 40);
        [button setBackgroundColor:[UIColor yellowColor]];
        [button setTitle:@"come on" forState:UIControlStateNormal];
        button.layer.cornerRadius=10;
        pinView.rightCalloutAccessoryView=button;
        pinView.animatesDrop=YES;
        pinView.pinColor=MAPinAnnotationColorPurple;//大头针的颜色
        pinView.draggable=YES;//是否能拖走
        
    }else{
        pinView.annotation=annotation;
    }
    return pinView;
}

-(void)mapView:(MAMapView *)mapView annotationView:(MAAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    CLLocationCoordinate2D coordinate=view.annotation.coordinate;
    NSLog(@"经度:%f 纬度:%f",coordinate.latitude,coordinate.longitude);
    NSLog(@"待我去这里%@",view.annotation.title);
    
    
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
