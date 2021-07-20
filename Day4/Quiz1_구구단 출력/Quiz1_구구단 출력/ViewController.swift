//
//  ViewController.swift
//  Quiz1_구구단 출력
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnAppend(_ sender: UIButton) {
        let strInput  = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !strInput.isEmpty {
            for i in 1...9{
                tvResult.text.append("\(tfInput.text!) X  \(i) =    \(String.init(((Int(tfInput.text!)! * i))))" + "\n")
            }
        }else {
            for i in 1...9{
                tvResult.text.append("\(2) X \(i) = \((2 * i)) \n")
            }
        }
    }
    

}

