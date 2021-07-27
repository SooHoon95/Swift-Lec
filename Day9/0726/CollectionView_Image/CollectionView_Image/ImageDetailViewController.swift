//
//  ImageDetailViewController.swift
//  CollectionView_Image
//
//  Created by SooHoon on 2021/07/26.
//

import UIKit

class ImageDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cell======",imageName)

        imageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }
    
    func receiveImage(_ image: String){
        imageName = image
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
