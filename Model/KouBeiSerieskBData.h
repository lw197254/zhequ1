//
//  KouBeiSerieskBData.h
//  chechengwang
//
//  Created by 严琪 on 2017/10/20.
//  Copyright © 2017年 车城网. All rights reserved.
//

#import "FatherModel.h"
#import "KouBeiSerieskBBaseData.h"
@protocol KouBeiSerieskBData
@end
@interface KouBeiSerieskBData : FatherModel
@property(nonatomic,copy) KouBeiSerieskBBaseData *kb_ck;
@property(nonatomic,copy) KouBeiSerieskBBaseData *kb_kj;
@property(nonatomic,copy) KouBeiSerieskBBaseData *kb_dl;
@property(nonatomic,copy) KouBeiSerieskBBaseData *kb_wg;
@property(nonatomic,copy) KouBeiSerieskBBaseData *kb_ssx;
@property(nonatomic,copy) KouBeiSerieskBBaseData *kb_xjb;
@end
