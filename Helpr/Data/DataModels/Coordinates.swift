//
//  Coordinates.swift
//  Helpr
//
//  Created by Vincent Qian on 16/09/2021.
//

import Foundation
import CoreLocation
import MapKit

/// Structure qui permet permet de stocker les coordonnées
struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}

// Enumération à mettre dans les structures pour rendre les valeurs cryptable 
private enum CodingKeys: CodingKey {
    case latitude
    case longitude
}

//struct CustomMapAnnotation: Identifiable {
//
//    var id = UUID()
//    var latitude: Double
//    var longitude: Double
//    let annotationType : AnnotationType
//
//}




