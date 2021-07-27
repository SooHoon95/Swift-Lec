//
//  DetailViewController.swift
//  Kanna_04
//
//  Created by SooHoon on 2021/07/26.
//

import UIKit
import Kanna
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailWebView: WKWebView!
    @IBOutlet weak var myIndicator: UIActivityIndicatorView!
    
    var receiveUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        detailCrawling()
        loadWebPage(url: receiveUrl)
        // Do any additional setup after loading the view.
        
    }
    
    func receiveURL(_ url: String){
        receiveUrl = url
    }
    
//    func detailCrawling(){
//        let mainUrl = "https://www.rottentomatoes.com/top/bestofrt/?year=2019"
//        guard let main = URL(string: mainUrl) else {
//            print("Error : \(mainUrl) doesn't seem to be valid URL")
//            return
//        }
//        // nli 아니면 크로울링 시작
//        do{
//           //get Xpath
//        //*[@id="top_movies_main"]/div/table/tr/td/a
//
//            let htmldata = try String(contentsOf: main, encoding: .utf8)
//            let doc = try HTML(html: htmldata, encoding: .utf8)
////            var count = 1 // 결과 창에서 번호 매길라고 그냥 쓴거임.
//
//            for detail in doc.xpath("//*[@id='top_movies_main']/div/table/tr/td/a"){
//                print(detail["href"]!)
//                detailAddr.append(detail["href"]!)
//            }
//
//        }catch let error{
//            print("Error : \(error)")
//        }
//    }
    
    func loadWebPage(url: String){
        let myUrl =  URL(string: url) // 이 스트링을 url타입으로 바꿔줘야한다.
        let myRequest = URLRequest(url: myUrl!) // myURL is optional
        detailWebView.load(myRequest)
        detailWebView.navigationDelegate = self
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

extension DetailViewController: WKNavigationDelegate{ // 뷰 컨트롤러의 기능 확장
    
    //Indicator 시작 / webview가 시작됐다는 걸 얘가 알고있다.
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myIndicator.startAnimating()
        myIndicator.isHidden = false
    }
    
    // Indicator의 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
    
    // Error 발생시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myIndicator.stopAnimating()
        myIndicator.isHidden = true
    }
}
