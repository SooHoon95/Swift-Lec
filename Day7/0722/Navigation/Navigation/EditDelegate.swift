//
//  EditDelegate.swift
//  Navigation
//
//  Created by SooHoon on 2021/07/22.
//

//Protoco : 자바의 interface 와 같다고 생각하면된다. 이름만 정의해주고 기능은 다른대서 가지고 있다.
protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String) // 누가 주는 메세지이냐면 에디트뷰 컨트롤러가주고 스트링으로 메세지를 주는 거다.
    func didImageOnOffDone(_ contorller: EditViewController, isOn: Bool)
}
