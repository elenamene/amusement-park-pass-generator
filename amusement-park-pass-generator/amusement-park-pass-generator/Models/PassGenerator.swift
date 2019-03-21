//
//  Kiosk.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

struct PassGenerator {
    func getPass(for entrant: Entrant) {
        // Validate data
        do {
            try dataValidation(for: entrant)
        } catch let error as EntrantError {
            print(error.rawValue)
        } catch {
            fatalError("Unexpected error: \(error).")
        }
        
        // Generate new pass
        print(entrant.accessPass)
    }
}

extension PassGenerator {
    // Helper methods
    /// Check for correct data required for an Entrant passed as a paramenter.
    func dataValidation(for entrant: Entrant) throws {
        
        if let entrant = entrant as? Nameable {
            try validateName(for: entrant)
        }
        
        if let entrant = entrant as? Addressable {
            try validateAddress(for: entrant)
        }
        
        if let entrant = entrant as? Employable {
            try validateSocialSecurityNumber(for: entrant)
        }
        
        if let entrant = entrant as? Ageable {
            try validateDateOfBirth(for: entrant)
        }
        
    }
    
    func validateName(for entrant: Nameable) throws {
        guard !entrant.firstName.isEmpty else {
            throw EntrantError.invalidFirstName
        }
        guard !entrant.lastName.isEmpty else {
            throw EntrantError.invalidLastName
        }
    }
    
    func validateAddress(for entrant: Addressable) throws {
        guard !entrant.address.city.isEmpty else {
            throw EntrantError.invalidCity
        }
        guard !entrant.address.state.isEmpty else {
            throw EntrantError.invalidState
        }
        guard !entrant.address.streetAddress.isEmpty else {
            throw EntrantError.invalidStreetAddress
        }
        guard !entrant.address.zipCode.isEmpty else {
            throw EntrantError.invalidZipCode
        }
    }
    
    func validateSocialSecurityNumber(for entrant: Employable) throws {
        guard !entrant.socialSecurityNumber.isEmpty else {
            throw EntrantError.invalidSocialSecurityNumber
        }
    }
    
    func validateDateOfBirth(for entrant: Ageable) throws {
        guard entrant.dateOfBirth != nil else {
            throw EntrantError.invalidDateOfBirth
        }
    }
}

// Date extension to calculate age

extension Date {
    func age() -> Int {
        let now = Date()
        return Calendar.current.dateComponents([.year], from: self, to: now).year!
    }
}


//extension Kiosk {
//    func employeeValidation() {}
//    func guestValidation() {}
//}




