//
//  Date.swift
//  amusement-park-pass-generator
//
//  Created by Elena Meneghini on 21/03/2019.
//  Copyright © 2019 Elena Meneghini. All rights reserved.
//

import Foundation

// Date extension to calculate age

extension Date {
    func age() -> Int {
        let now = Date()
        return Calendar.current.dateComponents([.year], from: self, to: now).year!
    }
}
