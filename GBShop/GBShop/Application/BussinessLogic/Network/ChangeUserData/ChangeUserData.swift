//
//  ChangeUserData.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation
import Alamofire

class ChangeUserData: RequestBuilder {
    let errorParser: ErrorParser
    let sessionManager: Session
    let queue: DispatchQueue
    let baseUrl = URL(string: "https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/")!
    
    init(
        errorParser: ErrorParser,
        sessionManager: Session,
        queue: DispatchQueue = DispatchQueue.global(qos: .utility)) {
        self.errorParser = errorParser
        self.sessionManager = sessionManager
        self.queue = queue
    }
}

extension ChangeUserData: ChangeUserDataRequestFactory {
    func changeUserData(_ userData: RegistrationUserData, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void) {
        let requestModel = ChangeUserData(
            baseUrl: baseUrl,
            userId: userData.userId,
            userName: userData.userName,
            password: userData.password,
            email: userData.email,
            gender: userData.gender,
            creditCard: userData.creditCard,
            bio: userData.bio
        )
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ChangeUserData {
    struct ChangeUserData: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "changeUserData.json"
        
        let userId: Int
        let userName: String
        let password: String
        let email: String
        let gender: String
        let creditCard: String
        let bio: String
        var parameters: Parameters? {
            return [
                "id_user": userId,
                "username": userName,
                "password": password,
                "email": email,
                "gender": gender,
                "credit_card": creditCard,
                "bio" : bio
            ]
        }
    }
}
