//
//  ViewController.swift
//  Quiz03
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var tfAddResult: UITextField!
    @IBOutlet weak var tfMinResult: UITextField!
    @IBOutlet weak var tfMulResult: UITextField!
    @IBOutlet weak var tfShareResult: UITextField!
    @IBOutlet weak var tfRemainderResult: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "환영합니다!"
        
        
    }//viewDidLoad
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    @IBAction func CalculateAction(_ sender: UIButton) {
        if tfNum1.text?.count == 0 || tfNum2.text?.count == 0{
            
            let alert = UIAlertController(title: "숫자를 입력하세요", message: .none, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            lblMessage.text = ("숫자를 입력해주세요")
        } else {
            let firstNumber = Int(tfNum1.text!)
            let secondNumber = Int(tfNum2.text!)
            
            tfAddResult.text = "\(firstNumber! + secondNumber!)"
            tfMinResult.text = String(firstNumber! - secondNumber!)
            tfMulResult.text = String(firstNumber! * secondNumber!)
            tfShareResult.text = String(firstNumber! / secondNumber!)
            tfRemainderResult.text = "\(firstNumber! % secondNumber!)"
        }
    
    
    }//btnCalculate
    

}//viewController

