//
//  amusement_park_pass_generatorTests.swift
//  amusement-park-pass-generatorTests
//
//  Created by Elena Meneghini on 21/03/2019.
//  Copyright © 2019 Elena Meneghini. All rights reserved.
//

import XCTest
@testable import amusement_park_pass_generator

class amusement_park_pass_generatorTests: XCTestCase {
    let passBooth = PassBooth()
    
    var firstName: String = "Mark"
    var lastName: String = "Ross"
    
    var correctAddress = Address(streetAddress: "123 road", city: "London", state: "UK", zipCode: "SE123")
    var failingAddress = Address(streetAddress: "123 road", city: "London", state: "UK", zipCode: "")
    
    let SSN = "123456"
    
    var adultDateOfBirth = DateComponents(calendar: Calendar.current, year: 1987, month: 9, day: 24).date!
    var childDateOfBirth = DateComponents(calendar: Calendar.current, year: 2016, month: 1, day: 10).date!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK: - Tests to validate Classic Guest
    
    func testClassicGuest() {
        let guest: Entrant = ClassicGuest()
        
        // Test if info required are correct
        XCTAssertTrue(guest.isValidEntrant())
        
        // Test that at the moment of creation, guest has no pass
        XCTAssertNil(guest.accessPass)
        
        // Test that a pass is successfully assigned to the Entrant
        // and is of the same type of an entrant
        passBooth.assignPass(to: guest)
        XCTAssertTrue(guest.accessPass != nil)
        XCTAssertEqual(guest.accessPass?.passHolder.entrantType, .classicGuest)
        
        // Test access to amusement areas
        var validation: AccessValidation = guest.swipePass(atRestrictedArea: .amusement)
        XCTAssertEqual(validation, AccessValidation.pass, "Classic Guest must have access to amusement areas")
        
        // Test access to restricted areas
        validation = guest.swipePass(atRestrictedArea: .rideControl)
        XCTAssertEqual(validation, AccessValidation.fail, "Classic Guest must not have access to restricted areas")
        
        // Test discount availability
        let discount = guest.swipePassAtCashRegister()
        XCTAssertNil(discount) // Classic Guest must not have any discount
        
        // Test access to ride priviledges
        let ridePriviledges = guest.swipePassAtRide()
        XCTAssertEqual(ridePriviledges, [.accessAllRides], "Guest must have access to all rides")
    }
    
    // MARK: - Tests to validate VIP Guest
    
    func testIsValidVipGuest() {
        let guest: Entrant = VIPGuest()
        
        // Test if info required are correct
        XCTAssertTrue(guest.isValidEntrant())
        
        // Test that at the moment of creation, guest has no pass
        XCTAssertNil(guest.accessPass)
        
        // Test that a pass is successfully assigned to the Entrant
        // and is of the same type of an entrant
        passBooth.assignPass(to: guest)
        XCTAssertTrue(guest.accessPass != nil)
        XCTAssertEqual(guest.accessPass?.passHolder.entrantType, .vipGuest)
        
        // Test access to amusement areas
        var validation: AccessValidation = guest.swipePass(atRestrictedArea: .amusement)
        XCTAssertEqual(validation, AccessValidation.pass, "VIP Guest must have access to amusement areas")
        
        // Test access to restricted areas
        validation = guest.swipePass(atRestrictedArea: .office)
        XCTAssertEqual(validation, AccessValidation.fail, "VIP Guest must not have access to restricted areas")
        
        // Test discount availability
        let discount = guest.swipePassAtCashRegister()
        let discountExpected = Discount(onFood: 10, onMerchandise: 20)
        XCTAssertEqual(discount!, discountExpected, "VIP Guest must have 10% discount on food and 20% on merchandise")
        
        // Test access to ride priviledges
        let ridePriviledges = guest.swipePassAtRide()
        XCTAssertEqual(ridePriviledges, [.accessAllRides, .skipAllRidesLines], "Guest must have access to all rides and skip all ride lines")
    }
    
    // MARK: - Tests to validate Free Child Guest
    
    func testIsValidFreeChildGuest() {
        let guest: Entrant = FreeChildGuest(dateOfBirth: childDateOfBirth)
        
        // Test if info required are correct
        XCTAssertTrue(guest.isValidEntrant())
        
        // Test that at the moment of creation, guest has no pass
        XCTAssertNil(guest.accessPass)
        
        // Test that a pass is successfully assigned to the Entrant
        // and is of the same type of an entrant
        passBooth.assignPass(to: guest)
        XCTAssertTrue(guest.accessPass != nil)
        XCTAssertEqual(guest.accessPass?.passHolder.entrantType, .freeChildGuest)
        
        // Test access to amusement areas
        var validation: AccessValidation = guest.swipePass(atRestrictedArea: .amusement)
        XCTAssertEqual(validation, AccessValidation.pass, "Free Child Guest must have access to amusement areas")
        
        // Test access to restricted areas
        validation = guest.swipePass(atRestrictedArea: .maintenance)
        XCTAssertEqual(validation, AccessValidation.fail, "Free Child Guest must not have access to restricted areas")
        
        // Test discount availability
        let discount = guest.swipePassAtCashRegister()
        XCTAssertNil(discount) // Free Child Guest must not have any discount
        
        // Test access to ride priviledges
        let ridePriviledges = guest.swipePassAtRide()
        XCTAssertEqual(ridePriviledges, [.accessAllRides], "Guest must have access to all rides")
    }
    
