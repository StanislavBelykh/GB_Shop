//
//  ProductListRequestFactory.swift
//  GBShop
//
//  Created by Станислав Белых on 30.11.2020.
//

import Foundation
import Alamofire

protocol ProductListRequestFactory {
    func getProductList(_ pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void)
}
