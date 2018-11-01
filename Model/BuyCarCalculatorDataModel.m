//
//  BuyCarCalculatorDataModel.m
//  chechengwang
//
//  Created by 刘伟 on 2017/3/7.
//  Copyright © 2017年 江苏十分便民. All rights reserved.
//

#import "BuyCarCalculatorDataModel.h"

@implementation BuyCarCalculatorDataModel
-(id)valueForUndefinedKey:(NSString *)key{
    return nil;
}
-(instancetype)init{
    if (self = [super init]) {
        self.huanKuanQiShu = HuanKuanQiShu24;
    }
    return self;
}
-(NSInteger)zongJia{
    if(self.isDaiKuan){
        
        _zongJia = self.daiKuanJinE+self.shouFu+self.liXi ;
    }else{
       _zongJia = self.luoCheJiaGe+self.biYaoHuaFei+self.shangYeBaoXian;
    }
    
    return _zongJia;
}
-(NSArray*)shouFuBiLiLieBiao{
   return  @[@"30%",@"40%",@"50%",@"60%"];
}
-(NSArray*)shouFuBiLiValueLieBiao{
    return  @[@"0.3",@"0.4",@"0.5",@"0.6"];
}

-(NSInteger)shouFu{
    float n = [self.shouFuBiLiValueLieBiao[self.shouFuBiLi] floatValue];
    _shouFu = self.luoCheJiaGe*n +self.biYaoHuaFei+self.shangYeBaoXian;
    return _shouFu;
}
-(double)jiZhunLiLv{
//     银行基准利率：一年：4.35%  1-5年：4.75%    >5: 4.9%
    if (self.huanKuanNianXian==1) {
        _jiZhunLiLv = 0.0435;
    }else if(self.huanKuanNianXian >1&&self.huanKuanNianXian <=5){
         _jiZhunLiLv = 0.0475;
    }else if(self.huanKuanNianXian > 5){
        _jiZhunLiLv = 0.049;
    }
    return _jiZhunLiLv;
}
-(NSInteger)daiKuanJinE{
//    贷款额=裸车价格 - 首付款
    float n = [self.shouFuBiLiValueLieBiao[self.shouFuBiLi] floatValue];
    
    _daiKuanJinE = self.luoCheJiaGe - self.luoCheJiaGe*n;
    return _daiKuanJinE;
}
-(NSInteger)huanKuanNianXian{
    _huanKuanNianXian = self.huanKuanQiShu;
    if (_huanKuanNianXian <= 0||_huanKuanNianXian > self.huanKuanNianXianLieBiao.count) {
        _huanKuanNianXian = 1;
    }
    return _huanKuanNianXian;
}

-(HuanKuanQiShu)huanKuanQiShu{
    HuanKuanQiShu i = _huanKuanQiShu+1;
    
    if (i <= 0||i > self.huanKuanNianXianLieBiao.count) {
        i = 1;
    }
    return i;
   
}

