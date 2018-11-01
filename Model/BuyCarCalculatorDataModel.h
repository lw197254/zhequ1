//
//  BuyCarCalculatorDataModel.h
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "FatherModel.h"

///首付比例

typedef NS_ENUM(NSInteger,ShouFuBiLi){
    ShouFuBiLi30, ///
    ShouFuBiLi40 ,
    ShouFuBiLi50,
    ShouFuBiLi60
    
};
///还款期数

typedef NS_ENUM(NSInteger,HuanKuanQiShu){
    HuanKuanQiShu12 = 0, ///
    ///默认还款期数
    HuanKuanQiShu24 ,
    HuanKuanQiShu36,
    HuanKuanQiShu48,
    HuanKuanQiShu60
   
};
///排量
typedef NS_ENUM(NSInteger,PaiLiangQuJian){
    paiLiangQuJian1L = 0, ///
    paiLiangQuJian1_1_6L ,
    paiLiangQuJian1_6_2_0L,
    paiLiangQuJian2_0_2_5L,
    paiLiangQuJian2_5_3_0L,
    paiLiangQuJian3_0_4_0L,
    paiLiangQuJian4_0L
};
///座位数
typedef NS_ENUM(NSInteger,JiaoQiangXianZuoWei){
    JiaoQiangXianZuoWei1_5 = 0, ///6座以下
    JiaoQiangXianZuoWei6 ///6座以上（含）
  };
///第三者责任险保额
typedef NS_ENUM(NSInteger,DiSanZheZeRenXianBaoE){
    DiSanZheZeRenXianBaoE5 = 0, ///
    DiSanZheZeRenXianBaoE10 ,
    DiSanZheZeRenXianBaoE20,
    DiSanZheZeRenXianBaoE50,
    DiSanZheZeRenXianBaoE100,
    
};
typedef NS_ENUM(NSInteger,CheShangRenYuanShu){
    CheShangRenYuanShu1 = 0, ///
    CheShangRenYuanShu2 ,
    CheShangRenYuanShu3,
    CheShangRenYuanShu4,
    CheShangRenYuanShu5,
    CheShangRenYuanShu6,
    CheShangRenYuanShu7,
   
    
};
///汽车国内还是进口
typedef NS_ENUM(NSInteger,ShengChanGuoBie){
    ShengChanGuoBieJinKou = 0, ///进口
    ShengChanGuoBieGuoChan = 1 ///国产
};
typedef NS_ENUM(NSInteger,CheShenHuaHenXianBaoE){
    CheShenHuaHenXianBaoE_2K = 0, ///
    CheShenHuaHenXianBaoE_5K ,
    CheShenHuaHenXianBaoE_10K,
    CheShenHuaHenXianBaoE_20K
};
    

@interface BuyCarCalculatorDataModel : FatherModel

///是否是贷款
@property(nonatomic,assign)BOOL isDaiKuan;
///总价
@property(nonatomic,assign)NSInteger zongJia;
///首付
@property(nonatomic,assign)NSInteger shouFu;
///月供
@property(nonatomic,assign)NSInteger yueGong;
///利息
@property(nonatomic,assign)NSInteger liXi;

///车型
@property(nonatomic,copy)NSString* cheXingString;
///裸车价格
@property(nonatomic,assign)NSInteger luoCheJiaGe;

///首付比例
@property(nonatomic,assign)ShouFuBiLi shouFuBiLi;
///首付比例
@property(nonatomic,strong)NSArray* shouFuBiLiLieBiao;
///首付比例
@property(nonatomic,strong)NSArray* shouFuBiLiValueLieBiao;
///首付比例
@property(nonatomic,copy)NSString* shouFuBiLiString;
///贷款金额
@property(nonatomic,assign)NSInteger daiKuanJinE;
///基准利率 一年：4.35%  1-5年：4.75%    >5: 4.9%
@property(nonatomic,assign)double jiZhunLiLv;
///还款期数
@property(nonatomic,assign)HuanKuanQiShu huanKuanQiShu;
///还款年限
@property(nonatomic,assign)NSInteger huanKuanNianXian;
///还款年限列表
@property(nonatomic,strong)NSArray* huanKuanNianXianLieBiao;
///还款期数
@property(nonatomic,copy)NSString* huanKuanQiShuString;
///还款年限
@property(nonatomic,copy)NSString* huanKuanNianXianString;



