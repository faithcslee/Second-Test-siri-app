//
//  Second_Test_siri_appApp.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/14/24.
//

import SwiftUI

@main
struct Second_Test_siri_appApp: App {
    init() {
        didUpdateParameters() // Siri won't recognize app shortcut phrases without calling this method
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
