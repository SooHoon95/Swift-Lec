//
//  ViewController.swift
//  ButtonName2
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSmile: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidLoad

    @IBAction func btnSmile(_ sender: UIButton) {
        lblSmile.text?.append("😄")
    }//btnSmile
    
}//ViewController

