//
//  AppEntity.swift
//  Second Test siri app
//
//  Created by Travis Wadman on 6/19/24.
//




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
}
