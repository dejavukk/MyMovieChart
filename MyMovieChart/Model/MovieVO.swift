//
//  MovieVO.swift
//  MyMovieChart
//
//  Created by JunHyuk on 2019/12/30.
//  Copyright © 2019 junhyuk. All rights reserved.
//

import UIKit

class MovieVO {
    
    // 영화의 정보 -> 섬네일 이미지 주소, 제목, 설명, 상세정보, 개봉일, 평점
    // 영화정보를 담기 위한 프로퍼티
    var thumbnail: String?
    var title: String?
    var description: String?
    var detail: String?
    var opendate: String?
    var rating: Double?
    
    // 영화 썸네일 이미지를 담을 UIImage 객체를 추가한다.
    var thumbnailImage: UIImage?
    
    /*
     VO : ValueObject패턴 -> 데이터 저장을 전담하는 클래스를 별도로 분리하는 설계방식
     객체지향에서 매우 자주 활용하는 방식.
     
     */
}
