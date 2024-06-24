//
//  AppEntity.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/19/24.
//

import AppIntents
import Foundation

struct WellProd: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Well"
    
    static var defaultQuery = WellProdQuery()

    var id: WellData.ID
    
    @Property(title: "Well Name")
    var wellName: String

    @Property(title: "Date")
    var date: String

    @Property(title: "Production")
    var production: Int
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            title: "\(wellName)",
            subtitle: "\(date)",
            image: DisplayRepresentation.Image(named: "magnifyingglass.circle")
        )
    }
    
    init(well: WellData) {
        self.id = well.id
        self.wellName = well.wellName
        self.date = well.date
        self.production = well.production
    }
}

struct WellProdQuery: EntityQuery {
    func entities(for identifiers: [WellProd.ID]) async throws -> [WellProd] {
        let wellDataArray = loadAndParseJSONData()
        return wellDataArray.filter { identifiers.contains($0.id) }.map(WellProd.init)
    }

    func suggestedEntities() async throws -> [WellProd] {
        let wellDataArray = loadAndParseJSONData()
        return wellDataArray.map(WellProd.init)
    }

    func entities(matching query: String) async throws -> [WellProd] {
        let wellDataArray = loadAndParseJSONData()
        return wellDataArray.filter { $0.wellName.contains(query) }.map(WellProd.init)
    }
}




/*
import AppIntents

struct WellProd: AppEntity, Identifiable {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Well Production")

    @Property(title: "Well Name")
    var wellName: String

    @Property(title: "Date")
    var date: String

    @Property(title: "Production")
    var production: Int

    // Unique identifier
    var id: String {
        wellName
    }

    // Required initializer
    init() {
        self.wellName = ""
        self.date = ""
        self.production = 0
    }

    init(wellName: String, date: String, production: Int) {
        self.wellName = wellName
        self.date = date
        self.production = production
    }

    static var defaultQuery = WellProdQuery()

}

struct WellProdQuery: EntityQuery {
    func entities(matching query: String) throws -> [WellProd] {
        // Load and parse JSON data
        guard let wellDataArray = loadAndParseJSONData() else {
            return []
        }

        return wellDataArray.filter { wellData in
            wellData.wellName.contains(query)
        }.map { wellData in
            WellProd(wellName: wellData.wellName, date: wellData.date, production: wellData.production)
        }
    }

}

*/

/*
import Foundation
import AppIntents
import SwiftData

struct WellProd: AppEntity {
    static var typeDisplayRepresentation : TypeDisplayRepresentation = "Well Production"
    
    static var defaultQuery = WellProdQuery()

    @Property(title: "Well Name")
    var wellName: String

    let date: String

    let production: Int

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(
            wellName: "\(wellName)"
        )
    }

    init(swiftDataModel: WellData) {
        self.wellName = swiftDataModel.wellName
        self.date = swiftDataModel.date
    }
}


struct WishEntityQuery: EntityQuery {
    func entities(matching query: String) throws -> [WellProd] {
        // Example data
        let allWells = [
            WellProd(wellName: "Well A", date: "2024-06-18", production: 100),
            WellProd(wellName: "Well B", date: "2024-06-17", production: 200)
        ]

        // Filter based on wellName
        return allWells.filter { well in
            well.wellName.contains(query)
        }
    }

    func entity(for id: WellProd.ID) throws -> WellProd? {
        // Example data
        let allWells = [
            WellProd(wellName: "Well A", date: "2024-06-18", production: 100),
            WellProd(wellName: "Well B", date: "2024-06-17", production: 200)
        ]
        
        return allWells.first { $0.id == id }
    }

    func suggestedEntities() throws -> [WellProd] {
        // Suggested data
        return [
            WellProd(wellName: "Well A", date: "2024-06-18", production: 100),
            WellProd(wellName: "Well B", date: "2024-06-17", production: 200)
        ]
    }
}

*/
