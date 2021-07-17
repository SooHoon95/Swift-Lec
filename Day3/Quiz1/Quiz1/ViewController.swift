//
//  ViewController.swift
//  Quiz1
//
//  Created by 최수훈 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "짝수덧셈"
        
    }//viewDidLoad
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnCal(_ sender: UIButton) {
        print("Test")
        guard let num1: Int = Int(tfNum1.text!) else { lblMessage.text = "숫자를 입력해주세요 !"; return }
        guard let num2: Int = Int(tfNum2.text!) else { lblMessage.text = "값을 모두 채워주세요!"; return }
        
        if num1 % 2 == 0, num2 % 2 == 0{
            tfResult.text = String(num1 + num2)
            lblMessage.text = "계산이 완료되었습니다!"
        }else {
            tfResult.text = ""
            lblMessage.text = "짝수만 계산 가능합니다."
        }
    
        
//        let num1: Int = Int(tfNum1.text!) ?? 0
//        let num2: Int = Int(tfNum2.text!) ?? 0
//
//        // 빈값 체크
//        let numCheck = checkNil(str: tfNum1.text, str2: tfNum2.text)
//        if numCheck == 1{
//            if num1 % 2 == 0, num2 % 2 == 0{
//                tfResult.text = String(num1 + num2)
//                lblMessage.text = "계산이 완료되었습니다!"
//            }else {
//                tfResult.text = ""
//                lblMessage.text = "짝수만 계산 가능합니다."
//            }
//        }else {
//            lblMessage.text = "숫자를 입력해주세요!"
//        }
//
        self.view.endEditing(true)
//
    }//btnCal
    
    
    func checkNil(str: String!, str2: String!) -> Int{
        
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines)
        let check2 = str2.trimmingCharacters(in: .whitespacesAndNewlines)
        if check.isEmpty == false && check2.isEmpty == false {
            return 1
        }else {
            return 0
        }
    }
    
    
}//ViewController


