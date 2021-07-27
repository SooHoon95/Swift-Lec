//
//  ViewController.swift
//  CollectionView_Image
//
//  Created by SooHoon on 2021/07/26.
//

import UIKit

var image = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]

class ViewController: UIViewController {

    @IBOutlet weak var ImageCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImageCollectionView.dataSource = self
        ImageCollectionView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetailImage"{
            let cell = sender as! ImabeCollectionViewCell
            let indexPath = self.ImageCollectionView.indexPath(for: cell)
            let detailView = segue.destination as! ImageDetailViewController
            detailView.receiveImage(image[indexPath!.row])
            print("Image : ", image[indexPath!.row])
        }
    }


} // ViewController

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell { // 속성 값 설정 메소드
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myImageCell" , for: indexPath) as! ImabeCollectionViewCell // 타입 컬렉션 뷰쎌로 바꿔주기
        
        cell.imageView.image = UIImage(named: image[indexPath.row])
        print("start:=========", image[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{ //배치
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width)
        return size
    }
    
}
