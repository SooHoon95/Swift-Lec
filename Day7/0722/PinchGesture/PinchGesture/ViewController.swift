//
//  ViewController.swift
//  PinchGesture
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgPinch: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 핀치 셋업
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_ :))) // objectc에서는 함수를 줄때 아무것도 안줘도 저렇게 언더바 주고 표시해준다. 저게 object c 의 모양이다.
        self.view.addGestureRecognizer(pinch)
    }
    
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer){
        imgPinch.transform = imgPinch.transform.scaledBy(x: pinch.scale, y: pinch.scale) // x y 값은 레코그나이져에서 주는거다.
        pinch.scale = 1 // 드래그 해서 놓으면 그게 1값이다. 라고 속이는 것원래 1값이다.
    }


}
