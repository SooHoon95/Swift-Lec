//
//  ViewController.swift
//  Quiz01
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    //label정리
    @IBOutlet weak var lblWelcome: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidLoad


    @IBAction func btnName(_ sender: UIButton) {
        lblWelcome.text?.append("최수훈")
        
    }//btnName
    

}//ViewController

