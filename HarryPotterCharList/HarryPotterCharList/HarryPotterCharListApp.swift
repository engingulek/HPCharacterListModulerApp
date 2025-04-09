//
//  HarryPotterCharListApp.swift
//  HarryPotterCharList
//
//  Created by Engin Gülek on 9.04.2025.
//

import SwiftUI
import HPNavigationKit
import HPModularProtocolsKit
import DependencyKit
import HPHomeModule
import HPDetailModule
@main
struct HarryPotterCharListApp: App {
    @StateObject private var navigation = Navigation()
    init() {
        let container = DependencyRegister.shared.container
        container.register(HomeModuleProrocol.self) { resolver in
            HomeModule()
            
        }
        
        container.register(DetailModuleProrocol.self) { resolver in
            HPDetailModule()
        }
    }
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigation.path) {
                navigation.build(page: .home)
                    .navigationDestination(for: Page.self) { page in
                        navigation.build(page: page)
                    }
            }
            .environmentObject(navigation)
        }
    }
}
