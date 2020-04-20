//
//  BaseTopSlideVC.m
//  ScmProject
//
//  Created by zhoudong on 2018/12/12.
//  Copyright © 2018年 session. All rights reserved.
//

#import "BaseTopSlideVC.h"
#import "SGPageTitleView.h"
#import "SGPageTitleViewConfigure.h"
#import "SGPageContentScrollView.h"

 
@interface BaseTopSlideVC ()<SGPageTitleViewDelegate,SGPageContentScrollViewDelegate>{
    SGPageTitleView* mTileView;
    SGPageContentScrollView *mPageContentScrollView;
}

@end

@implementation BaseTopSlideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

-(void)addTitle:(NSArray*)titleList addControllerFun:(NSArray*)vcList{
    
    //配置容器
    SGPageTitleViewConfigure *configure = [SGPageTitleViewConfigure pageTitleViewConfigure];
    configure.indicatorAdditionalWidth = 10;
    configure.titleGradientEffect = YES;
    
    //  indicatorBorderWidth
    configure.indicatorBorderColor = [UIColor getColor:@"#352E23"];
    configure.indicatorColor = [UIColor getColor:@"#352E23"];
    configure.titleSelectedColor = [UIColor getColor:@"#352E23"];
    configure.titleColor = [UIColor getColor:@"#352E23"];
    

    
    //顶部Title数据源
    SGPageTitleView *pageTitleView = [SGPageTitleView pageTitleViewWithFrame:CGRectMake(0, navBarHeight, ScreenW, 44) delegate:self titleNames:titleList configure:configure];
    pageTitleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pageTitleView];
    mTileView = pageTitleView;
    //创建容器装载VCs
    SGPageContentScrollView *pageContentScrollView = [[SGPageContentScrollView alloc] initWithFrame:CGRectMake(0, navBarHeight+44,ScreenW,  ScreenH - navBarHeight -44) parentVC:self childVCs:vcList];
    pageContentScrollView.delegatePageContentScrollView = self;
    pageContentScrollView.isAnimated = YES;
    mPageContentScrollView = pageContentScrollView;
    [self.view addSubview:pageContentScrollView];
    for (int b=0; b<vcList.count; b++) {//全部加载出来
        [pageContentScrollView setPageContentScrollViewCurrentIndex:b];
    }
    
    pageTitleView.selectedIndex = 0;
    [pageContentScrollView setPageContentScrollViewCurrentIndex:0];
   
}

//顶部title切换完成调用
- (void)pageTitleView:(SGPageTitleView *)pageTitleView selectedIndex:(NSInteger)selectedIndex
{
    [mPageContentScrollView setPageContentScrollViewCurrentIndex:selectedIndex];
   
}
- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView progress:(CGFloat)progress originalIndex:(NSInteger)originalIndex targetIndex:(NSInteger)targetIndex {
    [mTileView setPageTitleViewWithProgress:progress originalIndex:originalIndex targetIndex:targetIndex];
    
}
- (void)pageContentScrollView:(SGPageContentScrollView *)pageContentScrollView index:(NSInteger)index{
    
    mTileView.selectedIndex = index;
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