-(NSArray*)huanKuanNianXianLieBiao{
    return @[@"1年(12期)",@"2年(24期)",@"3年(36期)",@"4年(48期)",@"5年(60期)"];
}
-(NSString*)huanKuanQiShuString{
    return [NSString stringWithFormat:@"%ld期",self.huanKuanQiShu*12];
}
-(NSString*)huanKuanNianXianString{
    return [NSString stringWithFormat:@"%ld年",self.huanKuanNianXian];
}
-(NSString*)shouFuBiLiString{
    return self.shouFuBiLiLieBiao[self.shouFuBiLi];
}
-(NSInteger)biYaoHuaFei{
    _biYaoHuaFei = self.gouZhiShui+self.shangPaiFei+self.cheChuanShiYongFei+self.jiaoQiangXian;
    return _biYaoHuaFei;
    
}
-(NSString*)biYaoHuaFeiString{
    
     return [NSString stringWithFormat:@"共计：%@元",[Tool changeNumberFormat:self.biYaoHuaFei]];
}
-(NSInteger)yueGong{
    
    ///每月还款额=贷款本金×[月利率×(1+月利率) ^ 还款月数]÷[(1+月利率) ^ 还款月数-1]
    double f =pow((1 + self.jiZhunLiLv/12), self.huanKuanNianXian*12);
    
   return  self.daiKuanJinE*(self.jiZhunLiLv/12)*f/(f-1);
}
-(NSInteger)liXi{
//    　还款总利息=贷款额*贷款月数*月利率*（1+月利率）贷款月数/【（1+月利率）还款月数 - 1】-贷款额
    _liXi= self.daiKuanJinE*self.huanKuanNianXian*12 *self.jiZhunLiLv/12*pow((self.jiZhunLiLv/12+1), self.huanKuanNianXian*12)/(pow((self.jiZhunLiLv/12+1), self.huanKuanNianXian*12)-1) - self.daiKuanJinE;
    return _liXi;
}
-(NSInteger)gouZhiShui{
//    购置税 = 裸车价/(1+17%)*10%
    _gouZhiShui = self.luoCheJiaGe/(1+0.17)*0.1;
    return _gouZhiShui;
}
-(NSInteger)shangPaiFei{
//     上牌费用：默认500，可修改
    _shangPaiFei = 500;
    if (self.luoCheJiaGe==0) {
        _shangPaiFei = 0;
    }
    return _shangPaiFei;
}
-(NSArray*)paiLiangQuJianLieBiao{
   return  @[@"1.0L以下",@"1.0-1.6L(含)",@"1.6-2.0L(含)",@"2.0-2.5L(含)",
      @"2.5-3.0L(含)",@"3.0-4.0L(含)",@"4.0L以上"];
}
-(NSArray*)cheChuanShiYongFeiValueLieBiao{
    return @[@"300",@"420",@"480",@"900",@"1920",@"3480",@"5280"];
}
-(void)setpaiLiangQuJian:(PaiLiangQuJian)paiLiangQuJian{
    if (paiLiangQuJian <0||paiLiangQuJian >=self.paiLiangQuJianLieBiao.count) {
        paiLiangQuJian = 0;
    }
    if (_paiLiangQuJian != paiLiangQuJian) {
        _paiLiangQuJian = paiLiangQuJian;
    }
    
    
    self.paiLiangQuJianString = self.paiLiangQuJianLieBiao[paiLiangQuJian];
    
    self.cheChuanShiYongFei = [self.cheChuanShiYongFeiValueLieBiao[paiLiangQuJian] integerValue];
}
-(NSString*)paiLiangQuJianString{
    _paiLiangQuJianString = self.paiLiangQuJianLieBiao[self.paiLiangQuJian];
    return _paiLiangQuJianString;
}
-(NSInteger)cheChuanShiYongFei{
    _cheChuanShiYongFei = [self.cheChuanShiYongFeiValueLieBiao[self.paiLiangQuJian] integerValue];
    if (self.luoCheJiaGe==0) {
        _cheChuanShiYongFei = 0;
    }
    return _cheChuanShiYongFei;
}
-(NSArray*)jiaoQiangXianZuoWeiLieBiao{
    return @[@"六座以下",@"六座以上(含)"];
}
-(void)setJiaoQiangXianZuoWei:(JiaoQiangXianZuoWei)jiaoQiangXianZuoWei{
    if (jiaoQiangXianZuoWei< 0 ||jiaoQiangXianZuoWei > 1) {
        jiaoQiangXianZuoWei = 0;
    }
    if (_jiaoQiangXianZuoWei!=jiaoQiangXianZuoWei) {
        _jiaoQiangXianZuoWei = jiaoQiangXianZuoWei;
    }
    
   
}
-(NSString*)jiaoQiangXianZuoWeiString{
    
    return self.jiaoQiangXianZuoWeiLieBiao[self.jiaoQiangXianZuoWei];
}
-(NSInteger)jiaoQiangXian{
    //
//    6座以下  950   6座以上  1100
    if (self.jiaoQiangXianZuoWei==0) {
        _jiaoQiangXian = 950;
        
    }else{
        _jiaoQiangXian = 1100;
    }
    if (self.luoCheJiaGe==0) {
        _jiaoQiangXian = 0;
    }
    return _jiaoQiangXian;
}
-(NSInteger)shangYeBaoXian{
    _shangYeBaoXian = self.diSanZheZeRenXian+self.cheLiangSunShiXian+self.quanCheDaoQiangXian+self.boLiDanDuPoSuiXian+self.ziRanShunShiXian+self.buJiMianPeiTeYueXian+self.wuGuoZeRenXian+self.cheShangRenYuanZeRenXian+self.cheShenHuaHenXian;
    return _shangYeBaoXian;
}
-(NSString*)shangYeBaoXianString{
     return [NSString stringWithFormat:@"共计：%@元",[Tool changeNumberFormat:self.shangYeBaoXian]];
}
-(NSArray*)diSanZheZeRenXianBaoELieBiao{
   return  @[@"5万",@"10万",@"20万",@"50万",@"100万"];
}
-(NSString*)diSanZheZeRenXianBaoEString{
    return self.diSanZheZeRenXianBaoELieBiao[self.diSanZheZeRenXianBaoE];
}

