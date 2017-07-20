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
    hub.label.text = "正在加载"
    hub.hide(animated: true, afterDelay: 1.5)
}

