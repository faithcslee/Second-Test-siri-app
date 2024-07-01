//
//  AppShortcutProvider.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/19/24.
//


import AppIntents

class FetchValueShortcuts: AppShortcutsProvider {

    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: FetchWellDataIntent(),
            phrases: ["Get production for \(\.$well) in \(.applicationName)"],
            shortTitle: "Fetch Production",
            systemImageName: "magnifyingglass.circle"
        )
    }
}

// We need to update parameters when values have changed, also when the app is first launched:
func didUpdateParameters() {
    FetchValueShortcuts.updateAppShortcutParameters()
}

