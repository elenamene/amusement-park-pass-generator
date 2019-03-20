//
//  Person.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

protocol Nameable {
    var firstName: String { get }
    var lastName: String { get }
}

protocol Addressable {
    var streetAddress: String { get }
    var city: String { get }
    var state: String { get }
    var zipCode: String { get }
}

protocol Ageable {
    var dateOfBirth: String { get }
}

