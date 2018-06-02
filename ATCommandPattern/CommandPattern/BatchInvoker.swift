//
//  MainInvoker.swift
//  ATCommandPattern
//
//  Created by Dejan on 02/06/2018.
//  Copyright © 2018 agostini.tech. All rights reserved.
//

import Foundation

class BatchInvoker: Invoker
{
    private enum Constants {
        static let BatchSize = 5
    }
    
    private var toBeExecuted: [Command] = [] {
        didSet {
            if toBeExecuted.count >= Constants.BatchSize {
                executeCommands()
            }
        }
    }
    
    private var finished: [Command] = []
    private var failed: [Command] = []
    
    func addCommand(command: Command) {
        toBeExecuted.append(command)
    }
    
    private func executeCommands() {
        toBeExecuted.forEach { (command) in
            if command.execute() == .success {
                finished.append(command)
            } else {
                failed.append(command)
            }
        }
        toBeExecuted.removeAll()
    }
}
