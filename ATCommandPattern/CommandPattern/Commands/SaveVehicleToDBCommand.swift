//
//  SaveVehicleToDBCommand.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

class SaveVehicleToDBCommand: Command
{
    private let vehicleDAO: VehicleDAO
    
    init(dao: VehicleDAO) {
        self.vehicleDAO = dao
    }
    
    func execute() -> Result {
        return self.vehicleDAO.saveToDatabase()
    }
    
    func undo() -> Result {
        return self.vehicleDAO.delete()
    }
}
