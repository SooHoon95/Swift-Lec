//
//  ViewController.swift
//  Quiz1
//
//  Created by 최수훈 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "숫자를 입력하세요 !"
        tfInput.textAlignment = .right
        tfInput.placeholder = "숫자를 입력해주세요"
        
    }//ViewDidLoad

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnIdentify(_ sender: Any) {
   
        /*
        //강사님 버전.01
        var messag: String

        let checkNumber = Int(tfInput.text!) ?? 0
        if checkNumber % 2 == 0 {
            message = "짝수"
        }else {
            messag = "홀수"
        }
        lblMessage = "입력하신 숫자는 \(messag) 입니다."
        */
         
//        //optional Unwrapping
//        guard let inputNum = tfInput.text else { return }
//
//        let intNum = Int(inputNum)!
//
//        if inputNum.isEmpty == true {
//
//            let alert = UIAlertController(title: "숫자를 입력하세요.", message: .none, preferredStyle: .actionSheet)
//            let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
//
//            alert.addAction(cancel)
//            tfInput.becomeFirstResponder() // 커서 이동
//
//        } else {
//           identify(intNum)
//        }
//        self.view.endEditing(true)
        //강사님 버전.02
        let numCheck = checkNil(str: tfInput.text)
        if numCheck == 1 {
        let returnValue = numberDecision(str: tfInput.text!)
        lblMessage.text = "입력하신 숫자는 \(returnValue) 입니다"
        }else{
        lblMessage.text = "숫자를 확인하세요!"
        }
        

    }//btnIdentify
    
    //판별 함수
//    func identify(_ inputValue: Int){
//        if inputValue % 2 == 0 {
//            lblMessage.text = "입력하신 \(inputValue)은 짝수 입니다."
//        } else {
//            lblMessage.text = "입력하신 \(inputValue)은 홀수 입니다."
//        }
//    }// identify
    
    
    
    
    func checkNil(str: String!) -> Int{ // 리턴타입은 -> 이걸로 지정해준다.
        let check = str.trimmingCharacters(in: .whitespacesAndNewlines) //반드시 써야한다. 트리밍.
        if check.isEmpty{
            return 0
        }else{
            return 1
        }
    }
    
    func numberDecision(str: String!) -> String{
        if Int(str)! % 2  == 0 {
            return "짝수"
        }else{
            return "홀수"
        }
    }
    
}//ViewController

