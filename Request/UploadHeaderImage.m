//
//  UploadHeaderImage.m
//  12123
//
//  Created by 刘伟 on 2016/10/27.
//  Copyright © 2016年 江苏十分便民. All rights reserved.
//

#import "UploadHeaderImage.h"
#import "NSString+Base64.h"
//图片的高度，宽度都一样
#define  ImageHeight 160
@interface UploadHeaderImage()<UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property(nonatomic,strong)UIImage*selectedImage;
@property(nonatomic,strong)MBProgressHUD *hud;
@property(nonatomic,copy)UploadHeaderImageSuccessBlock successBlock;
@property(nonatomic,strong)id parameters;
@property(nonatomic,copy)NSString *url;
@end
@implementation UploadHeaderImage
+(instancetype)shareInstanceWithSuccessBlock:(UploadHeaderImageSuccessBlock)uploadSuccess{
   static UploadHeaderImage*instance;
   static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [[[self class]alloc]init];
    });
    if ( instance.successBlock != uploadSuccess) {
        instance.successBlock = uploadSuccess;

    }
   
    [instance clickHeadPortrait];
    return instance;
}
- (void)clickHeadPortrait
{
    UIActionSheet*actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拍照" otherButtonTitles:@"从相册中选取", nil];
    [actionSheet showInView:[Tool currentViewController].view];
    
    
}

//选择相机还是相册
-(void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex==0) {
        [self cameraClicked];
    }else if (buttonIndex==1){
        [self photoLibraryClicked];
    }
}

