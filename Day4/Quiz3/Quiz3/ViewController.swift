//
//  ViewController.swift
//  Quiz3
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblResize: UILabel!
    
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    var isZoom = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imageView.image = imgOn
    }

    @IBAction func switchResize(_ sender: UISwitch) {
        let scale: CGFloat = 2.0 //두배 키울거라는 뜻. 타입을 더블로쓸때랑 다른 점은 CGFloat 를 쓰면  그래픽 카드가 움직인다.
        let newWidth: CGFloat
        let newHeight: CGFloat
        
        if isZoom {
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
            lblResize.text = "전구 축소"
        }else{
            newWidth = imageView.frame.width / scale// 현재그림의 가로출 길이 * ()하게 되면 두배커지기 됨
            newHeight = imageView.frame.height / scale
            lblResize.text = "전구 확대"
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom // 가장 중요
        }
    
    
    @IBAction func switchOnOff(_ sender: UISwitch) {
    
        switch sender.isOn{
        case true:
             imageView.image = imgOn
        case false:
            imageView.image = imgOff
        }
    }
    
}

