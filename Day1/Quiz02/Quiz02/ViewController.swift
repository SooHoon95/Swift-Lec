//
//  ViewController.swift
//  Quiz02
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {
    
    var count: Int = 1
    @IBOutlet weak var lblText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDid
    @IBAction func btnName(_ sender: Any) {
        if (count % 2) == 1{
            lblText.text = "Welcome!"
            count += 1
        }else{
            lblText.text?.append("최수훈")
            count += 1
        }
    }//btnName
    
    
}//ViewController

