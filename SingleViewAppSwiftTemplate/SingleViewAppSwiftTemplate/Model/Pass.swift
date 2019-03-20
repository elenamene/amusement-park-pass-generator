//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation


//enum Pass {
//    case classicGuest
//    case VIPGuest
//    case FreeChildGuest
//    case hourlyEmployeeFoodServices // case hourlyEmployee(type: HourlyEmployeeType)
//    case hourlyEmployeeRideServices
//    case hourlyEmployeeMaintenance
//    case manager
//}

struct Pass {
    let passType: EntrantType
}

extension Pass {
    var areasPermitted: [ParkArea] {
        switch self.passType {
        case .hourlyEmployeeFoodServices: return [.amusement, .kitchen]
        case .hourlyEmployeeRideServices: return [.amusement, .rideControl]
        case .hourlyEmployeeMaintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
        case .manager: return [.amusement, .kitchen, .rideControl, .maintenance, .office]
        default: return [.amusement]
        }
    }
    
    var rideAccess: [RideAccess] {
        switch self.passType {
        case .VIPGuest: return [.accessAllRides, .skipAllRidesLines]
        default: return [.accessAllRides]
        }
    }
    
    var discount: Discount {
        switch self.passType {
        case .VIPGuest: return Discount(onFood: 10, onMerchandise: 20)
        case .hourlyEmployeeFoodServices, .hourlyEmployeeRideServices, .hourlyEmployeeMaintenance: return Discount(onFood: 15, onMerchandise: 25)
        case .manager: return Discount(onFood: 25, onMerchandise: 25)
        default: return Discount(onFood: 0, onMerchandise: 0)
        }
    }
}

extension Pass: CustomStringConvertible {
    var description: String {
        return "Areas permitted: \(areasPermitted)\n Ride access: \(rideAccess)\n Discount: \(discount)"
    }
}
