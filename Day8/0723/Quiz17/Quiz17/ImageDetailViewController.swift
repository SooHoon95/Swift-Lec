//
//  ImageDetailViewController.swift
//  Quiz17
//
//  Created by SooHoon on 2021/07/23.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var imageDetail: UIImageView!
    @IBOutlet weak var lblDetail: UILabel!
    
    
    var receiveItem = ""
    var receiveImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblDetail.text = receiveItem
        imageDetail.image = UIImage(named: receiveImage)
        // Do any additional setup after loading the view.
    }
    

    func receiveItems(_ item: String, _ image: String){ // 클릭할떄 정보를 receItem에 넣어준다.
        receiveItem = item
        receiveImage = image
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
