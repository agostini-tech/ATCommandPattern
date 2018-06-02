//
//  LogVehicleCommand.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

class LogVehicleCommand: Command
{
    private let logger: VehicleLogger
    
    init(logger: VehicleLogger) {
        self.logger = logger
    }
    
    func execute() -> Result {
        self.logger.appendToLogfile()
        return .success
    }
    
    func undo() -> Result {
        print("Cannot undo a logging operation")
        return .success
    }
}
