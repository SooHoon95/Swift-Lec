//
//  DBModel.swift
//  ServerJson_01
//
//  Created by SooHoon on 2021/07/27.
//


//파일 타입은 스위프트
import Foundation

class DBModel: NSObject{ // 오브젝트 단위가 제일 큰 단위이다.
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
