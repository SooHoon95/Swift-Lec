//
//  ViewController.swift
//  Quiz15
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    
    var isOn = true
    var isRed = false
    
    var imgOn = UIImage(named: "lamp_on.png")
    var imgOff = UIImage(named: "lamp_off.png")
    var imgRed =  UIImage(named: "lamp_red.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = imgOn
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lightSelectViewController = segue.destination as! LightSelectViewController
        
        lightSelectViewController.delegate = self
        lightSelectViewController.isOn = isOn
        lightSelectViewController.isRed = isRed
    }


}//ViewController

extension ViewController: LightDelegate{
    func didImageRed(_ sender: LightSelectViewController, isRed: Bool) {
        if isRed == true{
            imgView.image = imgRed
            self.isRed = true
        }else{
            self.isRed = false
        }
    }
    
    func didImageOnOffDone(_ sender: LightSelectViewController, isOn: Bool) {
        if isOn{
            imgView.image = imgOn
            self.isOn = true
        }else{
            imgView.image = imgOff
            self.isOn = false
        }
    }
}

