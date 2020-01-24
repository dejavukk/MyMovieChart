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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    // 목록 화면에서 전달하는 영화를 받을 변수 선언
    var mvo: MovieVO!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // WKNavigationDelegate의 델리게이트 객체를 지정
        self.webView.navigationDelegate = self
        
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

// MARK : - WKNavigationDelegate 프로토콜 구현
extension DetailViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        
        // 인디케이터뷰의 애니메이션 실행
        self.spinner.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
        // 인디케이트뷰의 애니메이션 중단
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        // 인디케이터 뷰의 애니메이션 중지
        self.spinner.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        
        // 인디케이터 뷰의 애니메이션 중지
        self.spinner.stopAnimating()
        
        // 경고창 형식으로 오류 메시지 표시
        self.alert("상세 페이지를 읽어오지 못했습니다.") {
            
            // 버튼 탭할 시, 이전화면으로 보낸다.
            _ = self.navigationController?.popViewController(animated: true)
        }
        
        
        /*
        let alert = UIAlertController(title: "오류", message: "상세페이지를 읽어오지 못했습니다.", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "확인", style: .cancel) { (_) in
            
            // 이전화면으로 되돌려 보낸다.
            _ = self.navigationController?.popViewController(animated: true)
        }
        
        alert.addAction(cancelAction)
        self.present(alert, animated: false, completion: nil)
        */
    }
}

// MARK:- 심플한 경고창 함수 정의용 extenstion
extension UIViewController {
    
    func alert(_ message: String, onClick: (() -> Void)? = nil) {
        
        let controller = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "OK", style: .cancel) { (_) in
            onClick?()
        })
        DispatchQueue.main.sync {
            self.present(controller, animated: false)
        }
    }
}
