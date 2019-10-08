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
            self.lblTitle.text = post?.title
            self.lblCreatedDate.text = post?.createdAt
            self.switchActivate.isOn = post?.isActivated ?? false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    

}
