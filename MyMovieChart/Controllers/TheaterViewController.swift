//
//  TheaterViewController.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2020/02/01.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit
import MapKit

class TheaterViewController: UIViewController {
    
    // 전달 되는 데이터를 받을 변수
    var param: NSDictionary!
    
    // MapKit View 프로퍼티 선언.
    @IBOutlet var map: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.title = self.param["상영관명"] as? String
        
        // 1. 위도와 경도를 추출하여 Double값으로 캐스팅.
        let lat = (param?["위도"] as! NSString).doubleValue
        let lng = (param?["경도"] as! NSString).doubleValue
        
        // 2. 위도와 경도를 인수로 하는 2D 위치 정보 객체 정의
        let location = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        // 3. 지도에 표현될 거리: 값의 단위는 미터
        let regionRadius: CLLocationDistance = 100
        
        // 4. 거리를 반영한 지역 정보를 조합한 지도 데이터 생성
        let coordinateRegion = MKCoordinateRegion(center: location, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        // 5. map 변수에 연결된 지도 객체에 데이터를 전달하여 화면에 표시
        self.map.setRegion(coordinateRegion, animated: true)
        
        // 위치를 표시해줄 객체 생성, 앞에서 작성해준 위치값 객체를 할당
        let point = MKPointAnnotation()
        point.coordinate = location
        
        // 위치 표현값 추가
        self.map.addAnnotation(point)

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
