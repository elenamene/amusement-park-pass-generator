//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

enum EntrantType {
    case classicGuest
    case vipGuest
    case freeChildGuest
    case hourlyEmployeeFoodServices // case employee(type: hourlyEmployee)
    case hourlyEmployeeRideServices
    case hourlyEmployeeMaintenance
    case manager                    // case employee(type: manager)
}

protocol Entrant {
    var entrantType: EntrantType { get }
}

// Entrant pass implementation

extension Entrant {
    var accessPass: Pass {
        return Pass(passHolder: self.entrantType)
    }
}

// Entrant swipe methods implementation

enum AccessValidation: String {
    case pass = "Access Permitted"
    case fail = "Access Denied"
}

extension Entrant {
    func swipePass(atRestrictedArea area: ParkArea) {
        if accessPass.areasPermitted.contains(area) {
            print(AccessValidation.pass.rawValue)
        } else {
            print(AccessValidation.fail.rawValue)
        }
    }
    
    func swipePass(at: Ride) {
        for rideAccessPriviledge in accessPass.rideAccess {
            print(rideAccessPriviledge.rawValue)
        }
    }
    
    func swipePass(at: CashRegister) {
        print(accessPass.discount)
    }
}

