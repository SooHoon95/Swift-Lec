//
//  Students.swift
//  SQLite
//
//  Created by SooHoon on 2021/07/27.
//

import Foundation


class Students{     // 클라스는 class로 시작하고 이름은 대문자로 시작한다.
    var id: Int
    var name: String?
    var dept: String?
    var phone: String?
    
    // 생성자는 init
    init(id: Int, name: String?, dept: String?, phone: String?){
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
    // 얘는 데이터 베이스 없는 bean이랑 똑같다고 생각하면 됌.
}
