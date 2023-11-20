//
//  SDWebImageViewController.m
//
//  Created by XQ on 2022/4/6.
//

#import "SDWebImageViewController.h"

@interface SDWebImageViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation SDWebImageViewController

+ (NSString *)scheme {
    return @"q://vc/sdwebimage";
}

- (void)setupData {
    [super setupData];
    NSURL *url = [NSURL URLWithString:@"https://rental-camera.jp/wp-content/uploads/2022/02/IMG_4K.jpg"];
    self.imageView.sd_imageTransition = [SDWebImageTransition fadeTransition];
    [self.imageView sd_setImageWithURL:url
                      placeholderImage:[UIImage imageWithColor:[UIColor grayColor]]
                             completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (!image || error) {
            return;
        }
        CGFloat ratio = image.size.width / image.size.height;
        CGFloat height = CGRectGetWidth(self.imageView.frame) / ratio;
        [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(height);
        }];
        
    }];
    
}

- (void)setupViews {
    [super setupViews];
    [self addSubview:self.imageView];
    [self.imageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.width.equalTo(self.rootContainer);
    }];
}

- (UIImageView *)imageView {
    if (_imageView) return _imageView;
    _imageView = [UIImageView new];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 旋转手势
    UIRotationGestureRecognizer *rotationGestureRecognizer = [UIRotationGestureRecognizer new];
    [[rotationGestureRecognizer rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        UIView *view = x.view;
        if (rotationGestureRecognizer.state == UIGestureRecognizerStateBegan || rotationGestureRecognizer.state == UIGestureRecognizerStateChanged) {
            view.transform = CGAffineTransformRotate(view.transform, rotationGestureRecognizer.rotation);
            [rotationGestureRecognizer setRotation:0];
        }
    }];
    [_imageView addGestureRecognizer:rotationGestureRecognizer];
    
    // 缩放手势
    UIPinchGestureRecognizer *pinchGestureRecognizer = [UIPinchGestureRecognizer new];
    [[pinchGestureRecognizer rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        UIView *view = x.view;
        if (pinchGestureRecognizer.state == UIGestureRecognizerStateBegan || pinchGestureRecognizer.state == UIGestureRecognizerStateChanged) {
            view.transform = CGAffineTransformScale(view.transform, pinchGestureRecognizer.scale, pinchGestureRecognizer.scale);
            pinchGestureRecognizer.scale = 1;
        }
    }];
    [_imageView addGestureRecognizer:pinchGestureRecognizer];
    
    // 移动手势
    UIPanGestureRecognizer *panGestureRecognizer = [UIPanGestureRecognizer new];
    [[panGestureRecognizer rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        UIView *view = x.view;
        if (panGestureRecognizer.state == UIGestureRecognizerStateBegan || panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
            CGPoint translation = [panGestureRecognizer translationInView:view.superview];
            [view setCenter:(CGPoint){view.center.x + translation.x, view.center.y + translation.y}];
            [panGestureRecognizer setTranslation:CGPointZero inView:view.superview];
        }
    }];
    [_imageView addGestureRecognizer:panGestureRecognizer];
    
    // 双击
    UITapGestureRecognizer *doubleTapGestureRecognizer = [UITapGestureRecognizer new];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    [[doubleTapGestureRecognizer rac_gestureSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        UIView *view = x.view;
        view.transform = CGAffineTransformScale(view.transform, -1.0, 1.0);
    }];
    [_imageView addGestureRecognizer:doubleTapGestureRecognizer];
    
    _imageView.userInteractionEnabled = YES;
    _imageView.multipleTouchEnabled = YES;
    
    return _imageView;
}

@end
