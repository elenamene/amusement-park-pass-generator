//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

protocol Employable: Nameable, Addressable, Ageable {
    var socialSecurityNumber: String { get }
}

// MARK: - HourlyEmployeeType

struct HourlyEmployee: Employable {
    var firstName: String
    var lastName: String
    var address: Address
    var dateOfBirth: Date?
    var socialSecurityNumber: String
    
    enum Service {
        case foodServices
        case rideServices
        case maintenance
    }
    
    var service: Service
}

extension HourlyEmployee: Entrant {
    var entrantType: EntrantType {
        switch self.service {
        case .foodServices: return .hourlyEmployeeFoodServices
        case .rideServices: return .hourlyEmployeeRideServices
        case .maintenance: return .hourlyEmployeeMaintenance
        }
    }
}

// MARK: - Manager

struct Manager: Employable {
    var firstName: String
    var lastName: String
    var address: Address
    var dateOfBirth: Date?
    var socialSecurityNumber: String
    
    enum ManagerTier {
        case shiftManager
        case generalManager
        case seniorManager
    }
    
    var tier: ManagerTier
}

extension Manager: Entrant {
    var entrantType: EntrantType {
        return .manager
    }
}

// MARK: - Contract Employee
