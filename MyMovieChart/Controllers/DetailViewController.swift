//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2020/01/19.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    
    // wv -> webView 
    @IBOutlet var webView: WKWebView!
    // 목록 화면에서 전달하는 영화를 받을 변수 선언
    var mvo: MovieVO!
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
