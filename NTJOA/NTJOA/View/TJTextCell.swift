//
//  TJTextCell.swift
//  NTJOA
//
//  Created by chenchuang on 17/7/27.
//  Copyright © 2017年 app. All rights reserved.
//

import UIKit

class TJTextCell: UITableViewCell {

    @IBOutlet weak var tetxTitle: UITextField!
    @IBOutlet weak var textView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
