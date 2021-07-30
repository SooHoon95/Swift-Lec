//
//  TableViewController.swift
//  DBCRUD
//
//  Created by SooHoon on 2021/07/28.
//

import UIKit



class TableViewController: UITableViewController {

    @IBOutlet var listTableView: UITableView!
    
    var feedItem: NSArray = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //QueryModel , DBModel 다 형성하고 여기서 시작
//        let queryModel = QueryModel()
//        queryModel.delegate = self
//        queryModel.downloadItems()
//

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems()
        
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        // Cell은 따로 구성한거 없으니까 as! 쓸 필요 없다.
        
        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        cell.textLabel?.text = "성명 : \(item.sname!)"
        cell.detailTextLabel?.text = "학번 : \(item.scode!)"
        
//        columnArray.append("\(item.scode!)")
 

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

        let item: DBModel = feedItem[indexPath.row] as! DBModel
        
        if editingStyle == .delete {
            // Delete the row from the data source
            let code = item.scode!
    //        let name = tfName.text
    //        let dept = tfDept.text
    //        let phone = tfPhone.text
            
            let deleteModel = DeleteModel()
            let result = deleteModel.DeleteItems(code: code
            )
            
            if result{
                let resultAlert = UIAlertController(title: "완료", message: "삭제가 완료됐습니다", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    self.navigationController?.popViewController(animated: true)
                })
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)
                
            }else{
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생했습니다", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    self.navigationController?.popViewController(animated: true)
                })
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true, completion: nil)
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
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
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.listTableView.indexPath(for: cell)
            let colums: DBModel = feedItem[indexPath!.row] as! DBModel
            
            
            let detail = segue.destination as! DetailViewController
            detail.receiveColumn(colums.scode!, colums.sname!, colums.sdept!, colums.sphone!)
        }
            
        
    }
    

}


extension TableViewController: QueryModelProtocol{
    func itemDownloaede(items: NSArray) {
        feedItem = items
        self.listTableView.reloadData()
    }
}
