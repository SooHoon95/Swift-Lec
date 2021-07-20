//
//  ViewController.swift
//  Quiz4
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    @IBOutlet weak var lblSettingTime: UILabel!
    
    let intevalTime = 1.0
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let alram: Selector = #selector(ViewController.alarm)
    var num : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        lblPickerTime.text = "시간을 설정해주세요!"
    Timer.scheduledTimer(timeInterval: intevalTime, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        Timer.scheduledTimer(timeInterval: intevalTime, target: self, selector: alram, userInfo: nil, repeats: true)
    }

    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatterSetting = DateFormatter()
        formatterSetting.locale = Locale(identifier: "ko")
        formatterSetting.dateFormat = "yyyy-MM-dd EEE a hh:mm"
        
        lblPickerTime.text = "선택시간 : \(formatterSetting.string(from: datePickerView.date))"
        print(lblPickerTime.text! + "\n" + lblSettingTime.text!)
    
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
            lblSettingTime.text = "선택시간 : \(formatterSetting.string(from: date as Date))"

        }
    
   @objc func alarm(){
        if lblPickerTime.text! == lblSettingTime.text!{
            if num % 2 == 0{
                view.backgroundColor = UIColor.red
            }else{
                view.backgroundColor = UIColor.blue
            }
        }else{
            view.backgroundColor = UIColor.white
            
        }
        
        num += 1
    
    }
}
