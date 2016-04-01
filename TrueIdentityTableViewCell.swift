//
//  TrueIdentityTableViewCell.swift
//  SimpleHeroTable
//
//  Created by sojiwritescode on 3/30/16.
//  Copyright © 2016 sojiwritescode. All rights reserved.
//

import UIKit

class TrueIdentityTableViewCell:  UITableViewCell {
    
    @IBOutlet weak var realNameLabel: UILabel!
    @IBOutlet weak var realPic: UIImageView!
    
    var realName: String = "" {
        willSet(realName) {
            realNameLabel.text = realName
        }
    }
    
    var realPicName: String = "" {
        willSet(realPicName) {
            realPic.image = UIImage(named: realPicName)
        }
    }
    
}
