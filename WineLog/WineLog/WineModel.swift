//
//  WineModel.swift
//  WineLog
//
//  Created by 순진이 on 2022/10/04.
//

import UIKit

struct WineModel {
    // 와인이름
    let wineName: String
    // 와인종류
    let kindOfWine: String
    // 산지
    let countryOfOrigin: String
    
    // 제조일
    let yearOfMaking: String
    // 시음 날짜
    let dateToDrink: String
    // 별점 (당도, 산도, 바디)
    let gradeOfWine: String

    // 구매처
    let storeToBuy: String
    // 가격
    let priceOfWine: String
    // 한줄평
    let reviewOfWine: String
}
