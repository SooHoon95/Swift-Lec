//
//  ViewController.swift
//  Quiz5
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class TimerImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblFIleName: UILabel!
    
    var imageNum = 0
    var fileName: Array<String> = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    var interval:Double  = 3.0
    var timeSelector: Selector = #selector(TimerImageViewController.updateImage)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputResult()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @objc func updateImage(){
        imageNum += 1
        
        if imageNum == fileName.count {
            imageNum = 0
            inputResult()
        }else{
           inputResult()
        }
    
    }

    func inputResult(){
        imageView.image = UIImage(named: fileName[imageNum])
        lblFIleName.text = fileName[imageNum]
    }
    
}

