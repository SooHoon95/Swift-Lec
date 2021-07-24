//
//  DetailViewController.swift
//  Table
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    
    var receiveItem = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = receiveItem
        
    }
    
    func receiveItems(_ item: String){ // 클릭할떄 정보를 receItem에 넣어준다.
        receiveItem = item
    }
    

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { // 이 함수에 쓰여지는 변수는 2개. for는 이 함수를 보여지기 위한 함수
       
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  */

}// TableCiewController
