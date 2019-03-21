//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

import Foundation

enum GuestType {
    case classic
    case vip
    case freeChild
    //        case seasonPass
    //        case senior
}

// MARK: - Protocol Guest

protocol Guest: Entrant {
    var type: GuestType { get }
}

extension Guest {
    var entrantType: EntrantType {
        switch self.type {
        case .classic: return .classicGuest
        case .vip: return .vipGuest
        case .freeChild: return .freeChildGuest
        }
    }
}

// MARK: - Structs Guest

struct ClassicGuest: Guest {
    var type: GuestType = .classic
}

struct VIPGuest: Guest {
    var type: GuestType = .vip
}

struct FreeChildGuest: Guest, Ageable {
    var type: GuestType = .freeChild
    var dateOfBirth: Date?
    
    init?(dateOfBirth: Date) {
        guard dateOfBirth.age() >= 5 else {
            print(EntrantError.invalidAge.rawValue)
            return
        }
        
        self.dateOfBirth = dateOfBirth
    }
}


