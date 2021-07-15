//
//  ViewController.swift
//  Quiz2
//
//  Created by 최수훈 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfFirstNum: UITextField!
    @IBOutlet weak var tfSecondNum: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = "합계를 구하기 위한 숫자를 입력하세요!"
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func btnCal(_ sender: UIButton) {
    
        let numCheck1 = checkNil(str: tfFirstNum.text!)
        let numCheck2 = checkNil(str: tfSecondNum.text!)
        
        if numCheck1 == 0 {
            lblResult.text = "시작 숫자를 입력하세요!"
            tfFirstNum.becomeFirstResponder()
        }else if numCheck2 == 0 {
            lblResult.text = "끝 숫자를 입력하세요!"
            tfSecondNum.becomeFirstResponder()
        }else{
            if Int(tfFirstNum.text!)! >= Int(tfSecondNum.text!)!{
                lblResult.text = "시작숫자가 반드시 끝 숫자보다 작아야 합니다."
                self.view.endEditing(true)
            }else{
                
                let result: Int = calculate(str: tfFirstNum.text, str2: tfSecondNum.text)
                lblResult.text = "입력하신 숫자의 범위 합계는 \(result) 입니다."
                self.view.endEditing(true)
            }
        }
        
    }//btnCal
    
    //null값 체크
    func checkNil(str: String!) -> Int{
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines) // 트리밍
        if check.isEmpty == true{
            return 0
        }else{
            return 1
        }
    }
    
    func calculate(str: String!, str2: String!) ->Int{
        var sum: Int = 0
        for i in Int(str!)!...Int(str2!)!{
            sum += i
        }
        return sum
    }
    
}

