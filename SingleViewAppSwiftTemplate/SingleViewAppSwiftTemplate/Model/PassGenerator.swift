//
//  Kiosk.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

// Data Errors
enum EntrantError: Error {
    case invalidFirstName
    case invalidLastName
    case invalidStreetAddress
    case invalidCity
    case invalidState
    case invalidZipCode
    case invalidDateOfBirth
    case invalidSocialSecurityNumber
}

// Check for correct data and assign a pass to the Entrant
struct PassGenerator {
    func dataValidation(for entrant: Entrant) throws {
        
        if let nameableEntrant = entrant as? Nameable {
            guard !nameableEntrant.firstName.isEmpty else {
                throw EntrantError.invalidFirstName
            }
            guard !nameableEntrant.lastName.isEmpty else {
                throw EntrantError.invalidLastName
            }
        }
        
        if let addressableEntrant = entrant as? Addressable {
            guard !addressableEntrant.city.isEmpty else {
                throw EntrantError.invalidCity
            }
            guard !addressableEntrant.state.isEmpty else {
                throw EntrantError.invalidState
            }
            guard !addressableEntrant.streetAddress.isEmpty else {
                throw EntrantError.invalidStreetAddress
            }
            guard !addressableEntrant.zipCode.isEmpty else {
                throw EntrantError.invalidZipCode
            }
        }
        
        if let employeeEntrant = entrant as? Employee {
            guard !employeeEntrant.socialSecurityNumber.isEmpty else {
                throw EntrantError.invalidSocialSecurityNumber
            }
        }
        
        if let ageableEntrant = entrant as? Ageable {
            guard !ageableEntrant.dateOfBirth.isEmpty else {
                throw EntrantError.invalidDateOfBirth
            }
            // Check id free child guest
            // Free Child Guest must be under 5 years old
        }
        
    }
    
    func generatePass(for entrant: Entrant) -> Pass {
        // Validate data
        do {
            try dataValidation(for: entrant)
        } catch let error {
            print(error)
        }
        
        // Generate new pass
        let newPass = Pass(passType: entrant.entrantType)
        
        // Assign pass to entrant
        entrant.accessPass = newPass
        
        // Print Pass
        print(newPass)
    }
}


//extension Kiosk {
//    func employeeValidation() {}
//    func guestValidation() {}
//}
