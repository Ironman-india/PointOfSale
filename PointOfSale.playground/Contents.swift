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
    
    func price() -> Double {
        switch self {
            case .apple: return 60/100
            case .orange: return 25/100 
        }
    }
    
    var discountType: DiscountType {
        switch self {
        case .apple:
            return .buyOneGetOneFree
        case .orange:
            return .threeForPriceOfTwo
        }
    }
}

public enum DiscountType: Int {
    case buyOneGetOneFree
    case threeForPriceOfTwo
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
        
        var totalPrice: Double = 0
        
        // All the products in Catalog
        let catalog: [Products] = [.orange,.apple] 
        
        for product in catalog  {
            var totalPriceOfProduct = products
                .filter({$0 == product})
                .reduce(0, {$0 + $1.price()})
            
            let productCount = products.filter { $0 == product }.count
            switch product.discountType {
            case .buyOneGetOneFree:
                totalPriceOfProduct -= Double(Int(productCount/2)) * product.price()
            case .threeForPriceOfTwo:
                totalPriceOfProduct -= Double(Int(productCount/3)) * product.price()
            }
            totalPrice += totalPriceOfProduct
        }
        
        return totalPrice
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
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0, accuracy:1e-7, "Failed: Total price of empty cart should be zero")
    }
    
    
    func testTotalPriceOfSingleItemInCart() {
        var products:[Products] = [.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.6, accuracy:1e-7, "Failed: Total price of single product in cart should be \(0.6)")
        
        products = [.orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.25, accuracy:1e-7, "Failed: Total price of single product in cart should be \(0.25)")
    }
    

    func testTotalPriceOfMutlipleItemsInCart() {
        var products:[Products] = [.apple, .orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.85, accuracy:1e-7, "Failed: Total price of products in cart should be \(0.85)")
        
        products = [.apple, .apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.6, accuracy:1e-7, "Failed: Total price of products in cart should be \(0.6)")
        
        products = [.orange, .orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.5, accuracy:1e-7, "Failed: Total price of products in cart should be \(0.5)")
        
        products = [.apple, .apple, .orange, .orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 1.1, accuracy:1e-7, "Failed: Total price of products in cart should be \(1.1)")
    }
}


extension CheckoutSystemTests {
    func testDiscountedPriceOfSingleTypeOfProductInCart() {
        var products:[Products] = [.apple, .apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.6,accuracy:1e-7, "Failed: Discount applied. Total price of products in cart should be \(0.6)")
    
        products = [.apple,.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 1.2,accuracy: 1e-7, "Failed: Discount applied. Total price of products in cart should be \(1.2)")
        
        products = [.apple,.apple,.apple,.apple]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 1.2,accuracy: 1e-7, "Failed: Discount applied. Total price of products in cart should be \(1.2)")
        
        products = [.orange, .orange, .orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.5,accuracy:1e-7, "Failed: Discount applied. Total price of products in cart should be \(0.5)")
        
        products = [.orange, .orange, .orange, .orange]
        XCTAssertEqual(CheckoutSystem().totalPrice(of: products), 0.75,accuracy:1e-7, "Failed: Discount applied. Total price of products in cart should be \(0.75)")
    }    
}

CheckoutSystemTests.defaultTestSuite.run()

