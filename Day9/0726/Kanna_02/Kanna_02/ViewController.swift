//
//  ViewController.swift
//  Kanna_02
//
//  Created by SooHoon on 2021/07/26.
//

import UIKit
import Kanna

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        daraCrawling()
    }

    func daraCrawling(){
        let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
        guard let main = URL(string: mainUrl) else {
            print("Error : \(mainUrl) doesn't seem to be valid URL")
            return
        }
        do{
            //Xpath로 가져온다.
            //*[@id="top_movies_main"]/div/table/tr/td/a
            let htmlData = try String(contentsOf: main, encoding: .utf8)
            let doc = try HTML(html: htmlData, encoding: .utf8)
            
            var count = 1 // 결과 창에서 번호 매길라고 그냥 쓴거임.
            for title in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
                print(count, title.text!.trimmingCharacters(in: .whitespacesAndNewlines))
                count += 1
            }
            
        }catch let error{
            print("Error : \(error)")
        }
    }

}

