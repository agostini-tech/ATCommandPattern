//
//  AddVehicleCommand.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

class AddVehicleAPICommand: Command
{
    private var vehicleAPI: VehicleAPI
    
    init(api: VehicleAPI) {
        self.vehicleAPI = api
    }
    
    func execute() -> Result {
        return self.vehicleAPI.sendToBackend()
    }
    
    func undo() -> Result {
        return self.vehicleAPI.deleteFromBackend()
    }
}
