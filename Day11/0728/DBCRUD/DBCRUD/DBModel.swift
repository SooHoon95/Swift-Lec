//
//  DBModel.swift
//  DBCRUD
//
//  Created by SooHoon on 2021/07/28.
//

import Foundation

// Bean 과 같은거라고 생각하면 된다.
class DBModel: NSObject{ // 오브젝트 단위가 제일 큰 단위이다. // Json
    var scode: String?
    var sname: String?
    var sdept: String?
    var sphone: String?
    
    
    // Empty constructor
    override init() {
        
    }
    
    init(scode: String , sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
}
