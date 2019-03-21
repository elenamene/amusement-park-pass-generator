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

