//
//  FireStationAnnotation.swift
//  Helpr
//
//  Created by Vincent Qian on 21/09/2021.
//

import Foundation

class FireStationAnnotation : Annotation {
    
    
    init(data: String, latitude : Double, longitude: Double) {
        super.init(annotationType : AnnotationType.FireStation, latitude: latitude , longitude: longitude  )
    }
    
}
