//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2019/12/30.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit

class ListViewContoller: UITableViewController {
    
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        
        var datalist = [MovieVO]()
        
        return datalist
    }()

    
    override func viewDidLoad() {
        
        // API 호출을 위한 URL생성
        let url = "http://swiftapi.rubypaper.co.kr:2029/hoppin/movies?version=1&page=1&count=10&genreId=&order=releasedateasc"
        
        let apiURI: URL! = URL(string: url)
        
        // REST API를 호출
        let apidata = try! Data(contentsOf: apiURI)
        
        // 데이터 전송 결과를 로그로 출력
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? ""
        NSLog("API Result = \( log )")
        
        /*
         A ?? B -> 만약 A가 nil이 아닐 경우 옵셔널을 해제하고, nil일 경우 대신 B값을 사용하라.
         */
        
        do {
            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary
            
            // 데이터 구조에 따라 차례대로 캐스팅하며 읽어온다.
            let hoppin = apiDictionary["hoppin"] as! NSDictionary
            let movies = hoppin["movies"] as! NSDictionary
            let movie = movies["movie"] as! NSArray
            
            // Iterator 처리를 하면서 API 데이터를 MovieVO 객체에 저장.
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
                
            }
        } catch {
            
        }
        

        
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
        // cell.textLabel?.text = row.title
        
        // 영화정보에 대한 정보 표시가 될 레이블 설정
        // let title = cell.viewWithTag(101) as? UILabel
        // let desc = cell.viewWithTag(102) as? UILabel
        // let opendate = cell.viewWithTag(103) as? UILabel
        // let rating = cell.viewWithTag(104) as? UILabel
        
        // 데이터 소스에 저장된 값을 각 레이블 변수에 할당
        cell.title?.text = row.title
        cell.desc?.text = row.description
        cell.opendate?.text = row.opendate
        cell.rating?.text = "\(row.rating!)"
        cell.thumbnail.image = UIImage(named: row.thumbnail!)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("선택된 행은 \(indexPath.row) 번째 행입니다.")
    }
    
    
}