-(void)cameraClicked
{
    //     _view.hidden = YES;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [self loadImagePickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }else{
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"" message:@"相机无法使用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}
-(void)photoLibraryClicked
{
    //     _view.hidden = YES;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        [self loadImagePickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }else{
        UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"" message:@"相册库无法使用" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
}


//调用相机和相册库资源
- (void)loadImagePickerWithSourceType:(UIImagePickerControllerSourceType)type
{
    //UIImagePickerController 系统封装好的加载相机、相册库资源的类
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //加载不同的资源
    picker.sourceType =type;
    
    //是否允许picker对图片资源进行优化
    picker.allowsEditing = YES;
    picker.delegate = self;
    //软件中习惯通过present的方式，呈现相册库
    //    if([[[UIDevice
    //          currentDevice] systemVersion] floatValue]>=8.0) {
    //
    //        self.modalPresentationStyle=UIModalPresentationOverCurrentContext;
    //
    //    }
    if (type == UIImagePickerControllerSourceTypeCamera) {
        [self performSelector:@selector(showcamera) withObject:nil afterDelay:0.3];
        
    }else{
        [[Tool currentViewController] presentViewController:picker animated:YES completion:^{
        }];
    }
}
-(void)showcamera
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //加载不同的资源
    picker.sourceType =UIImagePickerControllerSourceTypeCamera;
    
    //是否允许picker对图片资源进行优化
    picker.allowsEditing = YES;
    picker.delegate = self;
    
    [[Tool currentViewController] presentViewController:picker animated:YES completion:^{
    }];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    //得到选中的图片
    
    
    
    
    
    UIImage* image = [self cutImageWithInfo:info];
    CGFloat imgHeight = image.size.height;
    _selectedImage = image;
    image =  [self scaleImage:image toScale:ImageHeight*1.0/imgHeight ];
    
    //        [self.headPortrait setImage:image forState:UIControlStateNormal];
    //
    //        [NSMutableDictionary dictionary];
    //        [mutableHeaders setValue:[NSString stringWithFormat:@"form-data; name=\"%@\"; filename=\"%@\"", name, fileName] forKey:@"Content-Disposition"];
    //        [mutableHeaders setValue:mimeType forKey:@"Content-Type"];
    //        NSString*name = @"head";
    //        NSString*fileName = @"upload";
    //       //_uploadViewModel.request.httpHeaderFields = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"form-data; name=\"%@\"; filename=\"%@\"", name, fileName],@"Content-Disposition", nil];
    //        _uploadViewModel.request.requestFiles = [NSDictionary dictionaryWithObjectsAndKeys:@"image/png",@"Content-Type",name,@"name" ,imageData,@"upload",nil];
    //_uploadViewModel.request.startRequest = YES;
    [self uploadImage:image ] ;
    //        [RACObserve(self.uploadViewModel.request, state)
    //        subscribeNext:^(id x) {
    //
    //        }];
    //        [[GCDQueue globalQueue] queueBlock:^{
    //            [imageData writeToFile:path atomically:YES];
    //
    //        }];
    
    //如果传进来的照片是相机拍摄的，就存储到相册里面
    //        if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    //        {
    //            UIAlertView*alert = [[UIAlertView alloc]initWithTitle:@"" message:@"是否保存" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"取消", nil];
    //            [alert show];
    //        }
    
    //
    [[Tool currentViewController] dismissViewControllerAnimated:YES completion:^{
        
    }];
    
    
}
-(UIImage*)cutImageWithInfo:(NSDictionary*)info{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    CGFloat imgHeight = image.size.height;
    CGFloat imgWidth = image.size.width;
    
    
    _selectedImage = image;
    //开启一个图形上下文
    UIGraphicsBeginImageContext(CGSizeMake(imgWidth, imgHeight));
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, imgWidth, imgHeight)];
    //将路径设置为裁剪
    [path addClip];
    //绘制图片
    [image drawAtPoint:CGPointMake(0, 0)];
    //得到新图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    //  关闭上下文
    UIGraphicsEndImageContext();
    return newImg;
}
-(void)uploadImage:(UIImage*)image{
    NSData*imageData;
    BOOL isjpg = NO;
    if (UIImagePNGRepresentation(image)==nil)
    {
        imageData = UIImageJPEGRepresentation(image, 1);
        
        isjpg = YES;
    }
    else
    {
        imageData = UIImagePNGRepresentation(image);
        
        isjpg = NO;
        
    }
//   NSString*str = [imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
   
   NSString*str = [NSString base64StringFromData:imageData length:imageData.length];
    if (self.successBlock) {
        self.successBlock(image,str);
    }
    return;
//    NSString*url =[NSString stringWithFormat:@"http://%@%@",  Host,@"/User/UploadAvatar"];
//    //  NSDictionary*  requestParams = [NSDictionary dictionaryWithObjectsAndKeys:@"3",@"merchantID",@"1464340403",@"requestTime",@"d0633cd5108ddaaab1be12a0660ec3c9",@"sign",@"2",@"userID",@"1.0.1",@"version",nil];
//    
//    NSString *requestTime =[NSString stringWithFormat:@"%ld", (long)[[NSDate new] timeIntervalSince1970]];
//    NSString *userID = [UserModel shareInstance].userId;
//    NSMutableDictionary *requestDic = [NSMutableDictionary dictionary];
//    [requestDic setObject:@"" forKey:@"version"];
//    [requestDic setObject:requestTime forKey:@"requestTime"];
//    //    [requestDic setObject:merchantID forKey:@"merchantID"];
//    [requestDic setObject:userID forKey:@"userID"];
//    
//    //    [requestDic removeObjectForKey:@"sign"];
//    NSMutableArray*keyArray = [[NSMutableArray alloc]initWithArray:[requestDic allKeys]];
//    NSArray*newKeyArray = [keyArray sortedArrayUsingComparator:^NSComparisonResult(NSString* _Nonnull obj1, NSString*  _Nonnull obj2) {
//        return [obj1 compare:obj2];
//    }];
//    NSString*sign=@"";
//    for (NSInteger i = 0; i<newKeyArray.count; i++) {
//        NSString*s=@"";
//        if (i!=0) {
//            s=@"&";
//        }
//        
//        sign = [sign stringByAppendingFormat:@"%@%@=%@",s,newKeyArray[i],requestDic[newKeyArray[i]]];
//    }
//    //    sign = [sign stringByAppendingFormat:@"&%@",airplaneKey];
//    NSLog(@"sign---%@      md5sign_____%@",sign,[Tool md5:sign]);
//    [requestDic setObject:[Tool md5:sign] forKey:@"sign"];
//    //equestParams:
//    //    {
//    //        merchantID = 3;
//    //        requestTime = 1464340403;
//    //        sign = d0633cd5108ddaaab1be12a0660ec3c9;
//    //        userID = 2;
//    //        version = "1.0.1";
//    //    }
//    //    Printing description of msg->_userID:
//    //    2
//    //    Printing description of msg->_url:
//    //http://test.tmcapi.qumaipiao.com/User/UploadAvatar
    
    AFHTTPSessionManager*manager = [AFHTTPSessionManager manager];
    
    // manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain",@"application/json", nil];
    [[LoadingView shareInstance]show];
    [manager POST:self.url parameters:self.parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        if (!isjpg) {
            fileName = [NSString stringWithFormat:@"%@.png", str];
        }
        
        
        [formData appendPartWithFileData:imageData name:@"upload" fileName:fileName mimeType:@"image/png"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [[LoadingView shareInstance] dismiss];
//        [UserModel shareInstance].headimg = responseObject[@"data"][@"avatarUrl"];
//        [[UserModel shareInstance] updateToUserdefault];
        if (self.successBlock) {
            self.successBlock(image,responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [[LoadingView shareInstance] dismiss];
    }];
    
    //    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://www.freeimagehosting.net/upload.php"]];
    //    [request addValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
    //    [request addValue:@"text/html" forHTTPHeaderField:@"Accept"];
    //    [request setHTTPMethod:@"POST"];
    //    [request setCachePolicy:NSURLRequestReloadIgnoringCacheData];
    //    [request setTimeoutInterval:20];
    //    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //    NSURLSession* session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    //
    //    NSURLSessionUploadTask * uploadtask = [session uploadTaskWithRequest:request fromData:imageData completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    //
    //    }];
    //    [uploadtask resume];
    
}
-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0)
        UIImageWriteToSavedPhotosAlbum(_selectedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

//保存成功调用的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    _hud = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark@2x.png"]];
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.labelText = @"保存成功";
    [_hud hide:YES afterDelay:2];
    //
    
}

@end
