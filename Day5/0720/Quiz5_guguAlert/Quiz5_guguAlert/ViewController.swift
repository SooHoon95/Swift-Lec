//
//  ViewController.swift
//  Quiz5_guguAlert
//
//  Created by 최수훈 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfResult: UITextField!
    @IBOutlet weak var lblNum1: UILabel!
    @IBOutlet weak var lblNum2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblNum1.text = genNum()
        lblNum2.text = genNum()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func btnOK(_ sender: UIButton) {
        guard let num1 = Int(lblNum1.text!) else { return }
        guard let num2 = Int(lblNum2.text!) else { return }
        
        if tfResult.text == String(num1 * num2){
            let alert = UIAlertController(title: "결과", message: "정답 입니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "다른 문제 풀기", style: .default, handler: {ACTION in
                self.lblNum1.text = self.genNum()
                self.lblNum2.text = self.genNum()
                self.tfResult.text = ""
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "결과", message: "오답 입니다", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "다시 풀기", style: .default, handler: {ACTION in
                self.tfResult.text = ""
            })
            
            alert.addAction(okAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    func genNum() -> String{
        return String(Int.random(in: 1..<10))
    }
    
}

