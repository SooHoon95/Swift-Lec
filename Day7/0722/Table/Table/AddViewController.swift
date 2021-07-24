//
//  AddViewController.swift
//  Table
//
//  Created by SooHoon on 2021/07/22.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append("clock.png")
        navigationController?.popViewController(animated: true)
        // 여기까지만 하면 화면 넘어갔을 때 아무것도 안바뀜 >> 안드로이드랑 똑같이 라이프 싸이클의 문제. 즉, 화면이 뒤로갔다가 다시 뜰때 실행하는 함수를 TavleViewController에 넣어줘야한다.
    }
    
    /*
    // MARK: - Navigation
     // 왜 프리페어 또 있지?? >> 여기서 또 다른 화면으로 넘어갈 수도 있으니까.
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
