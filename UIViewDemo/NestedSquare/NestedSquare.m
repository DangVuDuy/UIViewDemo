//
//  NestedSquare.m
//  UIViewDemo
//
//  Created by Dang Vu Duy on 12/30/15.
//  Copyright © 2015 Dang Vu Duy. All rights reserved.
//

#import "NestedSquare.h"

@interface NestedSquare ()

@end

@implementation NestedSquare

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawNestedSquares];
    [self performSelector:@selector(rotateAllSquare)
               withObject:nil
               afterDelay:2];
    
}
- (void) drawNestedSquares {
    CGSize mainViewSize = self.view.bounds.size;
    CGFloat margin = 20;
    CGFloat recWidth = mainViewSize.width - margin * 2.0;
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    
    CGPoint center = CGPointMake(mainViewSize.width * 0.5,
                                 (mainViewSize.height + statusNavigationBarHeight) * 0.5);
    
    for (int i = 0; i < 10; i++) {
        UIView* square;
        if (i % 2 == 0) {
            square = [self drawSquareByWitch:recWidth
                                   andRotate:false
                                    atCenter:center];
        } else  {
            square = [self drawSquareByWitch:recWidth
                                   andRotate:true
                                    atCenter:center];
        }
        [self.view addSubview:square];
        
        recWidth = recWidth * 0.707;
    }
 }

- (UIView* ) drawSquareByWitch: (CGFloat) width
                     andRotate: (BOOL) rotate
                      atCenter: (CGPoint) center {
    UIView * square = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    square.center = center;
    square.backgroundColor = rotate ? [UIColor whiteColor] : [UIColor grayColor];
    square.transform = rotate ? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    return square;

}
- (void) rotateAllSquare {
    [UIView animateWithDuration:2.0 animations:^{
        for (int i = 0 ; i < self.view.subviews.count ; i++) {
            if (i % 2 == 0) {
             self.view.subviews[i].transform = CGAffineTransformMakeRotation(M_PI_4);
           }else
             self.view.subviews[i].transform = CGAffineTransformIdentity;
        }
    }];
}

@end
