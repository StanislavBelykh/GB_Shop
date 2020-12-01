//
//  ApiTests.swift
//  GBShopTests
//
//  Created by Станислав Белых on 30.11.2020.
//

import XCTest
@testable import GBShop

class ApiTests: XCTestCase {
    let requestFactory: RequestFactory = RequestFactoryImpl()
    
    private let userDataTest = RegistrationUserData(
        userId: 123,
        userName: "Somebody",
        password: "mypassword",
        email: "some@some.ru",
        gender: "m",
        creditCard: "9872389-2424-234224-234",
        bio: "This is good! I think I will switch to another language"
    )
    
    func testLogin() {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        requestFactory.makeAuthRequestFatory()
            .login(userName: "Somebod", password: "mypassword") { (response) in
                
                switch response.result {
                case .success(let result):
                    XCTAssertEqual(result.result, 1)
                case .failure:
                    XCTFail()
                }
                ex.fulfill()
            }
        
        wait(for: [ex], timeout: 10.0)
    }
    
    func testRegistration() {
        let ex = expectation(description: "Expecting a JSON data not nil")
        
        requestFactory.makeRegistrationReuestFactory()
            .registretion(userData: userDataTest) { response in
                XCTAssertNil(response.error)
                XCTAssertNotNil(response.result)
                ex.fulfill()
                
            }
        
        waitForExpectations(timeout: 10) { (error) in
            if let error = error {
                XCTFail("error: \(error)")
            }
        }
    }
}
