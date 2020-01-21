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
        
        NSLog("linkurl = \(self.mvo.detail!), title = \(self.mvo.title!)")
        
        // 내비게이션바 타이틀에 영화제목을 출력
        let navbar = self.navigationItem
        navbar.title = self.mvo.title
        
        // 예외처리관련 코드. URL이 잘못되었거나, 값이 누락되었거나.
        if let url = self.mvo.detail {
            if let urlObj = URL(string: url) {
                let req = URLRequest(url: urlObj)
                self.webView.load(req)
                
            } else {
                
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다.", preferredStyle: .alert)
                
                let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                    _ = self.navigationController?.popViewController(animated: true)
                }
                
                alert.addAction(cancelAction)
                self.present(alert, animated: false, completion: nil)
            }
            
        } else {
            
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다.", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
                
                _ = self.navigationController?.popViewController(animated: true)
            }
            
            alert.addAction(cancelAction)
            self.present(alert, animated: false, completion: nil)
        }
        
        // URLRequest 인스턴스 생성
        let url = URL(string: (self.mvo.detail)!)
        let req = URLRequest(url: url!)
        
        // loadRequest 메소드 호출, req를 파라미터값으로 전달.
        
        
        self.webView.load(req)
        
    }
    

}
