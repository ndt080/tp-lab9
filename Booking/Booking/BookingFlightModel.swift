import SwiftUI
import CoreData

class BookingFlight: NSManagedObject, Identifiable {
    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public var price: String
    @NSManaged public var toId: UUID
    @NSManaged public var fromId: UUID
    @NSManaged public var timeStart: String
    @NSManaged public var duration: String
}

extension BookingFlight {
    @nonobjc public class func getAll() -> NSFetchRequest<BookingFlight> {
        let request: NSFetchRequest<BookingFlight> = LMAModel.fetchRequest() as! NSFetchRequest<BookingFlight>
        request.sortDescriptors = []
        return request
    }
}

