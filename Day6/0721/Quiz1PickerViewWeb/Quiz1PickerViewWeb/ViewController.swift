//
//  ViewController.swift
//  Quiz1PickerViewWeb
//
//  Created by SooHoon on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pickerWebSite: UIPickerView!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var indicatorLoad: UIActivityIndicatorView!
    
    var webUrl = [("www.nate.com","네이트"), ("www.naver.com","네이버"),("www.daum.net","다음"),("www.abc.com","abc방송"), ("www.google.com","구글")]
    var webName = ["네이트","네이버","다음","abc 방송", "구글"]
    
    var maxArrayNum = 0
    var viewColumn = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        maxArrayNum = webUrl.count
        
        pickerWebSite.dataSource = self
        pickerWebSite.delegate = self
        
        loadWebPage(url: "https://\(webUrl[0].0)")
    }

    func loadWebPage(url: String){
        let myUrl =  URL(string: url) // 이 스트링을 url타입으로 바꿔줘야한다.
        let myRequest = URLRequest(url: myUrl!) // myURL is optional
        webView.load(myRequest)
        webView.navigationDelegate = self
    }

}// ViewController

extension ViewController: WKNavigationDelegate{ // 뷰 컨트롤러의 기능 확장
    
    //Indicator 시작 / webview가 시작됐다는 걸 얘가 알고있다.
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicatorLoad.startAnimating()
        indicatorLoad.isHidden = false
    }
    
    // Indicator의 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicatorLoad.stopAnimating()
        indicatorLoad.isHidden = true
    }
    
    // Error 발생시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicatorLoad.stopAnimating()
        indicatorLoad.isHidden = true
    }
}

extension ViewController:UIPickerViewDataSource{
    
    //PickerView의 칼럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return viewColumn
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
}

extension ViewController: UIPickerViewDelegate{
    //PickerView Title 입히기
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return webUrl[row].1
    }

    //Picker View에 Url선택했을 때
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            loadWebPage(url: "https://\(webUrl[row].0)")
        }
}
