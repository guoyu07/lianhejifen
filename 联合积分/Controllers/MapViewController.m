//
//  MapViewController.m
//  联合积分
//
//  Created by kaifabu－2 on 15/7/7.
//  Copyright (c) 2015年 arong. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()<BMKMapViewDelegate,BMKLocationServiceDelegate>
{
    BMKMapManager *_mapManager;
    BMKMapView *_mapView;
    BMKLocationService *_locationService;
    BMKCoordinateRegion *_coordinate ;
    BMKPointAnnotation* _pointAnnotation;

}
@end
@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.hidden = YES;

    _mapManager =[[BMKMapManager alloc]init];
    
    BOOL ret = [_mapManager start:@"8iP7jCLGOAx8hSSs7SaHZdum"  generalDelegate:nil];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    [self createNa];
    
    [self createMap];
    
}
- (void) viewDidAppear:(BOOL)animated {
    
    _mapView =[[BMKMapView alloc]initWithFrame:CGRectMake(0, 69, SCREEN_WIDTH, SCREEN_HEIGHT-69)];
    
    _mapView.delegate =self;
    [self.view addSubview:_mapView];
    _mapView.showsUserLocation = YES; //是否显示定位图层（即我的位置的小圆点）
    _mapView.zoomLevel = 15;//地图显示比例
    _mapView.rotateEnabled = NO; //设置是否可以旋转
    _mapView.userTrackingMode = BMKUserTrackingModeFollow;

    [self addPointAnnotationlatitude:39.915 longitude:116.404];

    for (int i = 1; i < 6; i++) {
        BMKPointAnnotation* annotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude = 39.915 + i*0.002;
        coor.longitude = 116.404 + i*0.002;
        annotation.coordinate = coor;
        annotation.title = @"超市";
        annotation.subtitle =@"地址";
        [_mapView   addAnnotation:annotation];
        logdebug(@"%d",i);
        
        
    }
    
    
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

-(void)createMap
{

    _locationService =[[BMKLocationService alloc]init];
    _locationService.delegate =self;
    [BMKLocationService setLocationDistanceFilter:100];
    [_locationService startUserLocationService];
    
    
  
    
}

#pragma mark 用户位置更新后，会调用此函数
- (void)didUpdateUserLocation:(BMKUserLocation *)userLocation
{
    [_mapView updateLocationData:userLocation];
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


//添加标注
- (void)addPointAnnotationlatitude:( CGFloat)lat longitude:(CGFloat)lon
{
      BMKPointAnnotation  *pointAnnotation = [[BMKPointAnnotation alloc]init];
        CLLocationCoordinate2D coor;
        coor.latitude =lat ;
        coor.longitude = lon;
        pointAnnotation.coordinate = coor;
        pointAnnotation.title = @"test";
        pointAnnotation.subtitle = @"天安门";
    
    [_mapView setCenterCoordinate:coor animated:YES];
    [_mapView addAnnotation:pointAnnotation];
    
}

// 根据anntation生成对应的View
- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    //普通annotation
        NSString *AnnotationViewID = @"renameMark";
        BMKPinAnnotationView *annotationView = (BMKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:AnnotationViewID];
        if (annotationView == nil) {
            annotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationViewID];
            // 设置颜色
            annotationView.pinColor = BMKPinAnnotationColorPurple;
            // 从天上掉下效果
            annotationView.animatesDrop = YES;
            // 设置可拖拽
            annotationView.draggable = YES;
            
        }
        return annotationView;
    
    
}

// 当点击annotation view弹出的泡泡时，调用此接口
- (void)mapView:(BMKMapView *)mapView annotationViewForBubble:(BMKAnnotationView *)view;
{
    NSLog(@"paopaoclick");
    
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
