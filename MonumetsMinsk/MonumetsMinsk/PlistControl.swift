import SwiftUI
import UIKit

func GetMonumentsWithPlist() -> [Monument]{
    var config: [Monument] = []
    if let infoPlistPath = Bundle.main.url(forResource: "Monuments", withExtension: "plist") {
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            if let arr = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String:AnyObject] {
                print(arr)
                for (key, value) in arr{
                    let obj = Monument(
                        id: Int(key)!,
                        name: value["name"] as! String,
                        year: value["year"] as! Date,
                        authorId: value["authorID"] as! Int,
                        description: value["description"] as! String,
                        image: value["image"] as! String
                    )
                    config.append(obj)
                }
            }
            
        } catch {
            print(error)
        }
    }
    return config
}

func GetSculptorsWithPlist() -> [Sculptor]{
    var config: [Sculptor] = []
    if let infoPlistPath = Bundle.main.url(forResource: "Sculptors", withExtension: "plist") {
        do {
            let infoPlistData = try Data(contentsOf: infoPlistPath)
            if let arr = try PropertyListSerialization.propertyList(from: infoPlistData, options: [], format: nil) as? [String:AnyObject] {
                print(arr)
                for (key, value) in arr{
                    let obj = Sculptor(
                        id: Int(key)!,
                        name: value["name"] as! String,
                        datebirth: value["datebirth"] as! Date
                    )
                    config.append(obj)
                }
            }
            
        } catch {
            print(error)
        }
    }
    return config
}
