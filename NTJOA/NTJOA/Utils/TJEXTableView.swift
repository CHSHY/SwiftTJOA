//
//  TJEXTableView.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/26.
//  Copyright © 2017年 app. All rights reserved.
//

import Foundation

// MARK:- tableView的代理方法
// extension类似OC的category,也是只能扩充方法,不能扩充属性
extension  UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("点击了:\((indexPath as NSIndexPath).row)")
    }
}
