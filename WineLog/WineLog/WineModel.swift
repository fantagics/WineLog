//
//  WineModel.swift
//  WineLog
//
<<<<<<< HEAD
//  Created by 순진이 on 2022/10/04.
//

import UIKit
=======
//  Created by 이태형 on 2022/10/05.
//

import Foundation
>>>>>>> 995dd743c252ec13e9e2e7d84e70795000d6e74a

enum WineType: Codable{
    case white
    case red
    case rose
}

struct WineInformation: Codable{
    var id: Int  //수정 및 삭제시 필요
    var type: WineType
    var profileData: Data  //이미지 Data
    var name: String
    var manufacturingDate: String?  //제조일
    var manufacturingContry: String?  //제조국
    var boughtPlace: String?  //구매처
<<<<<<< HEAD
    var boughtDate: String?
    var price: Int?  //가격
    var totalStar: Double  //총평
    var sugarStar: Double? //당도
=======
    var price: Int?  //가격
    var totalStar: Double  //총평
    var sugarStar: Double  //당도
>>>>>>> 995dd743c252ec13e9e2e7d84e70795000d6e74a
    var acidityStar: Double  //산도
    var bodyStar: Double  //바디감
    var comment: String?  //한줄평
}
