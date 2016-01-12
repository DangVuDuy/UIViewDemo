//
//  FlyingBird.m
//  UIViewDemo
//
//  Created by Dang Vu Duy on 12/30/15.
//  Copyright © 2015 Dang Vu Duy. All rights reserved.
//

#import "FlyingBird.h"

@interface FlyingBird ()
{
    UIImageView *bird;
}

@end

@implementation FlyingBird

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self drawJungle];
    [self addbird];
    [self flyUpAndDown];
    
}
- (void) drawJungle {
    UIImageView* background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    background.frame = self.view.bounds;
    background.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:background];
}
- (void) addbird {
    bird = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 110, 68)];
    bird.animationImages = @[[UIImage imageNamed:@"bird0"],
                             [UIImage imageNamed:@"bird1"],
                             [UIImage imageNamed:@"bird2"],
                             [UIImage imageNamed:@"bird3"],
                             [UIImage imageNamed:@"bird4"],
                             [UIImage imageNamed:@"bird5"]];
    bird.animationRepeatCount = -1; //Forever loop
    bird.animationDuration = 1; // khoang thoi gian chay animation
    [self.view addSubview:bird];
    [bird startAnimating];
}
- (void) flyUpAndDown {
    bird.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:5 animations:^{
        
        bird.center = CGPointMake(self.view.bounds.size.width, self.view.bounds.size.height);
     } completion:^(BOOL finished) {
         bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1, 1),CGAffineTransformMakeRotation(M_PI_4));
        [UIView animateWithDuration:5 animations:^{
            bird.center = CGPointMake(0, 0);
         } completion:^(BOOL finished) {
             [self flyUpAndDown];
         }];
     }];
}

@end
