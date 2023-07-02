//
//  DependencyInjector.swift
//  Githablu
//
//  Created by Rezaul Islam on 1/7/23.
//

import Foundation
import SwiftUI

struct DependencyInjector {
    private static var dependencyList: [String:Any] = [:]
    private static var dependencyListState: [ObjectIdentifier: Any] = [:]
    
    
    static func resolve<T>() -> T {
        guard let t = dependencyList[String(describing: T.self)] as? T else {
            fatalError("No povider registered for type \(T.self)")
        }
        return t
    }
    
    static func register<T>(dependency: T) {
        dependencyList[String(describing: T.self)] = dependency
    }
    

}


@propertyWrapper struct Inject<T> {
    var wrappedValue: T
    
    init() {
        self.wrappedValue = DependencyInjector.resolve()
    }
}

@propertyWrapper struct Provider<T> {
    var wrappedValue: T
    
    init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        DependencyInjector.register(dependency: wrappedValue)
    }
}
