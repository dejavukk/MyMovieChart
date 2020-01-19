//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2019/12/30.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit

class ListViewContoller: UITableViewController {
    
    // 현재까지 읽어온 API데이터의 페이지 정보를 저장.
    var page = 1
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        
        var datalist = [MovieVO]()
        
        return datalist
    }()
    
    @IBOutlet var moreButtonOutlet: UIButton!
    @IBAction func moreButton(_ sender: UIButton) {
        
        self.page += 1
        self.callMovieAPI()
        self.tableView.reloadData()
        
    }
    
    // 중복된 코드 하나의 메소드로 구현
    func callMovieAPI() {
        
        // API를 호출하기 위한 URL생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=\(self.page)&count=30&genreId=&order=releasedateasc"
        let apiURL: URL! = URL(string: url)
        let apidata = try! Data(contentsOf: apiURL)
        
        /*
        A ?? B -> 만약 A가 nil이 아닐 경우 옵셔널을 해제하고, nil일 경우 대신 B값을 사용하라.
        */
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다."
        NSLog("API Result = \( log )")
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하여 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO객체에 저장한다.
            for row in movie {
                // 순회 상수를 NSDictionary
                let r = row as! NSDictionary
                
                // 테이블뷰 리스트를 구성할 데이터 형식
                let mvo = MovieVO()
                
                // movie 배열의 각 데이터를 mvo 상수의 속성에 대입
                mvo.title           = r["title"] as? String
                mvo.description     = r["genreNames"] as? String
                mvo.thumbnail       = r["thumbnailImage"] as? String
                mvo.detail          = r["linkUrl"] as? String
                mvo.rating          = ((r["ratingAverage"] as! NSString).doubleValue)
                
                self.list.append(mvo)
                
                let totalCount = (hoppin["totalCount"] as? NSString)!.integerValue
                if (self.list.count >= totalCount) {
                    self.moreButtonOutlet.isHidden = true
                }
                
            }
        } catch {
            NSLog("파싱이 되지 않았다.")
        }
    }
    
    
    override func viewDidLoad() {
        
        self.callMovieAPI()
        
    }
    
    // 테이블 뷰 행의 갯수를 반환하는 메소드.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    // 테이블 뷰 행 구성
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // 주어진 행에 맞는 데이터 소스를 읽어온다.
        let row = self.list[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MovieCell
        
        // 데이터 소스에 저장된 값을 각 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        
        // 섬네일 경로를 인자값으로 하는 URL 객체 생성
        let url: URL! = URL(string: row.thumbnail!)
        
        // 이미지를 읽어와 Data 객체에 저장
        let imageData = try! Data(contentsOf: url)
        
        // UIImage 객체를 생성하여 아울렛 변수의 image 속성 대입.
        cell.thumbnail.image = UIImage(data: imageData)
        
        // 셀 객체 반환
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    
}
