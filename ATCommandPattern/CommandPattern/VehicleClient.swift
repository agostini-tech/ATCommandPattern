//
//  VehicleClient.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

class VehicleClient
{
    // This would be your normal controller, you'll have your business logic here.
    // Among other things this class will creat your commands and pass them to the invoker.
    
    private let invoker = BatchInvoker()
    
    func startTesting() {
        
        // Just sending a vehicle to the API
        let vehicle = ATVehicle(id: 1, name: "first vehicle")
        let apiReceiver = VehicleAPI(vehicle: vehicle)
        let addVehicleCommand = AddVehicleAPICommand(api: apiReceiver)
        invoker.addCommand(command: addVehicleCommand)
        
        let dbReceiver = VehicleDAO(vehicle: vehicle)
        let saveVehicleCommand = SaveVehicleToDBCommand(dao: dbReceiver)
        invoker.addCommand(command: saveVehicleCommand)
        
        let logReceiver = VehicleLogger(vehicle: vehicle)
        let logVehicleCommand = LogVehicleCommand(logger: logReceiver)
        invoker.addCommand(command: logVehicleCommand)
        
        let addVehicleTransactionCommand = TransactionCommand(commands:
            [
                LogVehicleCommand(logger: logReceiver),
                SaveVehicleToDBCommand(dao: dbReceiver),
                AddVehicleAPICommand(api: apiReceiver),
                LogVehicleCommand(logger: logReceiver)
            ])
        invoker.addCommand(command: addVehicleTransactionCommand)
        
        let anotherLogReceiver = VehicleLogger(vehicle: ATVehicle(id: 2, name: "Another Vehicle"))
        let secondLogCommand = LogVehicleCommand(logger: anotherLogReceiver)
        invoker.addCommand(command: secondLogCommand)
    }
}
