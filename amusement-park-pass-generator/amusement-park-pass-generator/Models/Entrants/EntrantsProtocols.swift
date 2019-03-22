//
//  PersonalInfoProtocols.swift
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

// MARK: - Nameable

protocol Nameable {
    var firstName: String { get }
    var lastName: String { get }
}

extension Nameable {
    func hasValidName() throws {
        guard !self.firstName.isEmpty else {
            throw EntrantError.invalidFirstName
        }
        guard !self.lastName.isEmpty else {
            throw EntrantError.invalidLastName
        }
    }
}

// MARK: - Addressable

protocol Addressable {
    var address: Address { get }
}

extension Addressable {
    func hasValidAddress() throws {
        guard !self.address.city.isEmpty else {
            throw EntrantError.invalidCity
        }
        guard !self.address.state.isEmpty else {
            throw EntrantError.invalidState
        }
        guard !self.address.streetAddress.isEmpty else {
            throw EntrantError.invalidStreetAddress
        }
        guard !self.address.zipCode.isEmpty else {
            throw EntrantError.invalidZipCode
        }
    }
}

// MARK: - Ageable

protocol Ageable {
    var dateOfBirth: Date? { get }
}

extension Ageable {
    func hasValidDateOfBirth() throws {
        guard self.dateOfBirth != nil else {
            throw EntrantError.invalidDateOfBirth
        }
        
        if let entrant = self as? FreeChildGuest, let dateOfBirth = entrant.dateOfBirth {
            let age = dateOfBirth.age()
            print("Age of the child: \(age)")
            
            guard age < 5 else {
                throw EntrantError.invalidAge
            }
        }
        
    }
}

// MARK: - SSNIdentifiable

protocol SSNIdentifiable {
    var socialSecurityNumber: String { get }
}

extension SSNIdentifiable {
    func hasValidSSN() throws {
        guard !self.socialSecurityNumber.isEmpty else {
            throw EntrantError.invalidSocialSecurityNumber
        }
    }
}
