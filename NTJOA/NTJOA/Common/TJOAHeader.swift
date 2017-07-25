//
//  TJOAHeader.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/20.
//  Copyright © 2017年 app. All rights reserved.
//


import Foundation
import UIKit

let Screen_Bounds:CGRect = UIScreen.main.bounds
let Screen_Width:CGFloat    = UIScreen.main.bounds.width
let Screen_Height:CGFloat   = UIScreen.main.bounds.height

func rgbColor(redFlot:Float,greenFloat:Float,blueFloat:Float) -> UIColor {
    
    return UIColor.init(colorLiteralRed: redFlot/255.0, green: greenFloat/255.0, blue: blueFloat/255.0, alpha: 1.0)
}

func showMsg(currentView:UIView){
    
    let hub = MBProgressHUD.showAdded(to: currentView, animated: true)
    hub.label.text = "正在加载....."
    hub.hide(animated: true, afterDelay: 1.5)
}

func msg(currentView:UIView,prompt:String){
    
    let hub = MBProgressHUD.showAdded(to: currentView, animated: true)
    hub.label.text = prompt
    hub.hide(animated: true, afterDelay: 1.5)
}


//MARK:接口数据

// 服务器地址
let  MAIN_URL: String = "http://192.168.0.192:80/oaapp/"
let  ATTACH_URL: String = "http://192.168.0.192:85/filesCommon/"

// 获取登录接口
let  LOGIN : String = "login.htm"


// 获取事务申请列表
let Get_ARRAIR_APPLY_LIST: String = "/affairApp/list.htm"

// 进入事物详情列表
let GET_ARRAIRINFO_LIST: String =  "/affairApp/enterView.htm"

// 新增事物申请接口
let ATTAIR_SAVE :String = "/affairApp/save.htm"

// 事物申请列表删除接口
let DELETE_ATTAIR_LIST :String = "/affairApp/delete.htm"

// 修改事物申请列表接口
let MODIFY_ATTAIR_LIST :String = "/affairApp/update.htm"

// 获取申请事项列表接口
let APPLY_MATTER_LIST :String = "/affairApp/getAffairMode.htm"

// 事物申请上传图片接口
let UPLOAD_MATTER_PHOTO :String = "/affairApp/uploadFile.htm"

// 删除事物申请上传图片接口
let DELETE_MATTER_PHOTO :String = "/affairApp/deleteFile.htm"