-(NSInteger)diSanZheZeRenXian{
//    第三者责任险（六座以上）
//    5w-478  10w-674   20w-821   50w-1094  100w-1425
//    第三者责任险（六座以下）
//    5w-516  10w-746   20w-924   50w-1252  100w-1630
    
    if (self.luoCheJiaGe==0) {
        return 0;
    }
    
  NSArray*liuZuoYiXia=  @[@"478",@"674",@"821",@"1094",@"1425"];
     NSArray*liuZuoYiShang=  @[@"516",@"746",@"924",@"1252",@"1630"];
    if (self.diSanZheZeRenXianSelected) {
        if (self.jiaoQiangXianZuoWei==0) {
            _diSanZheZeRenXian = [liuZuoYiShang[self.diSanZheZeRenXianBaoE] integerValue];
        }else{
            _diSanZheZeRenXian = [liuZuoYiXia[self.diSanZheZeRenXianBaoE] integerValue];
        }
        
    }else{
        _diSanZheZeRenXian = 0;
    }
    return _diSanZheZeRenXian;
}
-(void)setDiSanZheZeRenXianSelected:(BOOL)diSanZheZeRenXianSelected{
    if (_diSanZheZeRenXianSelected != diSanZheZeRenXianSelected) {
        _diSanZheZeRenXianSelected = diSanZheZeRenXianSelected;
        if (diSanZheZeRenXianSelected== NO) {
            _buJiMianPeiTeYueXianSelected = NO;
            _wuGuoZeRenXianSelected = NO;
        }
    }
}
-(NSInteger)cheLiangSunShiXian{
//    . 车辆损失险（六座以上）
//    550+裸车价格*1.0880%
//    车辆损失险（六座以下）
//    459+裸车价格*1.0880%
    if (self.cheLiangSunShiXianSelected&&self.luoCheJiaGe) {
        if (self.jiaoQiangXianZuoWei==0) {
            _cheLiangSunShiXian = self.luoCheJiaGe*1.088*0.01+459;
        }else{
            _cheLiangSunShiXian = self.luoCheJiaGe*1.088*0.01+550;
        }

        
    }else{
        _cheLiangSunShiXian = 0;
    }
    return _cheLiangSunShiXian;
    
}
-(void)setCheLiangSunShiXianSelected:(BOOL)cheLiangSunShiXianSelected{
    if (_cheLiangSunShiXianSelected != cheLiangSunShiXianSelected) {
        _cheLiangSunShiXianSelected = cheLiangSunShiXianSelected;
        if (cheLiangSunShiXianSelected== NO) {
            _quanCheDaoQiangXianSelected = NO;
            _buJiMianPeiTeYueXianSelected = NO;
            _cheShenHuaHenXianSelected = NO;
            _ziRanShunShiXianSelected = NO;
            _boLiDanDuPoSuiXianSelected = NO;
        }
    }

}
///【第三者责任险】不购买，则无法购买【不计免赔特约险】【无过责任险】
//【车辆损失险】不购买，则无法购买【全车盗抢险】【不计免赔特约险】【车身划痕险】
-(void)setQuanCheDaoQiangXianSelected:(BOOL)quanCheDaoQiangXianSelected{
    if (self.cheLiangSunShiXianSelected ==NO) {
        _quanCheDaoQiangXianSelected= NO;
    }else{
        _quanCheDaoQiangXianSelected = quanCheDaoQiangXianSelected;
    }
}
-(NSInteger)quanCheDaoQiangXian{
//    . 全车盗抢险（六座以上）
//    140+0.44%*裸车价
//    全车盗抢险（六座以下）
//    120+0.49%*裸车价
    if (self.quanCheDaoQiangXianSelected&&self.luoCheJiaGe!=0) {
        if (self.jiaoQiangXianZuoWei==0) {
            _quanCheDaoQiangXian = self.luoCheJiaGe*0.49*0.01+120;
        }else{
            _quanCheDaoQiangXian = self.luoCheJiaGe*0.44*0.01+140;
        }
        
        
    }else{
        _quanCheDaoQiangXian = 0;
    }
    return _quanCheDaoQiangXian;

}
-(void)setBoLiDanDuPoSuiXianSelected:(BOOL)boLiDanDuPoSuiXianSelected{
    if (!self.cheLiangSunShiXianSelected) {
        _boLiDanDuPoSuiXianSelected = NO;
    }else{
        if (_boLiDanDuPoSuiXianSelected != boLiDanDuPoSuiXianSelected) {
            _boLiDanDuPoSuiXianSelected = boLiDanDuPoSuiXianSelected;
        }
        
    }
}
-(NSInteger)boLiDanDuPoSuiXian{
    /// 玻璃单独破碎险：进口： 裸车价×0.25%，国产： 裸车价×0.15%
    if (self.boLiDanDuPoSuiXianSelected) {
        if (self.shengChanGuoBie==0) {
            _boLiDanDuPoSuiXian = self.luoCheJiaGe*0.25*0.01;
        }else{
            _boLiDanDuPoSuiXian = self.luoCheJiaGe*0.15*0.01;
        }
        
        
    }else{
        _boLiDanDuPoSuiXian = 0;
    }
    return _boLiDanDuPoSuiXian;
    
}
-(void)setShengChanGuoBie:(ShengChanGuoBie)shengChanGuoBie{
//    ==0 表示进口，==1 表示国产
    if (shengChanGuoBie< 0 ||shengChanGuoBie > 1) {
        shengChanGuoBie = 0;
    }
    if (_shengChanGuoBie!=shengChanGuoBie) {
        _shengChanGuoBie = shengChanGuoBie;
    }

}
-(NSArray*)shengChanGuoBieLieBiao{
    return @[@"进口",@"国产"];
}
-(NSString*)shengChanGuoBieString{
    return self.shengChanGuoBieLieBiao[self.shengChanGuoBie];
}

