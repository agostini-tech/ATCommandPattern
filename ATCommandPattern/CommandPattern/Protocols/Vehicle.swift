//
//  Vehicle.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

protocol Vehicle {
    var vehicleID: Int { get }
    var name: String { get set }
}

class ATVehicle: Vehicle {
    var vehicleID: Int
    var name: String
    
    init(id: Int, name: String) {
        self.vehicleID = id
        self.name = name
    }
}
