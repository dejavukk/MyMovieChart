//
//  ListViewController.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2019/12/30.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit

class ListViewContoller: UITableViewController {
    
    // 튜플 아이템을 가진 배열로 정의된 데이터 세트
    var dataset = [
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95, "darknight.jpg"),
        ("호우시절", "때를 알고 내리는 좋은 비.", "2009-10-08", 7.31, "rain.jpg"),
        ("말할 수 없는 비밀", "대만 청춘 로맨스, 너까지 다섯 걸음.", "2015-05-07", 9.19, "secret.jpg")
    ]
    
    // 테이블 뷰를 구성할 리스트 데이터
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()

        for (title, desc, opendate, rating, thumbnail) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            mvo.thumbnail = thumbnail
            
            datalist.append(mvo)
        }
        return datalist
    }()
    
    override func viewDidLoad() {
        
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
