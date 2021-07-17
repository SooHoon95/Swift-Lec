//
//  ViewController.swift
//  Quiz2
//
//  Created by 최수훈 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfKor: UITextField!
    @IBOutlet weak var tfMath: UITextField!
    @IBOutlet weak var tfEng: UITextField!
    @IBOutlet weak var tfResult: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblMessage.text = "빈칸에 숫자를 입력해주세요."
    }// viewDidLoad

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnCal(_ sender: UIButton) {
        guard let scoreKor: Int = Int(tfKor.text!) else { lblMessage.text = "국어 점수를 입력해주세요"; return }
        guard let scoreMath: Int = Int(tfMath.text!) else { lblMessage.text = "수학 점수를 입력해주세요!"; return }
        guard let scoreEng: Int = Int(tfEng.text!) else { lblMessage.text = "영어점수를 입력해주세요!"; return }
        
        if scoreKor > 100 || scoreMath > 100 || scoreEng > 100{
            lblMessage.text = "점수는 100점이 만점입니다."
        }else{
            let tot = scoreKor + scoreMath + scoreEng
            let avg: Double = Double(tot) / 3
            var grade: String{
                switch avg{
                case 90..<101 :
                    return "A"
                case 80..<90:
                    return "B"
                case 60..<70:
                    return "C"
                case 50..<60:
                    return "D"
                default:
                   return "F"
                }
            }
        lblMessage.text = "평균은 \(String(format:"%.2f", avg)) 이고 등급은 \(grade) 입니다."
        }
        self.view.endEditing(true)
    }//btnCal
    
    
    
    }// ViewController
    
    


