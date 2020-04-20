 

#import "BaseViewController.h"
#import "Masonry.h"
#import "BeiBanView1.h"

@interface BaseViewController (){
    
    UIView* mNavBar;
    UILabel* mTitleLab;
    UIView* mErrView;
}
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

  
   // self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@" VC：%@",[self class]);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)setBanar:(NSString*)titles{

    [self setBanar:titles hiddeBack:YES];
   
}


-(void)showErrorView:(UIView*)v{
    if(v == nil)return;
    if(mErrView != nil) return;
    
    BeiBanView1 *beiban = [BeiBanView1 flagView];
    mErrView = beiban;
    beiban.content.text = @" ";
    [v addSubview:beiban];
    beiban.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
    return;
    UIEdgeInsets padding = UIEdgeInsetsMake(0, 0, 0, 0);
    [beiban mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(v.mas_top).offset(padding.top);
        make.left.equalTo(v.mas_left).offset(padding.left);
        make.bottom.equalTo(v.mas_bottom).offset(-padding.bottom);
        make.right.equalTo(v.mas_right).offset(-padding.right);
    }];
    
}
-(void)hiddeErrorView{
    [self deleateErrView];
}
-(void)deleateErrView{
    
    if(mErrView != nil){
        [mErrView removeFromSuperview];
        mErrView = nil;
    }
}


-(void)backClick{

    [self.navigationController popViewControllerAnimated:YES];
}
 
-(void)setBanar:(NSString*)titles hiddeBack:(BOOL)show{
    
    if(mTitleLab != nil){
        
        mTitleLab.text = titles;
        return;
    }
    

    UIView* navView = [[UIView alloc]init];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:mNavBar = navView];
 
    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.height.equalTo(@navBarHeight);
         //make.edges.equalTo(superView).with.insets(pading);
    }];
    
    UILabel* titleLab = [[UILabel alloc] init];
    mTitleLab = titleLab;
    titleLab.textAlignment = 1;
//    titleLab.font = [UIFont systemFontOfSize:16.0];
    titleLab.textColor = [UIColor colorWithHEX:@"#424968"];
    [titleLab setFont:[UIFont fontWithName:@"Helvetica-Medium" size:18.f]];
   // titleLab.frame  = CGRectMake(0, 20, ScreenW, navBarHeight-20);
    titleLab.text = titles;
    [navView addSubview:titleLab];
    
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(navView.mas_bottom).with.offset(0);
        make.left.equalTo(navView.mas_left).with.offset(0);
        make.right.equalTo(navView.mas_right).with.offset(0);
        make.height.equalTo(@44);

    }];
    
    
    if (!show) {
        UIButton* backBtn  = [UIButton buttonWithType:0];
        [backBtn setImage:[UIImage imageNamed:@"row_left"] forState:UIControlStateNormal];
//        backBtn.backgroundColor = [UIColor redColor];
        [navView addSubview:backBtn];
        
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.equalTo(navView.mas_bottom).with.offset(0);
            make.left.equalTo(navView.mas_left).with.offset(0);
           
            make.height.equalTo(@44);
            make.width.equalTo(@50);
           
            //make.edges.equalTo(superView).with.insets(pading);
        }];
        [backBtn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
       /* WeakSelf(self);
        [[backBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            [weakself.navigationController popViewControllerAnimated:YES];
        }];*/
    }
}


-(UIView*)gerNavBar{
    
    return  mNavBar;
}

-(void)hiddenBannar{

   if(!mNavBar)
       mNavBar.hidden = YES;
}
    
-(UIViewController*)getRouterVc:(NSString*)string{
    
    return  [[HHRouter shared] matchController:string];
}
   
+(void)setRouterVc:(NSString*)string controller:(id)vc{
    
   [[HHRouter shared] map:string toControllerClass:vc];
}

    
- (void)didReceiveMemoryWarning {
        [super didReceiveMemoryWarning];
}

@end
