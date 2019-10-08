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

    var post: Post? {
        didSet {
            self.lblTitle.text = post?.title
            self.lblCreatedDate.text = formattedDateFromString(dateString: post?.createdAt ?? "")
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
    
    func formattedDateFromString(dateString: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        
        if let date = dateFormatter.date(from: dateString) {
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

            return dateFormatter.string(from: date)
        }
        
        return nil
    }


}
