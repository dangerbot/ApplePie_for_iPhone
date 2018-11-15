//
//  ViewController.swift
//  ApplePie_for_iPhone
//
//  Created by Steve on 11/14/18.
//  Copyright © 2018 SteveAndTheDogs. All rights reserved.
//

import UIKit
import os.log


class ViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var gameWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        os_log("ViewController. viewDidLoad()", log: OSLog.default, type: .info)
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func letterButtonPressedAction(_ sender: UIButton) {
        os_log("ViewController. letterButtonPressedAction()", log: OSLog.default, type: .info)
        print(sender.isEnabled)
        print(sender.title(for: .normal)!)
    }
    
    

}

