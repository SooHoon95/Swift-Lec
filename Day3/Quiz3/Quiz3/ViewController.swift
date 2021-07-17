//
//  ViewController.swift
//  Quiz3
//
//  Created by 최수훈 on 2021/07/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfScore: UITextField!

    @IBOutlet weak var tvSummary: UITextView!
    
    @IBOutlet weak var lblsubject: UILabel!
    
    
    var subject: Array<String> = ["국어점수", "영어점수", "수학점수", "요약"] // 0 1 2 3
    var score: Array<Int>  = []
    var pageNum = 0
    var tot = 0
    var avg: Double = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }//viewDidLoad


    @IBAction func btnCal(_ sender: UIButton) {
        guard let numCheck:Int = Int(tfScore.text!) else {
            
            let alert = UIAlertController(title: "빈칸에 점수를 입력하세요", message: .none, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            
            return
        }
//        빈 값 아닐 때
        if overCheck(overNum: numCheck) == 0 {
            tfScore.text = ""
            return
        }else{
            pageNum += 1
            print(pageNum)
            if pageNum == 4 {
                pageNum = 0
                tfScore.text = ""
                tvSummary.text = ""
                lblsubject.text = subject[pageNum]
                tfScore.isHidden = false
                score.removeAll()
            }else{
                nextAction(pageNum: pageNum, numcheck: numCheck)
                
            }
        }
        
    }//btncal
    
    func nextAction(pageNum: Int, numcheck: Int) {
    
        if pageNum == 3 {
            self.score.append(numcheck) // pageNum - 1 자리값
            print(self.score)
            lblsubject.text = subject[pageNum]
            tfScore.isHidden = true
            
            summaryAction(score: self.score, tot: self.tot, avg: self.avg)
            
        }else{
            tfScore.text = ""
            lblsubject.text = subject[pageNum]
            self.score.append(numcheck) // pageNum - 1 자리값
            print(self.score)
        }
    }

    
    func summaryAction(score: Array<Int>, tot: Int, avg: Double){
        var compareAvg: Array<String> = []
        
        for i in score{
            self.tot += i
        }
        self.avg = Double(self.tot) / Double(self.subject.count - 1)
        
        // 평균 비교
        for j in score {
            if Double(j) > avg {
                compareAvg.append("높습니다.")
            }else{
                compareAvg.append("낮습니다.")
            }
        }
        
        tvSummary.text = """
            총점은 \(self.tot)입니다.
            평균은 \(self.avg)입니다.
            \(subject[0])는 \(score[0]) 으로 평균보다 \(compareAvg[0])
            \(subject[1])는 \(score[1]) 으로 평균보다 \(compareAvg[1])
            \(subject[2])는 \(score[2]) 으로 평균보다 \(compareAvg[2])
"""
        compareAvg.removeAll()
    
    }
    
    func overCheck(overNum:Int) -> Int{
        if overNum > 100 {
            let alert = UIAlertController(title: "100점 이하로 입력하세요", message: .none, preferredStyle: .actionSheet)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            alert.addAction(cancel)
            present(alert, animated: true, completion: nil)
            return 0
        }
        return 1
    }
}//ViewController


