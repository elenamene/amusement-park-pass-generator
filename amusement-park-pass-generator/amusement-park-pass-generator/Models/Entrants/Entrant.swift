//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

enum EntrantType: String {
    case classicGuest = "Classic Guest"
    case vipGuest = "VIP Guest"
    case freeChildGuest = "Free Child Guest"
    case hourlyEmployeeFoodServices = "Hourly Employee - Food Services"
    case hourlyEmployeeRideServices = "Hourly Employee - Ride Services"
    case hourlyEmployeeMaintenance = "Hourly Employee - Maintenance"
    case manager = "Manager"
}

protocol Entrant {
    var entrantType: EntrantType { get }
    var accessPass: Pass? { get set }
}

// MARK: - Entrant Validation

extension Entrant {
    func isValidEntrant() -> Bool {
        do {
            if let entrant = self as? Nameable {
                try entrant.hasValidName()
            }
            if let entrant = self as? Addressable {
                try entrant.hasValidAddress()
            }
            if let entrant = self as? Ageable {
                try entrant.hasValidDateOfBirth()
            }
            if let entrant = self as? SSNIdentifiable {
                try entrant.hasValidSSN()
            }
        } catch let error as EntrantError {
            print(error.rawValue)
            return false
        } catch {
            fatalError("Unexpected error: \(error).")
        }
        
        return true
    }
}

// MARK: -  Entrant swipe methods implementation

enum AccessValidation: String {
    case pass = "Access Permitted"
    case fail = "Access Denied"
}

extension Entrant {
    func swipePass(atRestrictedArea area: ParkArea) -> AccessValidation {
        if let pass = self.accessPass, pass.areasPermitted.contains(area) {
            print(AccessValidation.pass.rawValue)
            return AccessValidation.pass
        } else {
            print(AccessValidation.fail.rawValue)
            return AccessValidation.fail
        }
    }
    
    func swipePassAtRide() -> [RideAccess]? {
        guard let pass = self.accessPass else { return nil }
        
        let ridePriviledges = pass.rideAccess.map { $0.rawValue }
        print("Ride access: \(ridePriviledges)")
        
        return pass.rideAccess
    }
    
    func swipePassAtCashRegister() -> Discount? {
        guard let pass = self.accessPass else { return nil }
        
        if let discount = pass.discount {
            print("Discount: \(discount)")
        } else {
            print("No Discunt Available")
        }

       return pass.discount
    }
}

