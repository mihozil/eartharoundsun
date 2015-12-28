//
//  ViewController.m
//  eartharoundsun
//
//  Created by Apple on 12/28/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIImageView *earth;
    UIImageView *sun;
    UIImageView *moon;
    CGFloat sunearthdistance,earthmoondistance;
    NSTimer *timerearth;
    NSTimer *timermoon;
    float angelearth;
    float angelmoon;
}

- (void) initproject{
    sunearthdistance = (self.view.bounds.size.width/2 - 10) * 2/3;
    earthmoondistance = sunearthdistance /3;
    angelearth = 0;
    angelmoon=0;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initproject];
    [self objectcreating];
    [self earthspinning];
    [self moonspinning];
    
}
- (void) objectcreating{
    earth = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"earth.png"]];
    sun= [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sun.png"]];
    moon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"moon.png"]];
    
    //size
    sun.frame = CGRectMake(0, 0, 64, 64);
    earth.frame = CGRectMake(0, 0, 32, 32);
    moon.frame = CGRectMake(0, 0, 16, 16);
    
    
    // position
    sun.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
    earth.center = CGPointMake(sun.center.x+ sunearthdistance, self.view.bounds.size.height/2);
    moon.center = CGPointMake(earth.center.x + earthmoondistance, earth.center.y);
    
    // add subview
    [self.view addSubview:sun];
    [self.view addSubview:earth];
    [self.view addSubview:moon];
    
}
- (void) moonspinning{
    timermoon = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(dommoonspinning) userInfo:nil repeats:true];

}
- (void) dommoonspinning {
    angelmoon += 0.01;
    moon.center = CGPointMake(earth.center.x + earthmoondistance*cosf(angelmoon), earth.center.y + earthmoondistance*sinf(angelmoon));
                     
}
- (void) earthspinning{
    timerearth = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(doearthspinning) userInfo:nil repeats:true];

}
- (void) doearthspinning{
    angelearth += 0.001;
    earth.center = CGPointMake(sun.center.x + sunearthdistance *cosf(angelearth), sun.center.y + sunearthdistance *sinf(angelearth));
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
