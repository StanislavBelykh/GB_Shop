//
//  TestRequest.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation

class TestRequest {
    let requestFactory: RequestFactory
    
    private let userDataTest = RegistrationUserData(
        userId: 123,
        userName: "Somebody",
        password: "mypassword",
        email: "some@some.ru",
        gender: "m",
        creditCard: "9872389-2424-234224-234",
        bio: "This is good! I think I will switch to another language"
    )
    
    init(requestFactory: RequestFactory) {
        self.requestFactory = requestFactory
    }
    
    func testRequests() {
        requestFactory.makeAuthRequestFatory()
            .login(userName: "Somebod", password: "mypassword") { response in
                switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
        requestFactory.makeLogoutRequestFactory()
            .logout(userId: 123) { response in
                switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        
        requestFactory.makeRegistrationReuestFactory()
            .registretion(userData: userDataTest) { response in
                switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        requestFactory.makeChangeUserDataFactory()
            .changeUserData(userDataTest) { response in
                switch response.result {
                case .success(let login):
                    print(login)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
