//
//  ViewController.swift
//  Hybrid
//
//  Created by 최수훈 on 2021/07/21.
//

import UIKit
import WebKit // ****************

class ViewController: UIViewController {

    @IBOutlet weak var tfUrl: UITextField!
    @IBOutlet weak var myWebView: WKWebView! // 새로 import해줘야한다!
    @IBOutlet weak var myAtctivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let tempSite = "https://www.naver.com"
        loadWebPage(url: "https://www.naver.com")
    }// DidLoad

    
    @IBAction func btnGoogle(_ sender: UIButton) {
        loadWebPage(url: "http://google.com")
    }
    
    @IBAction func btnDaum(_ sender: UIButton) {
        loadWebPage(url: "https://www.daum.net")
    }

    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    
    @IBAction func btnGoFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    
    @IBAction func btnGo(_ sender: UIButton) {
        let myUrl = checkUrl(tfUrl.text!) // http 있는지 없는지 함수로 체크
        tfUrl.text = ""
        loadWebPage(url: myUrl)
//        loadWebPage(url: "http://www.\(tfUrl.text!)")
    }
    
    @IBAction func btnHtml(_ sender: UIButton) { // .load 라는 메소드를 못 쓴다.
        let htmlString = """
                <html>
                    <head>
                        <meta charest="utf-8">
                        <meta name="viewport" content="width=device-wiedth, initial-scale=2.0">
                    </head>
                     <body>
                        <h1>HTML String</h1>
                        <p>Sgring 변수를 이용한 웹페이지</p>
                        <p><a href = "http://jtbc.joins.com">JTBC</a>로 이동 </p>
                    </body>
                </html>
            """
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    
    @IBAction func btnFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html") // forResource = 파일이름 타입은 파일 확장자
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    
    func checkUrl(_ url: String) -> String{
        var strUrl = url
        
        let flag = strUrl.hasPrefix("http://")
        if !flag{
            strUrl += "http://"
        }
        return strUrl
    }
    
    
    func loadWebPage(url: String){
        let myUrl =  URL(string: url) // 이 스트링을 url타입으로 바꿔줘야한다.
        let myRequest = URLRequest(url: myUrl!) // myURL is optional
        myWebView.load(myRequest)
        myWebView.navigationDelegate = self
    }
    
} //ViewController

extension ViewController: WKNavigationDelegate{ // 뷰 컨트롤러의 기능 확장
    
    //Indicator 시작 / webview가 시작됐다는 걸 얘가 알고있다.
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myAtctivityIndicator.startAnimating()
        myAtctivityIndicator.isHidden = false
    }
    
    // Indicator의 종료
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myAtctivityIndicator.stopAnimating()
        myAtctivityIndicator.isHidden = true
    }
    
    // Error 발생시
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myAtctivityIndicator.stopAnimating()
        myAtctivityIndicator.isHidden = true
    }
}

