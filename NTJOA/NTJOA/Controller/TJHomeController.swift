//
//  TJHomeController.swift
//  CHTJOA
//
//  Created by chenchuang on 17/7/18.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Home_Cell"

class TJHomeController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "首页"
        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        self.navigationController?.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        requestData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: RequestData
    
    func requestData() {
        
        let parameters  = NSMutableDictionary()
    
        parameters .setObject("99999", forKey: "userNo" as NSCopying)
        parameters .setObject("Tyc120613", forKey: "password" as NSCopying)
        parameters .setObject("0", forKey: "phoneType" as NSCopying)
        parameters .setObject("cc71605a663575cb55ca62dd9dda027c", forKey: "cId" as NSCopying)
        parameters .setObject("1f390c2bf552bb9db1715f8472aa57584d88e81ed60c0f9700e04ea6a67fb07e", forKey: "deviceToken" as NSCopying)
        parameters .setObject("666666", forKey: "validateCode" as NSCopying)

        
        TJHTTPRequestManger.sharedInstance().Request(methodType: RequestType(rawValue: 1)!,
                                                     urlString:  LOGIN,
                                                     parameters: parameters,
                                                     success: { (data) in
                                                        
                                
                                                       msg(currentView: self.view,prompt:"登陆成功!")
                                                        
                                                        
        }) { (error) in
            
           msg(currentView: self.view,prompt:"登陆失败!")
            return
        }
    }

    //MARK:Creat UI
    func configureLayout() {
        //let layout = self.collectionViewLayout
        
        
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TJHomeCell
    
        // Configure the cell
        
        cell.name.text = "事务申请"
        cell.image.image = UIImage(named: "SWSQ") //UIImage(name:"SWSQ")
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    

    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        let main = UIStoryboard(name: "Main", bundle: Bundle.main)
        let applyVc = main.instantiateViewController(withIdentifier:"TJApplyListController")
        self.navigationController?.pushViewController(applyVc, animated: true)
        
        return true
    }
    
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }

}
