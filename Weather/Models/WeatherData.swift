//  Weather Accenture
//
//  Created by BilalSattar on 10/03/2018.
//  Copyright © 2018 Bilal. All rights reserved.
//

// JSON Response
//{"coord":{"lon":139,"lat":35},
//    "sys":{"country":"JP","sunrise":1369769524,"sunset":1369821049},
//    "weather":[{"id":804,"main":"clouds","description":"overcast clouds","icon":"04n"}],
//    "main":{"temp":289.5,"humidity":89,"pressure":1013,"temp_min":287.04,"temp_max":292.04},
//    "wind":{"speed":7.31,"deg":187.002},
//    "rain":{"3h":0},
//    "clouds":{"all":92},
//    "dt":1369824698,
//    "id":1851632,
//    "name":"Shuzenji",
//    "cod":200}
import Foundation
import RealmSwift
import Realm

class Main :RealmSwift.Object, Codable {
   
    @objc dynamic  var temp : Double = 0.0
    @objc dynamic  var humidity : Int = 0
    @objc dynamic  var pressure : Int = 0
    @objc dynamic  var temp_min : Double = 0.0
    @objc dynamic  var temp_max : Double = 0.0
//    @objc dynamic  var requestDate : Date = Date()
    
   convenience init(temp: Double, humidity: Int, pressure: Int, temp_min: Double, temp_max: Double) {
        self.init()
        self.temp = temp
        self.humidity = humidity
        self.pressure = pressure
        self.temp_min = temp_min
        self.temp_max = temp_max
 //       self.requestDate = requestDate
    }
    
    private enum MainCodingKeys: String, CodingKey {
        case temp
        case humidity
        case pressure
        case temp_min
        case temp_max
    }
}

enum CodingKeys: String, CodingKey {
    case main
}

class Weather: RealmSwift.Object, Codable {
    
    var main: Main?
    convenience init(main: Main) {
        self.init()
        self.main = main
        
    }
}
