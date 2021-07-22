//
//  ViewController.swift
//  Image
//
//  Created by 최수훈 on 2021/07/19.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton! // 액션아니고 아울렛
    
    var imgOn: UIImage? // 켜진 전구 이미지
    var imgOff: UIImage? // 꺼진 전구 이미지
   
    //상태변수
    var isZoom = true // 이미지 확대 여부
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        //이미지 파일 준비
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        //이미지 할당
        imgView.image = imgOn
    }
    @IBAction func btnResizeImage(_ sender: UIButton) {
        //이미지 크기를 2배로
        let scale: CGFloat = 2.0 //두배 키울거라는 뜻. 타입을 더블로쓸때랑 다른 점은 CGFloat 를 쓰면  그래픽 카드가 움직인다.
        let newWidth: CGFloat
        let newHeight: CGFloat
        
        if isZoom{
            newWidth = imgView.frame.width * scale// 현재그림의 가로출 길이 * ()하게 되면 두배커지기 됨
            newHeight = imgView.frame.height * scale
            btnResize.setTitle("Image 축소", for: .normal)
        }else{
            newWidth = imgView.frame.width / scale// 현재그림의 가로출 길이 * ()하게 되면 두배커지기 됨
            newHeight = imgView.frame.height / scale
            btnResize.setTitle("Image 확대", for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom // 가장 중요
    }
    
    @IBAction func swichImageOnOff(_ sender: UISwitch) {
        switch sender.isOn{
        case true:
            imgView.image = imgOn
        default:
            imgView.image = imgOff
        }
        
//        if sender.isOn{
//            imgView.image = imgOn
//        }else{
//            imgView.image = imgOff
//        }
    }
    
}

