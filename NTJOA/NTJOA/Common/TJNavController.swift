//
//  TJNavController.swift
//  CHTJOA
//
//  Created by chenchuang on 17/7/18.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit

class TJNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.setBackgroundImage(UIImage(named: "top_background"), for:UIBarMetrics.default)
        
        self.navigationBar.barTintColor = UIColor.white
        self.navigationBar.tintColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
