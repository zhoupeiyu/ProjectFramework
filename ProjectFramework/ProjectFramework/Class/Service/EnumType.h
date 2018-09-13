
#pragma mark - 图片验证码类型

typedef enum : NSUInteger {
    ImageCodeTypeRegister, // 注册
    ImageCodeTypePwd, // 忘记密码
    ImageCodeTypeResetPhone // 绑定新手机
} ImageCodeType;

