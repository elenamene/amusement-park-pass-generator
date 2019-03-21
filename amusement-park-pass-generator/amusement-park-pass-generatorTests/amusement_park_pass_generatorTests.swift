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

    func testIsValidGuest() {
        let newGuest = ClassicGuest()
        let passGenerator = PassGenerator()
        passGenerator.getPass(for: newGuest)
    }

}
