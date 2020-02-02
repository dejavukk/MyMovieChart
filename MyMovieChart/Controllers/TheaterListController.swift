//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2020/01/27.
//  Copyright © 2020 junhyuk. All rights reserved.
//

import UIKit

class TheaterListController: UITableViewController {
    
    // API를 통해 불러온 데이터를 저장할 배열 변수
    var list = [NSDictionary]()
    
    // 읽어올 데이터의 시작위치
    var startPoint = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // API 호출한다
        self.callTheaterAPI()
    }

    func callTheaterAPI() {
        
        // 1. URL을 구성하기 위한 상수값 선언
        let requestURL = "http://swiftapi.rubypaper.co.kr:2029/theater/list"
        let sList = 100 // 데이터 갯수
        let type = "json"   // 데이터 형식
        
        // 2. 파라미터값들을 모아 URL객체로 정의.
        let urlObj = URL(string: "\(requestURL)?s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)")

        
        do {
            
            // 3. NSString객체를 이용하여 API를 호출하고 그 결과값을 인코딩된 문자열로 받아온다.
            let stringData = try NSString(contentsOf: urlObj!, encoding: 0x80_000_422)
            
            // 4. 문자열로 받은 데이터를 UTF-8로 인코딩한 처리한 Data로 변환한다.
            let encdata = stringData.data(using: String.Encoding.utf8.rawValue)
            
            do {
                // 5. Data 객체를 파싱하여 NSArray 객체로 변환한다.
                let apiArray = try JSONSerialization.jsonObject(with: encdata!, options: []) as? NSArray
                
                // 6. 읽어온 데이터를 순회하면서 self.list 배열에 추가한다.
                for obj in apiArray! {
                    
                    self.list.append(obj as! NSDictionary)
            }
            
        } catch {
            // 경고창 형식으로 오류메시지 표시.
            let alert = UIAlertController(title: "실패", message: "데이터 분석에 실패하였습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
            
            }
            // 7. 읽어와야 할 다음 페이지의 데이터
            self.startPoint += sList
        
        } catch {
            // 경고창 형식으로 오류 메시지를 표시해준다.
            let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "확인", style: .cancel))
            self.present(alert, animated: false)
    
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.list.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // self.list 배열에서 행에 맞는 데이터 추출
        let obj = self.list[indexPath.row]
        
        // 재사용큐로부터 tCell 식별자에 맞는 셀 객체 전달받음
        let cell = tableView.dequeueReusableCell(withIdentifier: "tCell") as! TheaterCell
        cell.mPlexName?.text = obj["상영관 이름"] as? String
        cell.mPlexTel?.text = obj["연락처"] as? String
        cell.mPlexAdd?.text = obj["소재지도로명주소"] as? String
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "segue_map") {
            
            let path = self.tableView.indexPath(for: sender as! UITableViewCell)
            
            let data = self.list[path!.row]
            
            (segue.destination as? TheaterViewController)?.param = data
            
            
        }
    }
}
