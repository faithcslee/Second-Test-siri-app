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

func didUpdateParameters() {
    FetchValueShortcuts.updateAppShortcutParameters()
}

