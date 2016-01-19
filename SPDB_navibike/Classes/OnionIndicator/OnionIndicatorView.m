//
//  OnionIndicator.m
//  OnionIndicatorView
//
//  Created by Marcin Stepnowski on 02/07/15.
//  Copyright © 2016 ParowkaEndStrzalekCo. All rights reserved.
//

#import "OnionIndicatorView.h"
#import <QuartzCore/QuartzCore.h>

@interface OnionIndicatorView ()


@property (weak, nonatomic) IBOutlet UIButton *buttonBlocking;

@property (assign, nonatomic) BOOL animating;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *leftOnion;
@property (weak, nonatomic) IBOutlet UIImageView *rightOnion;

@end

@implementation OnionIndicatorView

+ (OnionIndicatorView *)indicator {
    OnionIndicatorView * indicator = [[[NSBundle mainBundle] loadNibNamed:@"OnionIndicatorView" owner:nil options:nil] objectAtIndex:0];
    
    return indicator;
}

- (void)awakeFromNib {
    [self runSpinAnimationOnView:self.leftOnion];
    [self runSpinAnimationOnView:self.rightOnion];
}

- (void)removeFromSuperview {

    [UIView animateWithDuration:0.5f
                     animations: ^{
                         self.layer.opacity = 0.0f;
                     } completion:^(BOOL finished) {
                         self.animating = NO;
                         @try {
                             [super removeFromSuperview];

                         }
                         @catch (NSException *exception) {
                         }
                         @finally {
                         }
                     }];
    
}

- (void)runSpinAnimationOnView:(UIView*)view; {
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = HUGE_VALF;

    [view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

#pragma mark - Properties

-(void)setHidden:(BOOL)hidden{
    [super setHidden:hidden];
    self.animating = !hidden;
}

@end
