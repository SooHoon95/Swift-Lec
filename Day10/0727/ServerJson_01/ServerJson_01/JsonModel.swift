//
//  JsonModel.swift
//  ServerJson_01
//
//  Created by SooHoon on 2021/07/27.
//

import Foundation

// Json 데이터 넘겨주는 방법 >> protocol

protocol JsonModelProtocol: class {
    func itemDownloaede(items: NSArray)
}

class JsonModel: NSObject{
    var delegate: JsonModelProtocol!
    let urlPath = "http://192.168.2.107:8080/ios/student.json"
    
    func downloadItems(){
        let url = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        let task = defaultSession.dataTask(with: url){(data, response, error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                self.parseJson(data!)
            }
        }
        task.resume()
    }
    func parseJson(_ data: Data){
        var jsonResult = NSArray()
        do{
            jsonResult = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        }catch let error as NSError{
            print("Error: \(error)")
        }
        
        var jsonElement = NSDictionary()
        let locations = NSMutableArray()
        
        for i in 0..<jsonResult.count{
            jsonElement = jsonResult[i] as! NSDictionary
            if let scode = jsonElement["code"] as? String, // if let쓰기
               let sname = jsonElement["name"] as? String,
               let sdept = jsonElement["dept"] as? String,
               let sphone = jsonElement["phone"] as? String{
                let query = DBModel(scode: scode, sname: sname, sdept: sdept, sphone: sphone)
                locations.add(query) // append아님!! 주의 **************************
            }
        }
        
        // Async 방식
        DispatchQueue.main.async(execute: {() -> Void in
            self.delegate.itemDownloaede(items: locations) // delegate = json Protocol
        })
    }
}
