//
//  AddPickerViewController.swift
//  Quiz17
//
//  Created by SooHoon on 2021/07/23.
//

import UIKit

class AddPickerViewController: UIViewController {

    @IBOutlet weak var tfInputName: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pickerImage: UIPickerView!
    
    var viewColumn = 1
    var maxArrayNum = 0
    var imageArray =  [UIImage?]()
    var selectedImage = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        maxArrayNum = itemsImageFile.count
        
        for i in 0..<maxArrayNum{
            imageArray.append(UIImage(named: itemsImageFile[i]))
        }
        
        imgView.image = imageArray[1]
        
        
//        pickerImage.i
        pickerImage.dataSource = self
        pickerImage.delegate = self
        
        pickerImage.selectRow(1, inComponent: 0, animated: true)
//        pickerImage.delegate?.pickerView?(pickerImage, didSelectRow: 2, inComponent: 2)
    }
    
    @IBAction func btnAddAction(_ sender: UIButton) {
        items.append(tfInputName.text!)
        itemsImageFile.append(selectedImage)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}// AddPickerViewController

extension AddPickerViewController: UIPickerViewDataSource{
    // PicerView의 컬럼 갯수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewColumn
    }
    
    // 출력할 이미지 파일 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return maxArrayNum
    }
    
    
}

extension AddPickerViewController: UIPickerViewDelegate{
//    //PickerView Title 입히기
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return itemsImageFile[row]
//    }
  
    //Picker View에 thumbnail 배치
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView =  UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 30  , height: 30) // 이미지 뷰의 프레임 크기 설정
               
               return imageView
    }
       
        //Picker View에 Image 선택
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            imgView.image = UIImage(named: itemsImageFile[row])
            selectedImage = itemsImageFile[row]
        }
 
}

