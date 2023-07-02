//
//  GithabluApp.swift
//  Githablu
//
//  Created by Rezaul Islam on 28/6/23.
//

import SwiftUI

@main
struct GithabluApp: App {
    init(){
        Dependency()
    }
    
    var body: some Scene {
        WindowGroup {
            UserListView()
        }
    }
}
