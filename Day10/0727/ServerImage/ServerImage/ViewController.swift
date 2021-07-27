//
//  ViewController.swift
//  ServerImage
//
//  Created by SooHoon on 2021/07/27.
//

import UIKit

class ViewController: UIViewController {
    
//    var imgNum = ["01", "02", "03", "04", "05", "06"]
    var imgArray = [UIImage?]()
    
    @IBOutlet weak var imgView: UIImageView!
    
    var countNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 이미지 불러와서 데이터에 넣기
        getData()
        
    }

    func getData(){
        
        for i in 1...6{
            let url = URL(string: "http://192.168.2.107:8080/ios/flower_0\(i).png") // 입력위치
            // 이제 데이터 가져오자
            let data = try? Data(contentsOf: url!) // 출력위치
            imgArray.append(UIImage(data: data!))
        }
    }
    
    @IBAction func btnImage1(_ sender: UIButton) {
        
        let url : URL = URL(string: "http://192.168.2.107:8080/ios/flower_01.png")!
        // 세션연결
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
    
        
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{ // 뭔가 애러 걸렸으면
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                DispatchQueue.main.async { // 어씽크로 쓰겠다!
                    self.imgView.image = UIImage(data: data!)
                    if let image = UIImage(data: data!){
                        if let data = image.pngData(){
                            let filename = self.getDocumentDirectory().appendingPathComponent("copy.png")
                            try? data.write(to: filename)
                        }
                    }
                }
            }
            
        }
        task.resume()
        self.countNum = 1
        
    }//btnImage1 >>> 옛날 방식 코드 웹으로 내 서버에 접속해서 이미지를 ㅂ다아와서 그거를 copy로 이름을 바꿔서 내 폰에 저장해서 보여주는 방식
    
    func getDocumentDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0] // 이중 첫번째거를 리턴하면 내가 해당 위치이다! 무슨ㅁ날이야 이게 시부럴 ㅋ
    }
    
    
    @IBAction func btnImage2(_ sender: UIButton) {
        let url = URL(string: "http://192.168.0.78:8080/ios/flower_02.png") // 입력위치
        // 이제 데이터 가져오자
        let data = try? Data(contentsOf: url!) // 출력위치
        imgView.image = UIImage(data: data!)
        self.countNum = 2
    }

    @IBAction func btnPrev(_ sender: UIButton) {
        self.countNum -= 1
        if countNum < 0{
            self.countNum = 5
            imgView.image = imgArray[self.countNum]
        }else{
            
            imgView.image = imgArray[self.countNum]
        }
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        self.countNum += 1
        if countNum == 6 {
            self.countNum = 0
            imgView.image = imgArray[self.countNum]
        }else{
            imgView.image = imgArray[self.countNum]
        }
    }
    
} // ViewController



