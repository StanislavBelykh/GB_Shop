//
//  AuthRequestFactory.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation
import Alamofire

protocol AuthRequestFactory {
    func login(userName: String, password: String, completionHandler: @escaping (AFDataResponse<LoginResult>) -> Void)
}
