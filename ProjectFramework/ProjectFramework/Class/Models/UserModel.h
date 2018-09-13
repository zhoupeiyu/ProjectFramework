//
//  UserModel.h
//  ProjectFramework
//
//  Created by 周培玉 on 2018/9/12.
//  Copyright © 2018年 周培玉. All rights reserved.
//

#import "BaseModel.h"

#pragma mark -  图片验证码

@interface ImageCode : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *code;

@end

@interface GetUserImageCodeModel : BaseModel

@property (nonatomic, strong) ImageCode *data;

@end

#pragma mark - 用户注册

@interface UserAuthCompanyAudit  : NSObject
//审核编号
@property (nonatomic, strong) NSString *id;
//认证类型：1-实名审核 2-企业认证
@property (nonatomic, strong) NSNumber *auditType;
// 审核结果：1-通过 2-拒绝
@property (nonatomic, strong) NSNumber *auditRes;
//审核结果说明
@property (nonatomic, strong) NSString *auditRemark;
//公司名称
@property (nonatomic, strong) NSString *data1;
//所属部门
@property (nonatomic, strong) NSString *data2;
// 职务名称
@property (nonatomic, strong) NSString *data3;
//工作证图片URL
@property (nonatomic, strong) NSString *data4;

@end

@interface UserAuthNameAudit  : NSObject
//审核编号
@property (nonatomic, strong) NSString *id;
//认证类型：1-实名审核 2-企业认证
@property (nonatomic, strong) NSNumber *auditType;
//审核结果：1-通过 2-拒绝
@property (nonatomic, strong) NSNumber *auditRes;
//审核结果说明
@property (nonatomic, strong) NSString *auditRemark;
//身份证正面照URL
@property (nonatomic, strong) NSString *data1;
//身份证反面照URL
@property (nonatomic, strong) NSString *data2;
//手持身份证正面照URL
@property (nonatomic, strong) NSString *data3;
//手持身份证反面照URL
@property (nonatomic, strong) NSString *data4;

@end


@interface UserInfoModel : BaseModel
// 用户id
@property (nonatomic, strong) NSNumber *id;
//登陆账号
@property (nonatomic, strong) NSString *loginId;
//用户昵称
@property (nonatomic, strong) NSString *nickName;
//手机号
@property (nonatomic, strong) NSString *phone;
//用户头像URL
@property (nonatomic, strong) NSString *headImgUrl;
//用户掮客号
@property (nonatomic, strong) NSNumber *myId;
//用户性别：1：男；2：女；
@property (nonatomic, strong) NSNumber *sex;
// 用户简介
@property (nonatomic, strong) NSString *profile;
//真实姓名
@property (nonatomic, strong) NSString *realName;
//身份证号码
@property (nonatomic, strong) NSString *idCard;
//身份证正面照URL
@property (nonatomic, strong) NSString *idCardImg1;
//身份证反面照URL
@property (nonatomic, strong) NSString *idCardImg2;
//手持身份证正面照URL
@property (nonatomic, strong) NSString *idCardImg3;
//手持身份证反面照URL
@property (nonatomic, strong) NSString *idCardImg4;
//公司名称
@property (nonatomic, strong) NSString *companyName;
//所属部门
@property (nonatomic, strong) NSString *deptName;
//职务名称
@property (nonatomic, strong) NSString *roleName;
//工作证图片URL
@property (nonatomic, strong) NSString *workCardUrl;
// 电子邮箱
@property (nonatomic, strong) NSString *email;
//所在省份
@property (nonatomic, strong) NSString *province;
//所在城市
@property (nonatomic, strong) NSString *city;
//详细地址
@property (nonatomic, strong) NSString *detailAddress;
//实名认证状态：-1：未认证；0:资料已提交待审核；1：已认证；2认证失败
@property (nonatomic, strong) NSString *authName;
//企业认证状态：-1：未认证；0:资料已提交待审核；1：已认证；2认证失败
@property (nonatomic, strong) NSString *authCompany;
@property (nonatomic, strong) UserAuthNameAudit *authNameAudit;
@property (nonatomic, strong) UserAuthCompanyAudit *authCompanyAudit;

@end

@interface UserModel : BaseModel

@property (nonatomic, strong) UserInfoModel *data;

@end
