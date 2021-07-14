//
//  ViewController.swift
//  KeyboardDisap
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    // 키보드 내리기 >> 정의된함수 불러와서 수행
    //Begin - Began _ Begun
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}