-(void)setZiRanShunShiXianSelected:(BOOL)ziRanShunShiXianSelected{
    if (!self.cheLiangSunShiXianSelected) {
        _ziRanShunShiXianSelected = NO;
    }else{
        if (_ziRanShunShiXianSelected != ziRanShunShiXianSelected) {
            _ziRanShunShiXianSelected = ziRanShunShiXianSelected;
        }
        
    }
}
-(NSInteger)ziRanShunShiXian{
//    3. 自燃损失险：裸车价×0.15%
    if (self.ziRanShunShiXianSelected) {
        _ziRanShunShiXian = self.luoCheJiaGe*0.15*0.01;
        
    }else{
        _ziRanShunShiXian = 0;
    }
    return _ziRanShunShiXian;

}
///【第三者责任险】不购买，则无法购买【不计免赔特约险】【无过责任险】
//【车辆损失险】不购买，则无法购买【全车盗抢险】【不计免赔特约险】【车身划痕险】
-(void)setBuJiMianPeiTeYueXianSelected:(BOOL)buJiMianPeiTeYueXianSelected{
    if (self.diSanZheZeRenXianSelected==NO||self.cheLiangSunShiXianSelected==NO) {
        _buJiMianPeiTeYueXianSelected = NO;
    }else{
        _buJiMianPeiTeYueXianSelected = buJiMianPeiTeYueXianSelected;
    }
}

-(NSInteger)buJiMianPeiTeYueXian{
//     不计免赔特约险： (车辆损失险+第三者责任险)×20%
    
    if (self.luoCheJiaGe==0) {
        return 0;
    }
    if (self.buJiMianPeiTeYueXianSelected) {
        _buJiMianPeiTeYueXian = (self.cheLiangSunShiXian+self.diSanZheZeRenXian)*0.2;
    }else{
        _buJiMianPeiTeYueXian = 0;
    }
    return _buJiMianPeiTeYueXian;
}
///【第三者责任险】不购买，则无法购买【不计免赔特约险】【无过责任险】

-(void)setWuGuoZeRenXianSelected:(BOOL)wuGuoZeRenXianSelected{
    if (self.diSanZheZeRenXianSelected==NO) {
        _wuGuoZeRenXianSelected = NO;
    }else{
         _wuGuoZeRenXianSelected = wuGuoZeRenXianSelected;
    }
}
-(NSInteger)wuGuoZeRenXian{
    if (self.luoCheJiaGe==0) {
        return 0;
    }
    /// 无过责任险：第三者责任险保险费×20%
    
    if (self.wuGuoZeRenXianSelected) {
        _wuGuoZeRenXian = self.diSanZheZeRenXian*0.2;
    }else{
        _wuGuoZeRenXian = 0;
    }
    return _wuGuoZeRenXian;
}
-(NSArray*)cheShangRenYuanShuLieBiao{
    return @[@"1人",@"2人",@"3人",@"4人",@"5人",@"6人",@"7人"];
}
-(void)setCheShangRenYuanShu:(CheShangRenYuanShu)cheShangRenYuanShu{
    _cheShangRenYuanShu = cheShangRenYuanShu;
    _cheShangRenYuanShuNumber = cheShangRenYuanShu+1;
}

