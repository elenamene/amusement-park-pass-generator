//
//  Pass.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

struct Pass {
    let passHolder: Entrant
    
    init(for entrant: Entrant) {
        self.passHolder = entrant
    }
}

extension Pass {
    var areasPermitted: [ParkArea] {
        switch self.passHolder.entrantType {
        case .hourlyEmployeeFoodServices: return [.amusement, .kitchen]
        case .hourlyEmployeeRideServices: return [.amusement, .rideControl]
        case .hourlyEmployeeMaintenance: return [.amusement, .kitchen, .rideControl, .maintenance]
        case .manager: return [.amusement, .kitchen, .rideControl, .maintenance, .office]
        default: return [.amusement]
        }
    }
    
    var rideAccess: [RideAccess] {
        switch self.passHolder.entrantType {
        case .vipGuest: return [.accessAllRides, .skipAllRidesLines]
        default: return [.accessAllRides]
        }
    }
    
    var discount: Discount? {
        switch self.passHolder.entrantType {
        case .vipGuest: return Discount(onFood: 10, onMerchandise: 20)
        case .hourlyEmployeeFoodServices, .hourlyEmployeeRideServices, .hourlyEmployeeMaintenance:
            return Discount(onFood: 15, onMerchandise: 25)
        case .manager: return Discount(onFood: 25, onMerchandise: 25)
        default: return nil
        }
    }
}

extension Pass: CustomStringConvertible {
    var description: String {
        let areasPermittedString = areasPermitted.map { $0.rawValue }
        let rideAccessString = rideAccess.map { $0.rawValue }
        
        var discountDescription: String {
            if let discount = self.discount {
                return discount.description
            } else {
                return "No Discunt Available"
            }
        }
       
        return "******************************************************\nPass holder: \(passHolder.entrantType.rawValue)\nAreas permitted: \(areasPermittedString)\nRide access: \(rideAccessString)\nDiscount: \(discountDescription)))\n******************************************************"
    }
}
