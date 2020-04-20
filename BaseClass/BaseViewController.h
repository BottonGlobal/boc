 
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


-(void)backClick;

+(void)setRouterVc:(NSString*)string controller:(id)vc;


-(void)showErrorView:(UIView*)v;
-(void)hiddeErrorView;
-(void)deleateErrView;

@end
