//
//  ProductList.swift
//  GBShop
//
//  Created by Станислав Белых on 30.11.2020.
//

import Foundation
import Alamofire

class ProductList: RequestBuilder {
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

extension ProductList: ProductListRequestFactory {
    func getProductList(_ pageNumber: Int, categoryId: Int, completionHandler: @escaping (AFDataResponse<ProductListResult>) -> Void) {
        let requestModel = ProductList(
            baseUrl: baseUrl,
            pageNumber: pageNumber,
            categoryId: categoryId
        )
        self.request(request: requestModel, completionHandler: completionHandler)
    }
}

extension ProductList {
    struct ProductList: RequestRouter {
        let baseUrl: URL
        let method: HTTPMethod = .get
        let path: String = "catalogData.json"
        
        let pageNumber: Int
        let categoryId: Int

        var parameters: Parameters? {
            return [
                "page_number": pageNumber,
                "id_category": categoryId
            ]
        }
    }
}