-(NSInteger)cheShangRenYuanZeRenXian{
    if (self.luoCheJiaGe==0) {
        return 0;
    }
//    车上人员责任险：每人保费50元 * 人数
    if (self.cheShangRenYuanZeRenXianSelected) {
        if (self.cheShangRenYuanShuNumber>0) {
            _cheShangRenYuanZeRenXian = self.cheShangRenYuanShuNumber*50;
        }else{
            _cheShangRenYuanZeRenXian = (self.cheShangRenYuanShu+1)*50;
        }
        
    }else{
        _cheShangRenYuanZeRenXian = 0;
    }
    return _cheShangRenYuanZeRenXian;

}
-(NSString*)cheShangRenYuanShuString{
    if (self.cheShangRenYuanShuNumber!=0) {
       return [NSString stringWithFormat:@"%ld人",self.cheShangRenYuanShuNumber];
    }else{
        return [NSString stringWithFormat:@"%ld人",self.cheShangRenYuanShu+1];
    }
    
}
-(void)setCheShenHuaHenXianBaoE:(CheShenHuaHenXianBaoE)cheShenHuaHenXianBaoE{
    if (cheShenHuaHenXianBaoE < 0 ||cheShenHuaHenXianBaoE >= self.cheShenHuaHenXianBaoELieBiao.count) {
        cheShenHuaHenXianBaoE = 0;
    }
    if (cheShenHuaHenXianBaoE!=_cheShenHuaHenXianBaoE) {
        _cheShenHuaHenXianBaoE = cheShenHuaHenXianBaoE;
    }
}
-(NSString*)cheShenHuaHenXianBaoEString{
    
    return self.cheShenHuaHenXianBaoELieBiao[self.cheShenHuaHenXianBaoE];
}
-(NSArray*)cheShenHuaHenXianBaoELieBiao{
    return @[@"2千",@"5千",@"1万",@"2万"];
}
//【车辆损失险】不购买，则无法购买【全车盗抢险】【不计免赔特约险】【车身划痕险】
-(void)setCheShenHuaHenXianSelected:(BOOL)cheShenHuaHenXianSelected{
    if (self.cheLiangSunShiXianSelected ==NO) {
         _cheShenHuaHenXianSelected = NO;
    }else{
        _cheShenHuaHenXianSelected = cheShenHuaHenXianSelected;
    }
}

-(NSInteger)cheShenHuaHenXian{
    if (self.luoCheJiaGe==0) {
        return 0;
    }
    
    if (self.cheShenHuaHenXianSelected) {
        NSArray*array =  @[@"400",@"570",@"760",@"1140"];
        
        _cheShenHuaHenXian = [array[self.cheShenHuaHenXianBaoE] integerValue];
    }else{
        _cheShenHuaHenXian = 0;
    }
    return _cheShenHuaHenXian;
  
//    2k - 400
//    5k - 570
//    10k - 760
//    20k - 1140
}
-(void)resetAll{
    _cheXingString = @"";
    _diSanZheZeRenXianSelected = NO;
    _cheLiangSunShiXianSelected= NO;
    _quanCheDaoQiangXianSelected= NO;
    _boLiDanDuPoSuiXianSelected= NO;
    _ziRanShunShiXianSelected= NO;
    _buJiMianPeiTeYueXianSelected= NO;
    _wuGuoZeRenXianSelected= NO;
    _cheShangRenYuanZeRenXianSelected= NO;
    _cheShenHuaHenXianSelected= NO;
    _luoCheJiaGe = 0;
}
-(void)selectAllBaoxian{
    _diSanZheZeRenXianSelected = YES;
    _cheLiangSunShiXianSelected= YES;
    _quanCheDaoQiangXianSelected= YES;
    _boLiDanDuPoSuiXianSelected= YES;
    _ziRanShunShiXianSelected= YES;
    _buJiMianPeiTeYueXianSelected= YES;
    _wuGuoZeRenXianSelected= YES;
    _cheShangRenYuanZeRenXianSelected= YES;
    _cheShenHuaHenXianSelected= YES;
}
@end
