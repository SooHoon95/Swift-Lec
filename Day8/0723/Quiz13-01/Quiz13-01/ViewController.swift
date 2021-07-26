//
//  ViewController.swift
//  Quiz13-01
//
//  Created by SooHoon on 2021/07/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let myLoc = CLLocationManager()
    var name = ["혜화문", "흥인지문", "창의문", "숙정문"]
    var code = [("37.5878892", "127.0037098"), ("37.5711907", "127.00950"), ("37.5926027", "127.9664771"), ("37.5956584", "127.9810576")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = name[0]
        
        //pageControl
        pageControl.numberOfPages = name.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        myLoc.delegate = self
        myLoc.requestWhenInUseAuthorization() // 승인 허용 문구 받아서 처리
        myLoc.startUpdatingLocation() // GPS 좌표 받기 시작
        mapMove(CLLocationDegrees(code[pageControl.currentPage].0)!, CLLocationDegrees(code[pageControl.currentPage].1)!, name[pageControl.currentPage])
    }

    @IBAction func pageChane(_ sender: UIPageControl) {
        mapMove(CLLocationDegrees(code[pageControl.currentPage].0)!, CLLocationDegrees(code[pageControl.currentPage].1)!, name[pageControl.currentPage])
//        print(test)
    }
    func mapMove(_ lat: CLLocationDegrees, _ lon: CLLocationDegrees, _ txt1: String){
        let pLoc = CLLocationCoordinate2DMake(lat, lon)
        //배율
        let pSpan = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        
        // 좌표 정보
        let pRegion = MKCoordinateRegion(center: pLoc, span: pSpan)
        
        // 현재 지도를 좌표정보로 보이기
        mapView.setRegion(pRegion, animated: true)
        
//        let addrLoc =  CLLocation(latitude: lat, longitude: lon)
        lblName.text = txt1
        setPoint(pLoc, txt1)
    }

    func setPoint(_ loc: CLLocationCoordinate2D, _ txt1: String){
        let pin = MKPointAnnotation()
        
        pin.coordinate = loc
        pin.title = txt1
//        pin.subtitle = txt2
        
        mapView.addAnnotation(pin)
    }
    
} //ViewController

extension ViewController: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let lastLoc = locations.last // 신호중에서 맨 끝에 잡은거
        // 지도보기
        mapMove((lastLoc?.coordinate.latitude)!, (lastLoc?.coordinate.longitude)!, "현재 위치")
        myLoc.stopUpdatingLocation() // 좌표 받기 중지
    }

}
