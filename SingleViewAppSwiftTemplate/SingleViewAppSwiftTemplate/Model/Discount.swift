//
//  Discount.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

struct Discount {
    typealias Percentage = Int
    
    var food: Percentage
    var merchandise: Percentage

    init(onFood foodDiscount: Percentage, onMerchandise merchandiseDiscount: Percentage) {
        self.food = foodDiscount
        self.merchandise = merchandiseDiscount
    }
}

extension Discount: CustomStringConvertible {
    var description: String {
        return "\(food) Discount on food, \(merchandise) discount on merchandise"
    }
}