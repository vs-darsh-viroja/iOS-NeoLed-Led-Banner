//
//  CoreDataManager.swift
//  NeoLed
//
//  Created by Purvi Sancheti on 02/10/25.
//

import Foundation
import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    private var ctx: NSManagedObjectContext { PersistenceController.shared.container.viewContext }
}
