//
//  VehicleDAO.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

class VehicleDAO
{
    private let vehicle: Vehicle
    
    init(vehicle: Vehicle) {
        self.vehicle = vehicle
    }
    
    func saveToDatabase() -> Result {
        print("Saved the vehicle '\(vehicle.name)' to DB!")
        return .success
    }
    
    func delete() -> Result {
        print("Deleted the vehicle '\(vehicle.name)' from database")
        return .success
    }
}
