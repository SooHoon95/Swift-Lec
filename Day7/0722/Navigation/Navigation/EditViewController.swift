//
//  EditViewController.swift
//  Navigation
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOFF: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn: Bool  = false
    
    var delegate: EditDelegate? // type is optional
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lblWay.text = textWayValue
        tfMessage.text = textMessage
    
        swIsOn.isOn = isOn // 전 화면에서 ture면 켜져있고 아니면 꺼져있는 거
        if isOn{
            lblOnOFF.text = "On"
        }else{
            lblOnOFF.text = "Off"
        }
        
    }
    
    @IBAction func btnDone(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didMessageEditDone(self, message: tfMessage.text!)
            delegate?.didImageOnOffDone(self, isOn: isOn)
        }
        navigationController?.popViewController(animated: true) // pop은 뒤에꺼부터 하나씩 없앤다.
        // 이걸 통해서 프로토콜을 줬다. 시발이게 뭔 개소리야 ㅋ 어ㄷ쨋든 받는애는 ViewController
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOFF.text = "On"
        }else{
            isOn = false
            lblOnOFF.text = "Off"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
