//
//  TableViewController.swift
//  SQLite
//
//  Created by SooHoon on 2021/07/27.
//

import UIKit
import SQLite3 // *************

//var studentsList: Array<String> = []

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    var db: OpaquePointer?
    var studentsList: [Students] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //SQLite 생성하기
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("StudentsData1.sqlite") // 파일은 filemanager가 관리하니까 FileManager. 내 앱에다가 쓸거니까 default
        print(fileURL)
        // 인스턴스 중에 pointer 로 된부분이 있다 >> &db
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("error opening database")
        }
        
        if sqlite3_exec(db, "CREATE TABLE IF NOT EXISTS students(sid INTEGER PRIMARY KEY AUTOINCREMENT, sname TEXT, sdept TEXT, sphone TEXT)", nil, nil, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error creating table : \(errmsg)")
        }
        
        //Temporary Insert // 한번실행하고 막아주지 않으면 계속 실행한다.
//        tempInsert()
        
        // DB 내용 불러오기
        readValues()
    } // ViewDidLoad

    override func viewWillAppear(_ animated: Bool) {
        readValues()
    }
    
    func tempInsert(){
        var stmt: OpaquePointer?
        let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self) //****************한글깨지기 방지
        
        let queryString = "INSERT INTO students (sname, sdept, sphone) VALUES (?,?,?)"
        
        // 인스턴스 중에 pointer 로 된부분이 있다 >> &stmt
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        //에러 방지
        if sqlite3_bind_text(stmt, 1, "유비", -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding name: \(errmsg)")
            return
        }
        
        
        if sqlite3_bind_text(stmt, 2, "컴퓨터공학과", -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding dept: \(errmsg)")
            return
        }
        
        if sqlite3_bind_text(stmt, 3, "1234", -1 /*한글때문에*/, SQLITE_TRANSIENT) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error binding phone: \(errmsg)")
            return
        }
        
        if sqlite3_step(stmt) != SQLITE_DONE{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("fail inserting sutdent: \(errmsg)")
            return
        }
        
        print("Students succesfully saved")
        
    }
    
    func readValues(){
        studentsList.removeAll()
        
        let queryString = "SELECT * FROM students"
        
        var stmt: OpaquePointer?
        
        // prepare시작
        if sqlite3_prepare(db, queryString, -1, &stmt, nil) != SQLITE_OK{
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing select: \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let id = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            let dept = String(cString: sqlite3_column_text(stmt, 2))
            let phone = String(cString: sqlite3_column_text(stmt, 3))
            
            print(id, name, phone)
            
            // 이상 없으면 배열에 넣어주자!
        
            studentsList.append(Students(id: Int(id), name: String(describing: name), dept: String(describing: dept), phone: String(describing: phone)))
        }
        
        // 재 구성
        self.tvListView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        let students: Students
        students = studentsList[indexPath.row]
        
        cell.textLabel?.text = "학번 : \(students.id)"
        cell.detailTextLabel?.text = "성명 : \(students.name!)"
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            studentsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    // 삭제 시 문구 한글로 '삭제'
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            
            detailView.receiveItems(studentsList[indexPath!.row].id, studentsList[indexPath!.row].name!, studentsList[indexPath!.row].dept!, studentsList[indexPath!.row].phone!)
        }
    }
    

}
