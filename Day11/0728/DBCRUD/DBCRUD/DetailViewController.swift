//
//  DetailViewController.swift
//  DBCRUD
//
//  Created by SooHoon on 2021/07/28.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var receiveCode = ""
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tfCode.isUserInteractionEnabled = false
        receiveColumn(receiveCode, receiveName, receiveDept, receivePhone)
        tfCode.text = receiveCode
        tfName.text = receiveName
        tfDept.text = receiveDept
        tfPhone.text = receivePhone
        
    }
    
    func receiveColumn(_ code: String, _ name: String, _ dept: String, _ phone: String){
        receiveCode = code
        receiveName = name
        receiveDept = dept
        receivePhone = phone
        
       
    }
    
    
    @IBAction func btnModify(_ sender: UIButton) {
        let code = tfCode.text
        let name = tfName.text
        let dept = tfDept.text
        let phone = tfPhone.text
        
        let updateModel = UpdateModel()
        let result = updateModel.UpdateItems(code: code!, name: name!, dept: dept!, phone: phone!)
        
        if result{
            let resultAlert = UIAlertController(title: "완료", message: "수정이 완료됐습니다", preferredStyle: .alert)
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
    }
    
    @IBAction func btnDelete(_ sender: UIButton) {
        let code = tfCode.text
//        let name = tfName.text
//        let dept = tfDept.text
//        let phone = tfPhone.text
        
        let deleteModel = DeleteModel()
        let result = deleteModel.DeleteItems(code: code!)
        
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
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
