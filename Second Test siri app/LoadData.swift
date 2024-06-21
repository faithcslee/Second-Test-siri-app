//
//  LoadData.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/14/24.
//

import Foundation

struct WellData: Identifiable {
    let id: UUID
    let wellName: String
    let date: String
    let production: Int
}

func loadAndParseJSONData() -> [WellData] {
    guard let url = Bundle.main.url(forResource: "sampleProdData", withExtension: "json") else {
        print("File not found")
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        guard let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[Any]] else {
            print("Failed to convert JSON data to array")
            return []
        }
        
        let wellDataArray = jsonArray.compactMap { entry -> WellData? in
            if entry.count >= 3,
               let wellName = entry[0] as? String,
               let date = entry[1] as? String,
               let production = entry[2] as? Int {
                return WellData(id: UUID(), wellName: wellName, date: date, production: production)
            }
            return nil
        }
        
        return wellDataArray
    } catch {
        print("Error reading or parsing the JSON file: \(error)")
        return []
    }
}

/*
import Foundation

func loadAndParseJSONData() -> [WellData]? {
    // Get the URL for the JSON file
    guard let url = Bundle.main.url(forResource: "sampleProdData", withExtension: "json") else {
        print("File not found")
        return nil
    }
    
    do {
        // Load the data from the file
        let data = try Data(contentsOf: url)
        
        // Convert the data to a JSON object
        guard let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[Any]] else {
            print("Failed to convert JSON data to array")
            return nil
        }
        
        // Map the JSON array to an array of WellData structs
        let wellDataArray = jsonArray.compactMap { entry -> WellData? in
            if entry.count >= 3,
               let wellName = entry[0] as? String,
               let date = entry[1] as? String,
               let production = entry[2] as? Int {
                return WellData(
                    wellName: wellName,
                    date: date,
                    production: production
                )
            }
            return nil
        }
        
        return wellDataArray
    } catch {
        print("Error reading or parsing the JSON file: \(error)")
        return nil
    }
}
    
*/
