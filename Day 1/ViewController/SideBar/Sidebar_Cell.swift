//
//  Sidebar_Cell.swift
//  Day 1
//
//  Created by Captain on 25/07/20.
//  Copyright © 2020 Captain. All rights reserved.
//

import UIKit

class Sidebar_Cell: UITableViewCell
{
    @IBOutlet var lbl_Menuname: UILabel!
    @IBOutlet var img_profile: UIImageView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
