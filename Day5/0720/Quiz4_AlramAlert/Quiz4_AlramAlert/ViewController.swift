//
//  ViewController.swift
//  Quiz4_AlramAlert
//
//  Created by 최수훈 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblSelectedTime: UILabel!
    
    let interval = 1.0
    let timeSelector: Selector = #selector(ViewController.updateTime)
    var isAlram = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSelectedTime.text = "시간을 선택해주세요!"
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    
    @IBAction func pickerDate(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        let formatterSetting = DateFormatter()
        formatterSetting.locale = Locale(identifier: "ko")
        formatterSetting.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        
        lblSelectedTime.text = "선택시간 : \(formatterSetting.string(from: datePickerView.date))"
    }
    
    
    @objc func updateTime(){
        let date = NSDate() //Next Step // 데이터는 nsDate가 가지고 있지 위에있는 Timer가 가ㅣㅈ고 있는것이 아니다 !! 반드시 기억할 것
        let formatter = DateFormatter() // 년도 월 일 바꿔주는 매소드
        let formatterSetting = DateFormatter() // lblSetting에 들어갈 포맷
        
        //currentTime
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // EEE는 요일 a는 am pm
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))" // from: date as Date 첫번째는 ns에서 온 date 두번째는 DataType
        
        //SettingTime
        formatterSetting.locale = Locale(identifier: "ko")
        formatterSetting.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        let choosenTime = "선택시간 : \(formatterSetting.string(from: date as Date))"
        
        if choosenTime == lblSelectedTime.text && isAlram{
            let alert = UIAlertController(title: "알림", message: "설정된 시간입니다!", preferredStyle: .alert)
            let cancel = UIAlertAction(title: "네, 알겠습니다.", style: .cancel, handler: { [self]ACTION in
                isAlram = false
            })
            alert.view.backgroundColor = UIColor.yellow
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
        }
    }

}//ViewController

