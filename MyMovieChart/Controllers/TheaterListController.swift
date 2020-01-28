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
        }
        
        do {
            
            
            
        } catch {
            
            
        }
        
        
        
    }

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
