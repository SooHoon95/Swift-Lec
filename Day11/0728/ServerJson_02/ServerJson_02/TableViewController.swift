//
//  TableViewController.swift
//  ServerJson_02
//
//  Created by SooHoon on 2021/07/28.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    @IBOutlet var listTableView: UITableView!
    
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let jsonModel = JsonModel() // 인스턴스 만드는 중
        jsonModel.delegate = self
        jsonModel.downloadItems()
        
        // 0727 ServerJson 이랑 다른부분. 하나 추가.
        // Cell의 크기를 정한다.
        listTableView.rowHeight = 124 // 굳이 사이즈 인스펙터에서 해줄 필요없다.
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feedItem.count
    }

    // cell 디자인
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) /*여기부분 추가********/ as! TableViewCell // 이걸쓰면 나는 테이블 뷰쎌로 가지고 오겠다라는 뜻.

        // Configure the cell...
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
    /* 여기가 이제 테이블뷰쎌에서 정한 이름으로 바꿔야한다.
//        cell.textLabel?.text = "성명 : \(item.sname)"
//        cell.detailTextLabel?.text = "학번 : \(item.scode)"
 */
        cell.lblCOde.text = "학번 : \(item.scode!)"
        cell.lblName.text = "학번 : \(item.sname!)"
        cell.lblDept.text = "학번 : \(item.sdept!)"
        cell.lblPhone.text = "학번 : \(item.sphone!)"
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TableViewController: JsonModelProtocol{
    func itemDownloaede(items: NSArray) {
        feedItem = items
        self.listTableView.reloadData()
    }
}
