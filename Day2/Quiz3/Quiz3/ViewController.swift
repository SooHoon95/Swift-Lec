//
//  ViewController.swift
//  Quiz3
//
//  Created by 최수훈 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var numImage = 0
    var imageName = ["flower_01.png", "flower_02.png", "flower_03.png","flower_04.png" ,"flower_05.png", "flower_06.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       displayImage(numImage: numImage)
        // 이런거
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        
        if numImage < 0 {
            numImage = imageName.count - 1
        }
        displayImage(numImage: numImage)
        // 이런거
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        
        if numImage == imageName.count  {
            imgView.image = UIImage(named: imageName[0])
            imgTitle.text = imageName[0]
            numImage = 0
        }
        displayImage(numImage: numImage) // 이렇게 쓰기 싫고 파라미터 너힉 싫으면 함수에 _ 써주면 된다.
        //이런거 다 함수로 만드는 게 좋음 안그러면 저런 내용들 다 메모리에 올라가서 퍼포먼스 좋아짐
    }
    
    func displayImage(numImage: Int){
        imgView.image = UIImage(named: imageName[numImage])
        imgTitle.text = imageName[numImage]
    }
    
    
} // ViewController

