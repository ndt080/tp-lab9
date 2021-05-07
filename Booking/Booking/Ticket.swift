import SwiftUI

class Ticket {
    var id: UUID
    var firstName: String
    var lastName: String
    var date: Date
    var flight: BookingFlight
    
    init(firstName: String, lastName: String, date: Date, flight: BookingFlight){
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.date = date
        self.flight = flight
    }
}
