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
    var pageNumber = NSInteger()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        creatView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = true
        self.tableView.mj_header .beginRefreshing()
    }
    
     // MARK: InitData
    
    func initData() {
        
        let header = MJRefreshNormalHeader()
        let footer = MJRefreshAutoNormalFooter()
        header.setRefreshingTarget(self, refreshingAction: #selector(TJApplyListController.headerRefreshAction))
        self.tableView.mj_header = header
        footer.setRefreshingTarget(self, refreshingAction: #selector(TJApplyListController.footRefreshAction))
        self.tableView.mj_footer = footer
    }
    
    //下拉加载
    func headerRefreshAction() {
        
        self.pageNumber = 1
        self.dataArray .removeAllObjects()
        self.requestData()
        
    }
    //上拉加载更多
    func footRefreshAction() {
        
        self.pageNumber+=1
        self.requestData()
    }
    
    // MARK: RequestData
    
    func requestData() {
        
        TJHTTPRequestManger.sharedInstance().Request(methodType: RequestType(rawValue: 1)!,
                                                     urlString: Get_ARRAIR_APPLY_LIST,
                                                     parameters: getParameters(),
                                                     success: { (data) in
                                                        
                                                        self.tableView.mj_header .endRefreshing()
                                                        self.tableView.mj_footer.endRefreshing()
                                                        
                                                        var array = NSArray()
                                                        array = data["dataList"] as! NSArray
                                                        
                                                        if array.count > 0{
                                                            let modelArray = TJApplyListModel.mj_objectArray(withKeyValuesArray: array)
                                                            
                                                            for subModel in modelArray!{
                                                                self.dataArray .addObjects(from: [subModel])
                                                            }
                                                        }
                                                        
                                                        if array.count == 0{
                                                            
                                                            if self.pageNumber == 1{
                                                                msg(currentView: self.view,prompt:"还没有数据哦!")
                                                            }
                                                            else{
                                                                
                                                                msg(currentView: self.view,prompt:"没有更多数据哦!")
                                                            }
                                                        }
                                                        self.tableView.reloadData()
                                 
                                                        
        }) { (error) in
            
            self.tableView.mj_header .endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            msg(currentView: self.view,prompt:"请求失败哦~")
            return
        }
    }
    
    // MARK: Creat UI
    
    func creatView() {
        self.title = "维护事务申请"
        self.tableView.tableFooterView = UIView.init()
        
    
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        
        self.addBtn.layer.borderWidth = 1.0
        self.addBtn.layer.borderColor = UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0).cgColor
        
        self.maintainBtn.backgroundColor = rgbColor(redFlot: 1, greenFloat: 192, blueFloat: 152)
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
        return self.dataArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as?TJApplyListCell

        let listModel = self.dataArray[indexPath.row] as! TJApplyListModel
        
        cell?.titleLabel.text = listModel.title
        cell?.dataLabel.text = listModel.appDate
        
        
        if self.title == "查询事务申请"
        {
            cell?.statuLabel.text = listModel.auditStateName
            if listModel.auditStateName == "审批中" {
                cell?.statuLabel.textColor = rgbColor(redFlot: 204, greenFloat: 204, blueFloat: 204)
            
            }else if listModel.auditStateName == "审批通过"
            {
                cell?.statuLabel.textColor = rgbColor(redFlot: 26, greenFloat: 188, blueFloat:156)
            }
            else if listModel.auditStateName == "审批未通过"
            {
                 cell?.statuLabel.textColor = rgbColor(redFlot: 242, greenFloat: 147, blueFloat: 147)
            }
        }

        return cell!
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
        self.tableView.mj_header .beginRefreshing()
    }
    
   
    @IBAction func queryBtnAction(_ sender: Any) {
        
        self.queryBtn.backgroundColor =  UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0)
        self.queryBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
        
        self.maintainBtn.backgroundColor = UIColor.white
        self.maintainBtn.setTitleColor(UIColor.init(colorLiteralRed: 1/255.0, green: 192/255.0,blue: 152/255.0, alpha: 1.0), for:UIControlState.normal)
        
        self.title = "查询事务申请"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "筛选", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.tableView.mj_header .beginRefreshing()
    }
    
    func getParameters() ->NSMutableDictionary {
        let parameters  = NSMutableDictionary()
        
        if self.title == "维护事务申请" {
            parameters .setObject("0", forKey: "auditStates" as NSCopying)
            
        }else{
        
           parameters .setObject("1", forKey: "auditStates" as NSCopying)
        }
         parameters .setObject(self.pageNumber, forKey: "pageNum" as NSCopying)
         parameters .setObject(20, forKey: "pageSize" as NSCopying)
        return parameters
        
    }
}
