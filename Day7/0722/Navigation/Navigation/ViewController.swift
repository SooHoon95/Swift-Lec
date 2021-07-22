//
//  ViewController.swift
//  Navigation
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    
    var isOn = true // 전구 켜져있는지 꺼졌는지 알기위한 상태변수
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
       
               if segue.identifier == "editButton"{
                   editViewController.textWayValue = "Segue : Use Button!"
               }else{
                   editViewController.textWayValue = "Segue : Use Bar Button!"
               }
               editViewController.textMessage =  tfMessage.text!
               editViewController.delegate = self // *********중요하다 그래야 돌아올 때 값을 가져올 수있다.
               editViewController.isOn = self.isOn // 또는 그냥 isOn
    }
    
}//ViewController


extension ViewController: EditDelegate{
    func didImageOnOffDone(_ contorller: EditViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        tfMessage.text = message
    }
}

