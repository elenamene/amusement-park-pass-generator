//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

// MARK: - Employable

protocol Employable: Nameable, Addressable, Ageable,SSNIdentifiable {
}

// MARK: - HourlyEmployeeType

class HourlyEmployee: Employable {
    var firstName: String
    var lastName: String
    var address: Address
    var dateOfBirth: Date?
    var socialSecurityNumber: String
    var accessPass: Pass?
    
    enum Service {
        case foodServices
        case rideServices
        case maintenance
    }
    
    var service: Service
    
    init(firstName: String, lastName: String, address: Address, dateOfBirth: Date, socialSecurityNumber: String, service: Service) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.dateOfBirth = dateOfBirth
        self.socialSecurityNumber = socialSecurityNumber
        self.service = service
    }
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

class Manager: Employable {
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
    var accessPass: Pass?
    
    init(firstName: String, lastName: String, address: Address, dateOfBirth: Date, socialSecurityNumber: String, tier: ManagerTier) {
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.dateOfBirth = dateOfBirth
        self.socialSecurityNumber = socialSecurityNumber
        self.tier = tier
    }
}

extension Manager: Entrant {
    var entrantType: EntrantType {
        return .manager
    }
}

// MARK: - Contract Employee
