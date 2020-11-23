//
//  Di.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation

final class Di {
    fileprivate let requestFactory: RequestFactory
    
    fileprivate var testRequest: TestRequest {
        return TestRequest(requestFactory: requestFactory)
    }
    
    init() {
        requestFactory = RequestFactoryImpl()
    }
}

protocol AppTestable {
    func testRequests()
}

extension Di: AppTestable {
    func testRequests() {
        testRequest.testRequests()
    }
}

protocol RequestFactory {
    func makeAuthRequestFatory() -> AuthRequestFactory
    func makeRegistrationReuestFactory() -> RegistrationRequestFactory
    func makeLogoutRequestFactory() -> LogoutRequestFactory
    func makeChangeUserDataFactory() -> ChangeUserDataRequestFactory
}
