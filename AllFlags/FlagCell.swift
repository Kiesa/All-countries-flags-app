//
//  FlagCell.swift
//  AllFlags
//
//  Created by mac os on 18.06.16.
//  Copyright © 2016 Khrystenko Dmytro. All rights reserved.
//

import UIKit

class FlagCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var flag: Flag!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    
    
    func configureCell(flag: Flag) {
        
        self.flag = flag
        
        nameLbl.text = self.flag.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.flag.flagsId)")
    }
    
}
