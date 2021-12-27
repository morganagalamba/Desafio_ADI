//
//  FavoriteMovie+CoreDataProperties.swift
//  DesafioADI
//
//  Created by Morgana Galamba on 27/12/21.
//
//

import Foundation
import CoreData


extension FavoriteMovie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovie> {
        return NSFetchRequest<FavoriteMovie>(entityName: "FavoriteMovie")
    }

    @NSManaged public var movieId: Int64

}

extension FavoriteMovie : Identifiable {

}
