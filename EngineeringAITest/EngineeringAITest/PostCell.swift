//
//  PostCell.swift
//  EngineeringAITest
//
//  Created by PCQ185 on 08/10/19.
//  Copyright © 2019 Tatvasoft. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle       : UILabel!
    @IBOutlet weak var lblCreatedDate : UILabel!
    @IBOutlet weak var switchActivate : UISwitch!

    var post: Post? {
        didSet {
            self.lblPostName.text = postListModel?.title
            self.lblCreatedDate.text = postListModel?.createdAt
            self.switchAtivate.isOn = postListModel?.isActivated ?? false
        }
    }

}
