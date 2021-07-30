//
//  UpdateModel.swift
//  DBCRUD
//
//  Created by SooHoon on 2021/07/28.
//

import Foundation

class UpdateModel{

    var urlPath = "http://192.168.0.10:8080/ios/studentUpdate_ios.jsp"
    
    func UpdateItems(code: String, name: String, dept: String, phone: String) -> Bool{ // insert니까 값을 가지고 가야 이비에 넣어주니까 어트리뷰트 지정
        var result : Bool = true
        let urlAdd = "?code=\(code)&name=\(name)&dept=\(dept)&phone=\(phone)"//겟방식으로 줄거임
        // 얘가 진짜 사용되는 url
        urlPath = urlPath + urlAdd
        
        // 값이 한글일때 깨지니까, 그거 인코딩 해주자! >> 한글 url encoading
        urlPath = urlPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
                result = false
            }else{
                print("Data is inserted!")
                result = true
            }
        }
        task.resume()
        return result
    }
   
}
