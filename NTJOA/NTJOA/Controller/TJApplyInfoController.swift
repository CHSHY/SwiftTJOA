//
//  TJApplyInfoController.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/26.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit

private let detailIdentifier     = "TJApplyDetailCell"
private let textIdentifier       = "TJTextCell"

class TJApplyInfoController: UITableViewController {

    var statusStr = String()
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var approvalBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = statusStr
    
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section==0 {
            return 9
        }
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //var cell = UITableViewCell()
        if indexPath.section == 0 {
            
            let baseCell = tableView.dequeueReusableCell(withIdentifier: detailIdentifier, for: indexPath) as?TJApplyDetailCell
           
          
            return baseCell!

        }else{
        
            let infoCell = tableView.dequeueReusableCell(withIdentifier: textIdentifier, for: indexPath) as?TJTextCell
            
            
            return infoCell!

        }

        //return cell
    }
    
    @IBAction func approvalBtnAction(_ sender: Any) {
        
    }
    
    @IBOutlet weak var deleteBtnAction: UIButton!
}
