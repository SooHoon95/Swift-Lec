//
//  ViewController.swift
//  Quiz3PageControlWeb
//
//  Created by SooHoon on 2021/07/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var lblWebUrl: UILabel!
    @IBOutlet weak var myWebView: WKWebView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var webUrl = ["www.naver.com", "www.daum.net","www.google.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadWeb(webUrl[0])
        
        pageControl.numberOfPages = webUrl.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
    }

    @IBAction func pageChange(_ sender: UIButton) {
        loadWeb(webUrl[pageControl.currentPage])
    }
    
    func loadWeb(_ url: String) {
        let myUrl = URL(string: "https://\(url)")
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
        myWebView.navigationDelegate = self
        
    }
}

extension ViewController: WKNavigationDelegate{
    //Indicator 시작 / webview가 시작됐다는 걸 얘가 알고있다.
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.startAnimating()
        indicator.isHidden = false
    }
    
    // Indicator의 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
    
    // Error 발생시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        indicator.stopAnimating()
        indicator.isHidden = true
    }
}
