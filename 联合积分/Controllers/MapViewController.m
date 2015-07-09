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
    
    _map = [[MAMapView alloc] initWithFrame:CGRectMake(0, 69, CGRectGetWidth(self.view.bounds), SCREEN_HEIGHT-69)];
    _map.delegate = self;
    _map.showsCompass =NO;
    _map.showsScale =NO;
    
        MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
        pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
        pointAnnotation.title = @"方恒国际";
        pointAnnotation.subtitle = @"阜通东大街6号";
    
    [_map setCenterCoordinate:pointAnnotation.coordinate animated:YES];
        [_map addAnnotation:pointAnnotation];
    
    for (int i = 1; i < 6; i++) {
        MAPointAnnotation* annotation = [[MAPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 39.915 + i*0.02;
        coor.longitude = 116.404 + i*0.02;
        annotation.coordinate = coor;
        annotation.title = @"超市";
        annotation.subtitle =@"地址";
        [_map  addAnnotation:annotation];
        logdebug(@"%d",i);
        
        
    }

       [self.view addSubview:_map];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//        CLLocationCoordinate2D coordinate=CLLocationCoordinate2DMake(40.035139,116.311655);
    
    
    
    [self createNa];
    
}
-(void)createNa
{
    
    UIView *naView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH,49 )];
    
    naView.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:naView];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(10, 10,30, 30)];
    [leftButton setBackgroundImage:[UIImage imageNamed:@"u532"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [naView addSubview:leftButton];
    
    UILabel *titleLabel =[GZRControl createLabelWithFrame:CGRectMake(SCREEN_WIDTH/6-10, 0, SCREEN_WIDTH-SCREEN_WIDTH/6, 49) Font:17 Text:@"附近的超市" TextColor:[UIColor blackColor] TextAligent:NSTextAlignmentLeft];
    [naView addSubview:titleLabel];
    
}

-(void)leftButtonClick:(UIButton *)btn
{
    
    
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
