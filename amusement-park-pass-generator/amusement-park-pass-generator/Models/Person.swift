//
//  Person.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

struct Address {
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
}

// Protocols for personal info requested

protocol Nameable {
    var firstName: String { get }
    var lastName: String { get }
}

protocol Addressable {
    var address: Address { get }
}

protocol Ageable {
    var dateOfBirth: Date? { get }
}

