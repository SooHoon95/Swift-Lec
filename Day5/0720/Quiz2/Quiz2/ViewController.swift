//
//  ViewController.swift
//  Quiz2
//
//  Created by 최수훈 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblGugu: UILabel!
    @IBOutlet weak var pickerGugu: UIPickerView!
    @IBOutlet weak var tvGugu: UITextView!
    
    var guguName: Array<String> = ["2","3","4","5","6","7","8","9"]
    var viewColumn = 1
    var maxArrayNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tvGugu.isEditable = false
        maxArrayNum = guguName.count
        
        for i in 1...9{
            tvGugu.text.append("\(guguName[0]) X \(i) = \(Int(guguName[0])! * i)" + "\n")
        }
        lblGugu.text = guguName[0] + "단"
        
        pickerGugu.dataSource = self
        pickerGugu.delegate = self
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    

}//ViewController

extension ViewController:UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
}

extension ViewController: UIPickerViewDelegate{
    //PickerView Title 입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        print(row)
        return guguName[row]+"단"
    }

//    //Picker View에 Image 선택
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblGugu.text = guguName[row]
        tvGugu.text = ""
        for i in 1...9{
            tvGugu.text.append("\(guguName[row]) X \(i) = \(Int(guguName[row])! * i)" + "\n")
        }
        
    }
}
