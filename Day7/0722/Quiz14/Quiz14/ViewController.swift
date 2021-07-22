//
//  ViewController.swift
//  Quiz14
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnGoButtonImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func btnGoTimerImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 2
    }
    
    @IBAction func btnGoPageImage(_ sender: UIButton) {
        tabBarController?.selectedIndex = 3
    }
}

