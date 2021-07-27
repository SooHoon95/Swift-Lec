//
//  AddViewController.swift
//  SQLite
//
//  Created by SooHoon on 2021/07/27.
//

import UIKit
import SQLite3

class AddViewController: UIViewController {

    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    
    var db: OpaquePointer?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // SQLite 연결
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData1.sqlite") // 파일은 filemanager가 관리하니까 FileManager. 내 앱에다가 쓸거니까 default
        print(fileURL)
        // 인스턴스 중에 pointer 로 된부분이 있다 >> &db
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) // *****
        
        let name = tfName.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let dept = tfDept.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let phone = tfPhone.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
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
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("fail inserting sutdent: \(errmsg)")
            return
        }
        
        let resultAlert = UIAlertController(title: "결과", message: "입력 되었습니다.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            self.navigationController?.popViewController(animated: true)
        })
        
        resultAlert.addAction(okAction)
        present(resultAlert, animated: true, completion: nil)
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
