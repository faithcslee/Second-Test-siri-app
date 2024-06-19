//
//  FetchWellDataIntent.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/14/24.
//

import AppIntents

struct FetchWellDataIntent: AppIntent {
    static var title: LocalizedStringResource = "Fetch Well Data by Intent"
    static var description = IntentDescription("Fetches the production value for a given well Name from a JSON file.")

    @Parameter(title: "Well Name")
    var wellName: String

    static var parameterSummary: some ParameterSummary {
        Summary("Fetch value for \(\.$wellName)")
    }
    
    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
        let currentFilePath = URL(fileURLWithPath: #file) //says file doesnt exist
        // Get the directory of the current script
        let currentDirectory = currentFilePath.deletingLastPathComponent()
        // Construct the file URL for the JSON file
        let fileURL = currentDirectory.appendingPathComponent("sampleProdData.json")
        
        // Load the JSON file
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Unable to load the JSON file.")
        }
                
        // Decode the JSON data
        guard let productionDataArray = try? JSONDecoder().decode([[String]].self, from: data) else {
            fatalError("Unable to decode the JSON data.")
        }
        
        var value:String?
        for well in productionDataArray{
            if well[0] == wellName {
                value = well[2]
                break
            }
            
        }

        //let dialog = IntentDialog("The production value for \(wellName) is \(value).")

       // return .result(value: "\(value)", dialog: dialog)
        
        if let foundValue = value {
            let dialog = IntentDialog("The production value for \(wellName) is \(foundValue).")
            return .result(value: foundValue, dialog: dialog)
        } else {
            let dialog = IntentDialog("The production value for \(wellName) was not found.")
            return .result(value: "", dialog: dialog)
        }
    }
}

