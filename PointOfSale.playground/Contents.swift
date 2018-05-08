//: Playground - noun: a place where people can play

import UIKit
import XCTest


//MARK: - TEST CASES
class CheckoutSystemTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCheckoutSystemExists() {
        XCTAssertNotNil(CheckoutSystem(), "Failed: Checkout System can't be nil")
    }
    
    func testTotalPriceOfEmptyCart() {
        let products: [Any] = [] //TODO: Refactor
        XCTAssertEqual(CheckoutSystem().totalPrice(products), 0, "Failed: Total price of empty cart should be zero")
    }
    
    /*
    func testTotalPriceOfSingleItemInCart() {
        
    }
    
    func testTotalPriceOfMutlipleItemsInCart() {
    }
    */
    
}

CheckoutSystemTests.defaultTestSuite.run()
