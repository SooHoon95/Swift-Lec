//
//  ViewController.swift
//  MuktiLine
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var tvResult: UITextView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvResult.isEditable = false // Read Only
    }

    @IBAction func btnAppend(_ sender: UIButton) {
        let strInput = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !strInput.isEmpty {
            tvResult.text.append(tfInput.text! + "\n")
        }
    }
    
} // ViewController

