//
//  ListTableViewCell.swift
//  Hitowooboeruapuri
//
//  Created by nodoka on 2020/08/28.
//  Copyright © 2020 nodoka. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel:UILabel!
    @IBOutlet var kankeiLabel:UILabel!
    @IBOutlet var seibetuLabel:UILabel!
    @IBOutlet var faceImageview:UIImageView!
    @IBOutlet var eyeImageview:UIImageView!
    @IBOutlet var mouthImageview:UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
