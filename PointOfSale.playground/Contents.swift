//: Playground - noun: a place where people can play

import UIKit
import XCTest

//MARK :- Products
/* Enumeration Products
 *
 *  It catalogs the details of product for sale.
 */
public enum Products: String {
    case apple = "Apple"
    case orange = "Orange"
}

//MARK :- CheckoutSystem
/*
 * Structure CheckoutSystem
 *
 * Implements public apis to for retrieve pricing of products in cart, number of products in cart, etc.
 */
struct CheckoutSystem {

    // API
    public func totalPrice(of products:[Products]) -> Double {
        return 0
    }
}

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
        let products: [Products] = []
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0, "Failed: Total price of empty cart should be zero")
    }
    
    
    func testTotalPriceOfSingleItemInCart() {
        var products:[Products] = [.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.6, "Failed: Total price of single product in cart should be \(0.6)")
        
        products = [.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.25, "Failed: Total price of single product in cart should be \(0.25)")
    }
    
    /*
    func testTotalPriceOfMutlipleItemsInCart() {
    }
    */
    
}

CheckoutSystemTests.defaultTestSuite.run()

