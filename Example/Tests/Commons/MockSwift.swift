//
//  MockSwift.swift
//  AndesUI_Tests
//
//  Created by JONATHAN DANIEL BANDONI on 12/08/2020.
//  Copyright © 2020 MercadoLibre. All rights reserved.
//

import XCTest
import Foundation

protocol Mock {
    func totalNumberOfCalls() -> Int
}

struct MockCounter {
    var timesCalled: Int

    init() {
        timesCalled = 0
    }

    mutating func wasCalled() {
        timesCalled += 1
    }
}

extension Mock {
    func totalNumberOfCalls() -> Int {
        var numberOfTimes = 0
        var mirror: Mirror? = Mirror(reflecting: self)
        while let mirrored = mirror {
            print("evaluating calls in: \(mirrored.subjectType)")
            for (name, value) in mirrored.children {
                guard let counter = value as? MockCounter, counter.timesCalled > 0, let name = name else { continue }
                numberOfTimes += counter.timesCalled
                print("\(name) was called: \(counter.timesCalled)")
            }
            mirror = mirrored.superclassMirror
        }
        return numberOfTimes
    }
}

class MockSwift {
    static func verify(_ timesCalled: @autoclosure () -> MockCounter, wasCalledTimes timesExpected: Int = 1) {
        XCTAssert(timesCalled().timesCalled == timesExpected)
    }

    static func verify<M: Mock>(_ mock: @autoclosure () -> M, wasCalledTimes timesExpected: Int = 1) {
        XCTAssert(mock().totalNumberOfCalls() == timesExpected)
    }

    static func verifyZeroInteractions(_ timesCalled: @autoclosure () -> MockCounter) {
        XCTAssert(timesCalled().timesCalled == 0)
    }

    static func verifyZeroInteractions<M: Mock>(_ mock: @autoclosure () -> M) {
        XCTAssert(mock().totalNumberOfCalls() == 0)
    }

    private static func assertNumberOfTimesCalled<M: Mock>(_ mock: @autoclosure () -> M, wasCalledTimes timesExpected: Int = 1) {
        XCTAssert(mock().totalNumberOfCalls() == timesExpected)
    }
}