    // MARK: - Tests to validate Hourly Employee
    
    func testIsValidHourlyEmployee() {
        let guest: Entrant = HourlyEmployee(firstName: firstName, lastName: lastName, address: correctAddress, dateOfBirth: adultDateOfBirth, socialSecurityNumber: SSN, service: .foodServices)
        
        // Test if info required are correct
        XCTAssertTrue(guest.isValidEntrant())
        
        // Test that at the moment of creation, guest has no pass
        XCTAssertNil(guest.accessPass)
        
        // Test that a pass is successfully assigned to the Entrant
        // and is of the same type of an entrant
        passBooth.assignPass(to: guest)
        XCTAssertTrue(guest.accessPass != nil)
        XCTAssertEqual(guest.accessPass?.passHolder.entrantType, .hourlyEmployeeFoodServices)
        
        // Test access to amusement areas
        var validation: AccessValidation = guest.swipePass(atRestrictedArea: .amusement)
        XCTAssertEqual(validation, AccessValidation.pass, "Hourly Employee must have access to amusement areas")
        
        // Test access to restricted areas
        validation = guest.swipePass(atRestrictedArea: .kitchen)
        XCTAssertEqual(validation, AccessValidation.pass, "Hourly Employee (food services) must have access to kitchen areas")
        
        // Test discount availability
        let discount = guest.swipePassAtCashRegister()
        let discountExpected = Discount(onFood: 15, onMerchandise: 25)
        XCTAssertEqual(discount!, discountExpected, "Hourly Employee must have 15% discount on food and 25% on merchandise")
        
        // Test access to ride priviledges
        let ridePriviledges = guest.swipePassAtRide()
        XCTAssertEqual(ridePriviledges, [.accessAllRides], "Hourly Employee must have access to all rides")
    }

    // MARK: - Tests to validate Managers
    
    func testIsValidManager() {
        let guest: Entrant = Manager(firstName: firstName, lastName: lastName, address: correctAddress, dateOfBirth: adultDateOfBirth, socialSecurityNumber: SSN, tier: .seniorManager)
        
        // Test if info required are correct
        XCTAssertTrue(guest.isValidEntrant())
        
        // Test that at the moment of creation, guest has no pass
        XCTAssertNil(guest.accessPass)
        
        // Test that a pass is successfully assigned to the Entrant
        // and is of the same type of an entrant
        passBooth.assignPass(to: guest)
        XCTAssertTrue(guest.accessPass != nil)
        XCTAssertEqual(guest.accessPass?.passHolder.entrantType, .manager)
        
        // Test access to amusement areas
        var validation: AccessValidation = guest.swipePass(atRestrictedArea: .amusement)
        XCTAssertEqual(validation, AccessValidation.pass, "Manager must have access to amusement areas")
        
        // Test access to restricted areas
        validation = guest.swipePass(atRestrictedArea: .office)
        XCTAssertEqual(validation, AccessValidation.pass, "Manager must have access to all areas")
        
        // Test discount availability
        let discount = guest.swipePassAtCashRegister()
        let discountExpected = Discount(onFood: 25, onMerchandise: 25)
        XCTAssertEqual(discount!, discountExpected, "Manager must have 25% discount on food and 25% on merchandise")
        
        // Test access to ride priviledges
        let ridePriviledges = guest.swipePassAtRide()
        XCTAssertEqual(ridePriviledges, [.accessAllRides], "Manager must have access to all rides")
    }
    
     // MARK: - Failing tests
    
//    func testNotValidFreeChildGuest() {
//        let guest: Entrant = FreeChildGuest(dateOfBirth: adultDateOfBirth)
//
//        // Test if info required are correct
//        XCTAssertTrue(guest.isValidEntrant())
//    }
//
//    func testInvalidAddress() {
//        let guest: Entrant = HourlyEmployee(firstName: firstName, lastName: lastName, address: failingAddress, dateOfBirth: adultDateOfBirth, socialSecurityNumber: SSN, service: .foodServices)
//
//        // Test if info required are correct
//        XCTAssertTrue(guest.isValidEntrant())
//    }
//}
