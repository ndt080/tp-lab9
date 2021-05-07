import SwiftUI
import CoreData

class LMAModel: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double
}

extension LMAModel {
    @nonobjc public class func getAll() -> NSFetchRequest<LMAModel> {
        let request: NSFetchRequest<LMAModel> = LMAModel.fetchRequest() as! NSFetchRequest<LMAModel>
        request.sortDescriptors = []
        return request
    }
}

