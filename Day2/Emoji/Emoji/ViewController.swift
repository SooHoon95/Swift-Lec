//
//  ViewController.swift
//  Emoji
//
//  Created by 최수훈 on 2021/07/15.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var lblResult: UILabel!
    
    var arrEmoji = ["😀","😃","😄","🥲","😆","😅"]
    var i = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = arrEmoji[0]
    }//ViewDidLoad

    @IBAction func btnPlay(_ sender: UIButton) {
       
        i += 1
        if i  == arrEmoji.count{
            lblResult.text = arrEmoji[0]
            i = 0
        }else{
            lblResult.text = arrEmoji[i]
        }

    }//btnPlay
    
    @IBAction func btnBack(_ sender: UIButton) {
        i -= 1
        if i < 0 {
            i = arrEmoji.count - 1
        }
        lblResult.text = arrEmoji[i]
    }

}//ViewController

