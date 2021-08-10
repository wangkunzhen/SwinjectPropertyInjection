//
//  FooManager.swift
//  
//
//  Created by Wang Kunzhen on 10/8/21.
//

import Foundation

protocol FooManagerProtocol: ManagerProtocol {
    func foo()
}

class FooManager: FooManagerProtocol {
    
    static private(set) var initialisationCount: Int = 0
    
    let uuid = UUID().uuidString
    let userID: UInt64
    
    init(userID: UInt64 = 0) {
        FooManager.initialisationCount += 1
        self.userID = userID
    }
    
    func foo() {
        print("foo")
    }
}
