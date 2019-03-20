//
//  Employee.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

class Employee: Nameable, Addressable, Ageable {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var dateOfBirth: String
    
    var socialSecurityNumber: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, dateOfBirth: String, socialSecurityNumber: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.dateOfBirth = dateOfBirth
        self.socialSecurityNumber = socialSecurityNumber
    }
}

// MARK: - HourlyEmployeeType

enum HourlyEmployeeType {
    case foodServices
    case rideServices
    case maintenance
}

class HourlyEmployee: Employee, Entrant {
    var hourlyEmployeeType: HourlyEmployeeType
    
    var entrantType: EntrantType {
        switch hourlyEmployeeType {
        case .foodServices: return .hourlyEmployeeFoodServices
        case .rideServices: return .hourlyEmployeeRideServices
        case .maintenance: return .hourlyEmployeeMaintenance
        }
    }
    
    var accessPass: Pass?
    
    init(_ type: HourlyEmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, dateOfBirth: String, socialSecurityNumber: String) {
        self.hourlyEmployeeType = type
        
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth, socialSecurityNumber: socialSecurityNumber)
    }
}

// MARK: - Manager

enum ManagerTier {
    case shiftManager
    case generalManager
    case seniorManager
}

class Manager: Employee, Entrant {
    var tier: ManagerTier
    var entrantType: EntrantType = .manager
    
    var accessPass: Pass?
    
    init(at tier: ManagerTier, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, dateOfBirth: String, socialSecurityNumber: String) {
        self.tier = tier
        
        super.init(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, dateOfBirth: dateOfBirth, socialSecurityNumber: socialSecurityNumber)
    }
}
