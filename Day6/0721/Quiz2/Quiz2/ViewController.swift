//
//  ViewController.swift
//  Quiz2
//
//  Created by SooHoon on 2021/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblNumber: UILabel!
    @IBOutlet weak var pageContorl: UIPageControl!
    
    var numberArr = Array(1...10)
    var countNum = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblNumber.text = String(numberArr[0])
        lblNumber.textColor = UIColor.red
        
        pageContorl.numberOfPages = numberArr.count
        pageContorl.currentPage = 0
        pageContorl.pageIndicatorTintColor = UIColor.green
        pageContorl.currentPageIndicatorTintColor = UIColor.red
        
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        if pageContorl.currentPage % 2 == 1 {
            lblNumber.text = String(numberArr[pageContorl.currentPage])
            lblNumber.textColor = UIColor.blue
        }else{
            lblNumber.text = String(numberArr[pageContorl.currentPage])
            lblNumber.textColor = UIColor.red
        }
    }
    
}

