import SwiftUI

class Monument {
    var id: Int
    var name: String
    var year : Date
    var authorId : Int
    var description : String
    var image : String
    

    init(id: Int, name: String, year: Date, authorId: Int, description: String, image: String) {
        self.id = id
        self.name = name
        self.year = year
        self.authorId = authorId
        self.description = description
        self.image = image
    }
}
