//
//  ViewController.swift
//  DatePicker
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 1초
    let timeSelector: Selector = #selector(DateViewController.updateTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblPickerTime.text = "시간을 선택하세요!"
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true) // 1초에 한번씩 시간을 표시해주는 기능을 실행시키는 함수가 필요. 시간이랑은 전혀상관없음. interval 몇초에한번씩 표시해줄거냐? selector >> 타이머가 실행되면 뭘 실행시킬 거냐? 를 정해줌
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) { // 데이터 피커의 타임은 sender가 알고있다.
        let datePickeView = sender
        let formatter = DateFormatter()
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm" // 24시간 HH
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickeView.date))"
       
    }
    
    @objc func updateTime(){
        let date = NSDate() //Next Step // 데이터는 nsDate가 가지고 있지 위에있는 Timer가 가ㅣㅈ고 있는것이 아니다 !! 반드시 기억할 것
        let formatter = DateFormatter() // 년도 월 일 바꿔주는 매소드
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss" // EEE는 요일 a는 am pm
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))" // from: date as Date 첫번째는 ns에서 온 date 두번째는 DataType
        print(lblCurrentTime.text!)
    }
    
    
    
}// ViewController

