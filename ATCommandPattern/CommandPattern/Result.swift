//
//  Result.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

enum Result: Equatable
{
    case success
    case failure(Error)
    
    static func == (lhs: Result, rhs: Result) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success):
            return true
        case (let .failure(error1), let .failure(error2)):
            return String(describing: error1) == String(describing: error2)
        default:
            return false
        }
    }
}
