//
//  TJApplyListController.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/19.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TJApplyListCell"

class TJApplyListController: UITableViewController {

    @IBOutlet weak var headeView: UIView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var maintainBtn: UIButton!
    @IBOutlet weak var queryBtn: UIButton!
    
    var dataArray = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        requestData()
        creatView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
    }
    
     // MARK: InitData
    
    func initData() {
      
    }
    
    // MARK: RequestData
    
    func requestData() {
        
    }
    
    // MARK: Creat UI
    
    func creatView() {
        self.title = "维护事务申请"
        self.tableView.tableFooterView = UIView.init()
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        self.addBtn.layer.borderWidth = 1.0
        self.addBtn.layer.borderColor = UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0).cgColor
        
        self.maintainBtn.layer.borderWidth = 1;
        self.maintainBtn.layer.borderColor = UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0).cgColor
        self.maintainBtn.backgroundColor = UIColor.init(colorLiteralRed: 1.0/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0)
        self.maintainBtn .setTitleColor(UIColor.white, for: UIControlState.normal)
       
        self.queryBtn.layer.borderWidth = 1;
        self.queryBtn.layer.borderColor = UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0).cgColor

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 6
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as?TJApplyListCell

        cell?.titleLabel.text = "测试数据"

        return cell!
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    // MARK: PrviteMeth
    
   
    @IBAction func addBtnAction(_ sender: Any) {
    }
    @IBAction func maintainBtnAction(_ sender: Any) {
        
        self.maintainBtn.backgroundColor =  UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0)
        self.maintainBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        self.queryBtn.backgroundColor = UIColor.white
        self.queryBtn.setTitleColor(UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0), for:UIControlState.normal)
        
        self.title = "维护事务申请"
        self.navigationItem.rightBarButtonItem = nil
    }
    
   
    @IBAction func queryBtnAction(_ sender: Any) {
        
        self.queryBtn.backgroundColor =  UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0)
        self.queryBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        self.maintainBtn.backgroundColor = UIColor.white
        self.maintainBtn.setTitleColor(UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0), for:UIControlState.normal)
        
        self.title = "查询事务申请"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "筛选", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
    
}
