//
//  File.swift
//  
//
//  Created by Wang Kunzhen on 10/8/21.
//

import Foundation

protocol BarManagerProtocol: ManagerProtocol {
    func bar()
}

class BarManager: BarManagerProtocol {
    static private(set) var initialisationCount: Int = 0
    
    private let fooManager: FooManagerProtocol
    
    let uuid = UUID().uuidString
    
    var userID: UInt64 { return fooManager.userID }
    
    init(fooManager: FooManagerProtocol) {
        self.fooManager = fooManager
        BarManager.initialisationCount += 1
    }
    
    func bar() {
        print("Bar")
    }
}

extension BarManager: FooManagerProtocol {
    func foo() {
        fooManager.foo()
    }
}
