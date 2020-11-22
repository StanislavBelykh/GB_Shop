//
//  ErrorParser.swift
//  GBShop
//
//  Created by Станислав Белых on 22.11.2020.
//

import Foundation

protocol ErrorParser {
    func parse(_ result: Error) -> Error
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error?
}
