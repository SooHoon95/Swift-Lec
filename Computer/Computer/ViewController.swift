//
//  ViewController.swift
//  Computer
//
//  Created by 최수훈 on 2021/07/14.
//

import UIKit

class ViewController: UIViewController {

    
//Text Filed 정리
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfBag: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }//viewDidLoad
    
    //얘네는 아울렛아니고 액션이고 타입은 UIButton
    @IBAction func btnOK(_ sender: UIButton) {
        let name: String = "맥북프로"
        let size: Int = 16
        let weight: Double = 2.56
        let bag: Bool = false
        let color: Character = "은"

        tfName.text = name
        tfSize.text = String(size)
        tfWeight.text = String(weight)
        tfBag.text = String(bag)
        tfColor.text = String(color)
    
    }//btnOK
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfName.text = ""
        tfSize.text?.removeAll()
        tfWeight.text?.removeAll()
        tfBag.text?.removeAll()
        tfColor.text?.removeAll()
    
    }//btnClear
    

}//ViewController

