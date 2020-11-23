//
//  RegistrationRequestFactory.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation
import Alamofire

protocol RegistrationRequestFactory {
    func registretion(userData: RegistrationUserData, completionHandler: @escaping (AFDataResponse<RegistrationResult>) -> Void)
}
