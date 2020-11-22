//
//  ChangeuserDataRequestFactory.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation
import Alamofire

protocol ChangeUserDataRequestFactory {
    func changeUserData(_ userData: RegistrationUserData, completionHandler: @escaping (AFDataResponse<ChangeUserDataResult>) -> Void)
}

