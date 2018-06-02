//
//  Command.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

protocol Command {
    @discardableResult func execute() -> Result
    @discardableResult func undo() -> Result
}
