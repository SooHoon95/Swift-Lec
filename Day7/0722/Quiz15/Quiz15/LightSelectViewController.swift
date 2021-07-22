//
//  LightSelectViewController.swift
//  Quiz15
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class LightSelectViewController: UIViewController {

    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOnOff: UISwitch!
    @IBOutlet weak var swRed: UISwitch!
    
    var isOn: Bool = true
    var isRed: Bool = false
    var delegate: LightDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        swIsOnOff.isOn = isOn
        swRed.isOn = isRed
    }

    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn{
            isOn = true
            lblOnOff.text = "On"
        }else{
            isOn = false
            lblOnOff.text = "Off"
        }
    }
    
    @IBAction func swImageRed(_ sender: UISwitch) {
        if sender.isOn{
            isRed = true
        }else{
            isRed = false
        }
    }
    
    @IBAction func btnDoneAction(_ sender: UIButton) {
        if delegate != nil{
            delegate?.didImageOnOffDone(self, isOn: isOn)
            delegate?.didImageRed(self, isRed: isRed)
        }
        navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
