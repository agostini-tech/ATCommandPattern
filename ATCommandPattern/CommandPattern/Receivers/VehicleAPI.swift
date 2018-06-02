//
//  AddVehicleAPI.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

enum VehicleAPIError: Error {
    case APIError
}

class VehicleAPI
{
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func sendToBackend() -> Result {
        print("Sending the vehicle '\(vehicle.name)' to backend!")
        
        // Simulate failure
        let success = false//Bool.random
        print("Random success: ", success)
        if success == true {
            print("Success")
            return .success
        } else {
            print("Failure")
            return .failure(VehicleAPIError.APIError)
        }
    }
    
    func deleteFromBackend() -> Result {
        print("Deleted the vehicle '\(vehicle.name)' from the backend")
        return .success
    }
}
