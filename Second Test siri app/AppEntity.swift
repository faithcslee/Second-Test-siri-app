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
    let wellDataArray = loadAndParseJSONData()
    func entities(for identifiers: [WellProd.ID]) async throws -> [WellProd] {
        return wellDataArray.filter { identifiers.contains($0.id) }.map(WellProd.init)
    }

    func suggestedEntities() async throws -> [WellProd] {
        return wellDataArray.map(WellProd.init)
    }

    func entities(matching query: String) async throws -> [WellProd] {
        return wellDataArray.filter { $0.wellName.contains(query) }.map(WellProd.init)
    }
}

/* logging errors:
struct WellProdQuery: EntityQuery {
    let wellDataArray = loadAndParseJSONData()
    
    func entities(for identifiers: [WellProd.ID]) async throws -> [WellProd] {
        let result = wellDataArray.filter { identifiers.contains($0.id) }.map(WellProd.init)
        print("Entities for identifiers \(identifiers): \(result)")
        return result
    }

    func suggestedEntities() async throws -> [WellProd] {
        let result = wellDataArray.map(WellProd.init)
        print("Suggested Entities: \(result)")
        return result
    }

    func entities(matching query: String) async throws -> [WellProd] {
        let result = wellDataArray.filter { $0.wellName.contains(query) }.map(WellProd.init)
        print("Entities matching query '\(query)': \(result)")
        return result
    }
}
*/
