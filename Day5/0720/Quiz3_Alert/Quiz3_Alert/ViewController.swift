//
//  ViewController.swift
//  Quiz3_Alert
//
//  Created by 최수훈 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagOn = UIImage(named: "lamp_on.png")
    let imagOff = UIImage(named: "lamp_off.png")
    let imgRemove = UIImage(named: "lamp_remove_png")
    
    //상태변수
    var isLampOn = true //Lamp State
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.image = imagOn
    }

    @IBAction func btnlampOn(_ sender: UIButton) {
        if imageView.image == imgRemove {
            imageView.image = imagOn
            isLampOn = true
        } else{
        if isLampOn{
            let lampOnAlert = UIAlertController(title: "경고", message: "The Lamp is already on" , preferredStyle: .alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            lampOnAlert.addAction(onAction)
            present(lampOnAlert, animated: true, completion: nil)
        }else{
            imageView.image = imagOn
            isLampOn = true
        }
        }
    }
    
    @IBAction func btnlampOff(_ sender: UIButton) {
        if !isLampOn{
            let lampOffAlert = UIAlertController(title: "경고", message: "The Lamp is already Off" , preferredStyle: .alert)
            let offAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
            
            lampOffAlert.addAction(offAction)
            present(lampOffAlert, animated: true, completion: nil)
            
        }else{
            let lampOffAlert = UIAlertController(title: "경고", message: "Are you sure to lamp Off?", preferredStyle:.alert)
            let offCheckAction = UIAlertAction(title: "네", style: .default, handler: { [self]ACTION in
                imageView.image = imagOff
                isLampOn = false
            })
            let offNoAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
            
            lampOffAlert.addAction(offCheckAction)
            lampOffAlert.addAction(offNoAction)
            present(lampOffAlert, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func btnlampRemove(_ sender: Any) {
        

        let lampRemoveAlert = UIAlertController(title: "Remove the Lamp?", message: "Are you sure to remove?", preferredStyle: .alert)
        let onAction = UIAlertAction(title: "아니요 켭니다!", style: .default, handler: { [self]ACTION in
            
            if isLampOn{
                let lampOnAlert = UIAlertController(title: "경고", message: "The Lamp is already on" , preferredStyle: .alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
                
                lampOnAlert.addAction(onAction)
                present(lampOnAlert, animated: true, completion: nil)
            }else{
                imageView.image = imagOn
            }
        })
        
        let offAction = UIAlertAction(title: "아니요 끕니다!", style: .default, handler: { [self] ACTION in
            if !isLampOn {
                let lampOffAlert = UIAlertController(title: "경고", message: "The Lamp is already Off" , preferredStyle: .alert)
                let offAction = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: nil)
                
                lampOffAlert.addAction(offAction)
                present(lampOffAlert, animated: true, completion: nil)
                
            }else{
                let lampOffAlert = UIAlertController(title: "경고", message: "Are you sure to lamp Off?", preferredStyle:.alert)
                let offCheckAction = UIAlertAction(title: "네", style: .default, handler: { [self]ACTION in
                    imageView.image = imagOff
                    isLampOn = false
                })
                let offNoAction = UIAlertAction(title: "아니오", style: .default, handler: nil)
                
                lampOffAlert.addAction(offCheckAction)
                lampOffAlert.addAction(offNoAction)
                present(lampOffAlert, animated: true, completion: nil)
            }
            
        })
        let removeAction = UIAlertAction(title: "네 제거합니다!", style: .default, handler: { [self] ACTION in
            imageView.image = imgRemove
        })
        lampRemoveAlert.addAction(onAction)
        lampRemoveAlert.addAction(offAction)
        lampRemoveAlert.addAction(removeAction)
        present(lampRemoveAlert, animated: true, completion: nil)
    }
}