///必要花费
@property(nonatomic,assign)NSInteger biYaoHuaFei;
///必要花费
@property(nonatomic,copy)NSString*biYaoHuaFeiString;
///购置税
@property(nonatomic,assign)NSInteger gouZhiShui;
///上牌费
@property(nonatomic,assign)NSInteger shangPaiFei;
///车船使用费
@property(nonatomic,assign)NSInteger cheChuanShiYongFei;
///车船使用费列表
@property(nonatomic,strong)NSArray* cheChuanShiYongFeiValueLieBiao;
///排量区间
@property(nonatomic,assign)PaiLiangQuJian paiLiangQuJian;
///排量列表
@property(nonatomic,strong)NSArray*paiLiangQuJianLieBiao;
///排量区间
@property(nonatomic,copy)NSString* paiLiangQuJianString;

///交强险
@property(nonatomic,assign)NSInteger jiaoQiangXian;
///交强险座位  0，表示六座以下，1表示六座以上
@property(nonatomic,assign)JiaoQiangXianZuoWei jiaoQiangXianZuoWei;
@property(nonatomic,copy)NSString* jiaoQiangXianZuoWeiString;
///交强险座位列表
@property(nonatomic,strong)NSArray* jiaoQiangXianZuoWeiLieBiao;



///商业保险
@property(nonatomic,assign)NSInteger shangYeBaoXian;
@property(nonatomic,copy)NSString* shangYeBaoXianString;
///第三者责任险
@property(nonatomic,assign)NSInteger diSanZheZeRenXian;

@property(nonatomic,assign)BOOL diSanZheZeRenXianSelected;
///第三者责任险保额枚举
@property(nonatomic,assign)DiSanZheZeRenXianBaoE diSanZheZeRenXianBaoE;
///第三者责任险保额
@property(nonatomic,copy)NSString* diSanZheZeRenXianBaoEString;
///第三者责任险列表
@property(nonatomic,strong)NSArray* diSanZheZeRenXianBaoELieBiao;
///车辆损失险
@property(nonatomic,assign)NSInteger cheLiangSunShiXian;
@property(nonatomic,assign)BOOL cheLiangSunShiXianSelected;
///全车盗抢险
@property(nonatomic,assign)NSInteger quanCheDaoQiangXian;
@property(nonatomic,assign)BOOL quanCheDaoQiangXianSelected;
///玻璃单独破碎险
@property(nonatomic,assign)NSInteger boLiDanDuPoSuiXian;
@property(nonatomic,assign)BOOL boLiDanDuPoSuiXianSelected;
///生产国别列表
@property(nonatomic,assign)ShengChanGuoBie shengChanGuoBie;
@property(nonatomic,copy)NSString* shengChanGuoBieString;
///生产国别列表
@property(nonatomic,strong)NSArray* shengChanGuoBieLieBiao;
///自燃损失险
@property(nonatomic,assign)NSInteger ziRanShunShiXian;
@property(nonatomic,assign)BOOL ziRanShunShiXianSelected;
///不计免赔特约险
@property(nonatomic,assign)NSInteger buJiMianPeiTeYueXian;
@property(nonatomic,assign)BOOL buJiMianPeiTeYueXianSelected;
///无过责任险
@property(nonatomic,assign)NSInteger wuGuoZeRenXian;
@property(nonatomic,assign)BOOL wuGuoZeRenXianSelected;
///车上人员责任险
@property(nonatomic,assign)NSInteger cheShangRenYuanZeRenXian;
@property(nonatomic,assign)BOOL cheShangRenYuanZeRenXianSelected;
///车上人员数
@property(nonatomic,assign)CheShangRenYuanShu cheShangRenYuanShu;
@property(nonatomic,assign)NSInteger cheShangRenYuanShuNumber;
@property(nonatomic,copy)NSString* cheShangRenYuanShuString;
///车上人员列表
@property(nonatomic,strong)NSArray* cheShangRenYuanShuLieBiao;
///车身划痕险
@property(nonatomic,assign)NSInteger cheShenHuaHenXian;
@property(nonatomic,assign)BOOL cheShenHuaHenXianSelected;
///车身划痕险保额
@property(nonatomic,assign)CheShenHuaHenXianBaoE cheShenHuaHenXianBaoE;
@property(nonatomic,copy)NSString* cheShenHuaHenXianBaoEString;
@property(nonatomic,strong)NSArray* cheShenHuaHenXianBaoELieBiao;

-(void)resetAll;
///保险全选中
-(void)selectAllBaoxian;

@end
