//
//  DetailViewController.swift
//  SQLite
//
//  Created by SooHoon on 2021/07/27.
//

import UIKit
import SQLite3

class DetailViewController: UIViewController {
    
    var receiveId = 0
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    var db: OpaquePointer?

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    @IBOutlet weak var tfName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData1.sqlite") // 파일은 filemanager가 관리하니까 FileManager. 내 앱에다가 쓸거니까 default
        print(fileURL)
        // 인스턴스 중에 pointer 로 된부분이 있다 >> &db
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        // Cell 정보 가져와서 입력하기
        receiveItems(receiveId, receiveName, receiveDept, receivePhone)
        
        tfId.text = String(receiveId)
        tfName.text = receiveName
        tfDept.text = receiveDept
        tfPhone.text = receivePhone
    
    }
    
    @IBAction func btnModify(_ sender: UIButton) {
        
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) //****************한글깨지기 방지
        
        let id = String(tfId.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "UPDATE students SET sname=?, sdept=?, sphone=? WHERE sid=?"
        
        // 인스턴스 중에 pointer 로 된부분이 있다 >> &stmt
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //에러 방지
        if sqlite3_bind_text(stmt, 1, name, -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding name: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt, 2, dept, -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding dept: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, phone, -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding phone: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 4, id, -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding id: \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("fail inserting sutdent: \(errmsg)")
            return
        }
        
        let resultAlert = UIAlertController(title: "결과", message: "수정 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func bnDelete(_ sender: UIButton) {
        
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) //****************한글깨지기 방지
        
        let id = String(tfId.text!).trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "DELETE FROM students WHERE sid=?"
        
        // 인스턴스 중에 pointer 로 된부분이 있다 >> &stmt
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 1, id, -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding id: \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("fail inserting sutdent: \(errmsg)")
            return
        }
        
        let resultAlert = UIAlertController(title: "결과", message: "삭제 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
    }
    
    func receiveItems(_ id: Int, _ name: String, _ dept: String, _ phone: String){
        receiveId =  id
        receiveName = name
        receiveDept = dept
        receivePhone = phone
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
