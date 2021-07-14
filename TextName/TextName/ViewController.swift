//
//  ViewController.swift
//  TextName
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var tfName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = " 환영합니다"
    }

    
    @IBAction func btnSend(_ sender: UIButton) {
//        let resultSet: String = tfName.text!
//        lblResult.text?.append(resultSet)
        if tfName.text?.isEmpty == true{
            lblMessage.text = "텍스트를 입력하세요!"
//        }
//        if tfName.text?.count == 0 {
//            lblMessage.text = "텍스트를 입력하세요!"
        }else{
            lblResult.text = "Welcome! \(tfName.text!)"
            lblMessage.text = "텍스트를 추가했습니다:"
        }
    }//btnSend
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfName.text?.removeAll()
        lblResult.text = "Welcome!"
        lblMessage.text = "화면 초기상태 입니다."
    }//btnClear
    
}

