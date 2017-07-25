//
//  TJApplyListModel.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/25.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit

class TJApplyListModel: NSObject {

    var appDate = String()//申请日期
    var title = String()//标题
    var auditStateName = String()//审批状态
    
    let identifier = NSNumber()//申请记录id
    let parentId = NSNumber()//审批记录ID
}
