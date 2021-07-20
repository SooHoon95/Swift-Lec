//
//  ViewController.swift
//  Quiz2
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvResult: UITextView!
    @IBOutlet weak var tfInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvResult.isEditable = false
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnSend(_ sender: UIButton) {
        let input = tfInput.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if !input.isEmpty {
            tvResult.text.append(tfInput.text! + "\n")
        }else{
            let alert = UIAlertController(title: "텍스트를 입력하세요.", message: .none, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func btnEmoji(_ sender: UIButton) {
        tfInput.text?.append("😀")
    }
}// ViewController

