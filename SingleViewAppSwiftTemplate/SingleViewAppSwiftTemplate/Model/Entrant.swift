//
//  Entrant.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

enum EntrantType {
    case classicGuest
    case VIPGuest
    case FreeChildGuest
    case hourlyEmployeeFoodServices // case hourlyEmployee(type: HourlyEmployeeType)
    case hourlyEmployeeRideServices
    case hourlyEmployeeMaintenance
    case manager
}

protocol Entrant: class {
    var accessPass: Pass? { get set }
    var entrantType: EntrantType { get }
}

enum AccessValidation: String {
    case pass = "Access Permitted"
    case fail = "Access Denied"
}

// Entrant swipe methods implementation
extension Entrant {
    func swipe(_ pass: Pass, in restrictedArea: ParkArea) -> AccessValidation {
        
    }
    
    func swipe(_ pass: Pass, in ride: ) -> RideAccess {
        
    }
    
    func swipe(_ pass: Pass, in cashRegister: ) -> Discount {
        
    }
}

