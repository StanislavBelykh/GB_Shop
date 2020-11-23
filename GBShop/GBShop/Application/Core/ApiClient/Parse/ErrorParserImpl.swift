//
//  ErrorParserImpl.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation

class ErrorParserImpl: ErrorParser {
    func parse(_ result: Error) -> Error {
        return result
    }
    
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? {
        return error
    }
}
