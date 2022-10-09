//
//  ETInt.swift
//  WineLog
//
//  Created by 서은지 on 2022/10/07.
//

import UIKit

extension Int{
    func toDecimalFormat()-> String{
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        guard let price = formatter.string(for: self)else{
            return "Formatter Error"
        }
        return price
    }
}
