 
#import "BaseNavVC.h"

@interface BaseNavVC ()

@end

@implementation BaseNavVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    [super pushViewController:viewController animated:animated];
    
}

 
- (BOOL)shouldAutorotate{
    
 
    
    return YES;
    
}



- (UIInterfaceOrientationMask)supportedInterfaceOrientations

{
    
        return UIInterfaceOrientationMaskPortrait;
     
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight;
    
}



- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation

{
    
   
    
    return UIInterfaceOrientationPortrait;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}/*
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    static UIViewController *lastController = nil;
    

    if (lastController != nil)
    {
        
        if ([lastController respondsToSelector:@selector(viewWillDisappear:)])
        {
          //  [lastController viewWillDisappear:animated];
        }
    }
    
    
    lastController = viewController;
    
   // [viewController viewWillAppear:animated];
}*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
