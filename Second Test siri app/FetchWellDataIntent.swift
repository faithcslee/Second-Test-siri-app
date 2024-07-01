//
//  FetchWellDataIntent.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/14/24.
//

import AppIntents

struct FetchWellDataIntent: AppIntent {
    static var title: LocalizedStringResource = "Fetch Production"
    static var description = IntentDescription("Fetches the production value for a given well name from a JSON file.")
    
    @Parameter(title: "Well")
    var well: WellProd
    
    static var parameterSummary: some ParameterSummary {
        Summary("Fetch value for \(\.$well)")
    }
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
            print("Fetching data for well: \(well.wellName)")
            
            let entities = try await WellProd.defaultQuery.entities(matching: well.wellName)
            
            if let wellProd = entities.first {
                let dialog = IntentDialog("The production value for \(well.wellName) is \(wellProd.production).")
                print("Production value found: \(wellProd.production)")
                return .result(value: "\(wellProd.production)", dialog: dialog)
            } else {
                let dialog = IntentDialog("The production value for \(well.wellName) was not found.")
                print("Production value not found for \(well.wellName)")
                return .result(value: "", dialog: dialog)
            }
        }
}

