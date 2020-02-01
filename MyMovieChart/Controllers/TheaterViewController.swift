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
        
        self.navigationItem.title = self.param["상영관명"] as? String

        // Do any additional setup after loading the view.
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
