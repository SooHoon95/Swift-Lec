//
//  ViewController.swift
//  CollectionView_Label
//
//  Created by SooHoon on 2021/07/26.
//

import UIKit

// 전체 변수 선언
var list = ["유비", "관우", "장비", "조조", "여포", "동탁", "초선", "손견", "장양", "손책"]

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //extension 잡아준거 다 넣어주기
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    // AddView 갔다가 다시 올 때 사라졌다가 다시 뜨는 게 아니라 뒤에 숨어있다가 그냥 다시 나오는 거기때문에, 그럴때 다시 리로드 하는 메소드를 실행시켜줘야한다.
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDetail"{
            // 몇번째를 클릭했는지를 알고 있는 애는  sender 그래서
            let cell = sender as! CollectionViewCell // 이렇게 해야 셀에 대한 정보르 가지고 온다.
            let indexPath = self.collectionView.indexPath(for: cell) // 셀정보가져오고. 셀에서 indexPath가 셀 의 몇번째인지에 대한 정보,
            let detailView = segue.destination as! DetailViewController // 실제적으로 세그를 통해서 인스턴스를 하나 만든 것이다.
            detailView.receiveItems(list[indexPath!.row])
        }
    }
    

} //ViewController

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate{// 한꺼번에 줘도 되고 따로따로 줘도 된다.
    
    //cell의 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // cell 구성
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell { // 백그라운드 색이나 그런 것들 다 설정할 수 있는 곳
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! CollectionViewCell // 마지막 CollectionViewCell는  타입 변환
        cell.backgroundColor = .lightGray
        cell.lblHuman.text = list[indexPath.row] // 여기까지 지금 '유비' 하나 들어갔고, 반복문 돌면서 계속 데이터 채운다. 리싸잌르러 뷰하고 똑같다고 보면 됌.
        
        cell.lblHuman.backgroundColor = .yellow
        
        return cell // type : CollectionViewCell
    }

}


    // Cell Layout 정의 >> 다시 viewcontroller 한테 알려줘야한다... 뭘?
extension ViewController: UICollectionViewDelegateFlowLayout{ // 배치에 대한 얘기

    // 위 아래 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1 // 나는 위아래 간격을 하나씩 띄울거야
    }
    
    // 옆 간격 // 컬렉션 뷰니까 옆에 간격도 신경써야한다,
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // cell 사이즈 정의 (옆 라인을 고려하여 설정) 내 왼,오 에 셀이 붙을 거니까 그거를 고려해서 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 한줄을 3등분 하여 배치, 옆 간격은 1 이므로 1을 빼준다.
        let width = collectionView.frame.width / 3 - 1
        let size = CGSize(width: width, height: width) // 가로세로 같은 정사각형으로 만들기
        return size
    }
    
}
