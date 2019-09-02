//
//  ViewController.m
//  animationPiple
//
//  Created by Anatoly Ryavkin on 24/03/2019.
//  Copyright © 2019 AnatolyRyavkin. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()
@property (strong,nonatomic) UIImageView*pip1;
@property (strong,nonatomic) UIImageView*pip2;
@property (strong,nonatomic) UIImageView*pip3;
@end

@implementation ViewController
-(CGFloat)randomCGFloatAt256{
    return (CGFloat)(((arc4random()*1000)%256) /255.f);
}
-(UIColor*)randomColor{
    CGFloat r = [self randomCGFloatAt256];
    CGFloat g = [self randomCGFloatAt256];
    CGFloat b = [self randomCGFloatAt256];
    return [UIColor colorWithRed:r green:g blue:b alpha:0.8];
}

-(void)moveView: (UIView*) view{
    [UIView animateWithDuration:10
                          delay:0
                        options: UIViewAnimationOptionCurveLinear   //UIViewAnimationOptionCurveEaseInOut //| UIViewAnimationOptionAutoreverse  | UIViewAnimationOptionRepeat //
                     animations:^{
                         view.transform=CGAffineTransformMakeRotation(0);
                         view.transform=CGAffineTransformMakeRotation(0);
                         view.transform=CGAffineTransformMakeRotation(0);                     }
                     completion:^(BOOL finished)  {
                     }
     ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NSLog(@"Did Appear!!!!!");
    //self.view.backgroundColor=[UIColor greenColor];
    
    self.pip1=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"1.png"]];
    self.pip1.frame = CGRectMake(500, 50, 75, 75);
   //[self.view addSubview:self.pip1];
    
    
    self.pip2=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"2.png"]];
    self.pip2.frame = CGRectMake(50, 200, 75, 75);
   //[self.view addSubview:self.pip2];
    
    self.pip3=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"3.png"]];
    self.pip3.frame = CGRectMake(150, 150, 250, 250);
    self.pip3.backgroundColor=[UIColor greenColor];
    [self.view addSubview:self.pip3];
    NSLog(@"----frame= %@",NSStringFromCGRect(self.pip3.frame));
    for(int i = 0;i<10;i++){
     [UIView animateWithDuration:10
                          delay:0
                        options: UIViewAnimationOptionCurveLinear // | UIViewAnimationOptionCurveEaseInOut //| UIViewAnimationOptionAutoreverse  | UIViewAnimationOptionRepeat //
                     animations:^{
                           //self.pip3.transform=CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: 0);
                         NSLog(@"1frame= %@",NSStringFromCGRect(self.pip3.frame));
                         self.pip3.transform=CGAffineTransformMakeRotation(M_PI);
                         NSLog(@"2frame= %@",NSStringFromCGRect(self.pip3.frame));
            
                     }
                     completion:^(BOOL finished)  {
                         NSLog(@"animation finished 1 = %i",finished);
                     }
     ];
        //[self.pip3.layer removeAllAnimations];

    }
 NSLog(@"----frame= %@",NSStringFromCGRect(self.pip3.frame));
}

@end
