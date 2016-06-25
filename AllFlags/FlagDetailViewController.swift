//
//  FlagDetailViewController.swift
//  AllFlags
//
//  Created by mac os on 19.06.16.
//  Copyright © 2016 Khrystenko Dmytro. All rights reserved.
//

import UIKit

class FlagDetailViewController: UIViewController {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var aboutText: UITextView!
    
    
    var flag: Flag!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = flag.name.capitalizedString
        aboutText.text = flag.aboutTxt
        mainImg.image = UIImage(named: "\(flag.flagsId)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    @IBAction func backBtn(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
