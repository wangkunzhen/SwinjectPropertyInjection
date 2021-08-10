//
//  File.swift
//  
//
//  Created by Wang Kunzhen on 10/8/21.
//

import Foundation
import SwinjectPropertyInjection

class Host1 {
    @Injected var fooManager: FooManagerProtocol
}

class Host2 {
    @Injected var fooManager: FooManagerProtocol?
}

class Host3 {
    @OptionalInjected var fooManager: FooManagerProtocol?
}

class Host4 {
    @Injected(name: "FooManager1") var fooManager: FooManagerProtocol
}

class Host5 {
    @Injected(argument: UInt64(1)) var fooManager: FooManagerProtocol
}
