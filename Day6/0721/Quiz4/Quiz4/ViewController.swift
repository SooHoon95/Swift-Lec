//
//  ViewController.swift
//  Quiz4
//
//  Created by SooHoon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var pageControl2: UIPageControl!
    
    
    var images = ["flower_01.png", "flower_02.png", "flower_03.png", "flower_04.png", "flower_05.png", "flower_06.png"]
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Image 설정하기
        ImageView.image = UIImage(named: images[0])
        
        //pageControl 설정
        pageControl2.numberOfPages = images.count
        pageControl2.currentPage = 0
        pageControl2.pageIndicatorTintColor = UIColor.green
        pageControl2.currentPageIndicatorTintColor = UIColor.red
        
        //한손가락
        makeSingleTouch()
    }
    
    @IBAction func pageChange(_ sender: UIPageControl) {
        ImageView.image = UIImage(named: images[pageControl2.currentPage])

        print("Page CHANGE >>>>>>>>>>>")
    }
    
    func makeSingleTouch(){
        
        let  swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction =  UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let  swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction =  UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        print("Single Touch >>>>>>>>>>>>>>>>>")
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{ //지금 상하좌우 제스처인데 대각선으로 가면 nil데이터가 생긴다. 이것을 방지하기 위해서 if let 사용
            
//            ImageView.image = UIImage(named: images[pageControl2.currentPage])
            
            switch swipeGesture.direction{
        
            case UISwipeGestureRecognizer.Direction.left :
                pageControl2.currentPage += 1
//                ImageView.image = UIImage(named: images[pageControl2.currentPage])
            case UISwipeGestureRecognizer.Direction.right:
                pageControl2.currentPage -= 1
//                ImageView.image = UIImage(named: images[pageControl2.currentPage])
            default:
                break
            }
//            ImageView.image = UIImage(named: images[pageControl2.currentPage])
        }
    }

}

