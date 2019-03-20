//
//  Guest.swift
//  SingleViewAppSwiftTemplate
//
//  Created by Elena Meneghini on 19/03/2019.
//  Copyright © 2019 Treehouse. All rights reserved.
//

enum GuestType {
    case classic
    case vip
    case freeChild
}

class freeChild: Entrant, Ageable {
    var dateOfBirth: String
    var accessPass: Pass?
    let entrantType: EntrantType = .FreeChildGuest
    
    init(<#parameters#>) {
        <#statements#>
    }
}
