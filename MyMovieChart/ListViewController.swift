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
        ("다크나이트", "영웅물에 철학에 음악까지 더해져 예술이 되다.", "2008-09-04", 8.95),
        ("호우시절", "때를 알고 내리는 좋은 비.", "2009-10-08", 7.31),
        ("말할 수 없는 비밀", "대만 청춘 로맨스, 너까지 다섯 걸음.", "2015-05-07", 9.1)
    ]
    
    // 테이블 뷰를 구성할 리스트 데이터
    
    lazy var list: [MovieVO] = {
        var datalist = [MovieVO]()

        for (title, desc, opendate, rating) in self.dataset {
            let mvo = MovieVO()
            mvo.title = title
            mvo.description = desc
            mvo.opendate = opendate
            mvo.rating = rating
            
            datalist.append(mvo)
        }
        return datalist
        
    }()
    
    override func viewDidLoad() {
        
    }
    
}
