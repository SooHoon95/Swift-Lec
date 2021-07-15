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
        imgTitle.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        numImage -= 1
        
        if numImage < 0 {
            numImage = imageName.count - 1
        }
        imgView.image = UIImage(named: imageName[numImage])
        imgTitle.text = imageName[numImage]
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        numImage += 1
        
        if numImage == imageName.count  {
            imgView.image = UIImage(named: imageName[0])
            imgTitle.text = imageName[0]
            numImage = 0
        }
        imgView.image = UIImage(named: imageName[numImage])
        imgTitle.text = imageName[numImage]
    }
    
}

