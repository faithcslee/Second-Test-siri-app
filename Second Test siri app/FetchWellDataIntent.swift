//
//  FetchWellDataIntent.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/14/24.
//

import AppIntents

struct FetchWellDataIntent: AppIntent {
    static var title: LocalizedStringResource = "Fetch Well Data by Intent"
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


/* let wellDataArray = loadAndParseJSONData()
let specificWellDataArray = wellDataArray.filter { $0.wellName.contains(well.wellName) }

guard let specificWellData = specificWellDataArray.first else {
    return .result(value: "Well not found", dialog: "The well with name \(well.wellName) was not found.")
}

let specificWellProd = WellProd(wellData: specificWellData)
let productionValue = specificWellProd.production

return .result(value: "\(productionValue)", dialog: "The production value for well \(well.wellName) is \(productionValue).")



--------------------------------------------------------




// Fetch entities matching the wellName using WellProdQuery
let entities = try await WellProd.defaultQuery.entities(matching: well.wellName)

if let wellProd = entities.first {
    let dialog = IntentDialog("The production value for \(well) is \(wellProd.production).")
    return .result(value: "\(wellProd.production)", dialog: dialog)
} else {
    let dialog = IntentDialog("The production value for \(well) was not found.")
    return .result(value: "", dialog: dialog)
}*/

//-----------------------------------------------------



/*
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
*/







/*
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

*/
